using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.ComponentModel;
using System.IO;
using System.Configuration;
using System.Net;
using System.Net.Mail;



namespace WarmHearts.User
{
    public partial class MoneyDonation : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string don_Email;

        override protected void OnInit(EventArgs e)
        {

            InitializeComponent();

            this.don.SelectedValue = "PP";
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.DonMon.Click += new System.EventHandler(this.DonMon_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }

        protected System.Web.UI.WebControls.Button DonMon;
        protected System.Web.UI.WebControls.Label lblErrorMessage;

        private bool PayPalReturnRequest = false;
        protected decimal amount = 0.00M;
        string opemail;
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["DONOR_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");
            }
            getDataPost();
            //id_op.Text = Session["op_id"].ToString();
            name_op.Text = Session["op_name"].ToString();
            opemail = Session["email"].ToString();


            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM DONOR_USERS WHERE [DONOR_ID]= @DONOR_ID ", con);
                cmd.Parameters.AddWithValue("@DONOR_ID", Session["DONOR_ID"]);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtDonorName.Text = dr.GetValue(1).ToString() + " " + dr.GetValue(2).ToString();
                        TextBox1.Text = dr.GetValue(9).ToString();

                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


            if (Request.QueryString["PayPal"] != null)
                this.HandlePayPalReturn();
        }

        protected void DonMon_Click(object sender, EventArgs e)
        {


            try
            {
                this.amount = decimal.Parse(this.txtamount.Text);
            }
            catch
            {
                this.ShowError("Invalid  Amount. Get a grip.");
                return;
            }


            Session["amount"] = this.amount;



            if (this.don.SelectedValue == "PP" && !this.PayPalReturnRequest)
                this.HandlePayPalRedirection(); // this will end this request!


            HttpContext.Current.Session["email"] = null;

            try
            {
                 int total = 0;
                string Email = TextBox1.Text;
                if (!string.IsNullOrEmpty(Email))
                {
                    int orph_id;
                    if (int.TryParse(Session["op_id"].ToString(), out orph_id) && orph_id > 0)
                    {
                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();
                            // Insert new donation
                            SqlCommand cmd = new SqlCommand("INSERT INTO DONATION(D_NAME, D_AMOUNT, D_OPNAME, D_MSG, D_STAT, ORPH_ID, DON_ID, D_DATETIME) values(@D_NAME, @D_AMOUNT, @D_OPNAME, @D_MSG, @D_STAT, @ORPH_ID, @DON_ID, @D_DATETIME)", con);
                            cmd.Parameters.AddWithValue("@D_NAME", txtDonorName.Text.Trim());
                            cmd.Parameters.AddWithValue("@D_AMOUNT", txtamount.Text.Trim());
                            cmd.Parameters.AddWithValue("@D_OPNAME", Session["op_name"].ToString());
                            cmd.Parameters.AddWithValue("@D_MSG", txtmessage.Text.Trim());
                            cmd.Parameters.AddWithValue("@D_STAT", "no");
                            cmd.Parameters.AddWithValue("@ORPH_ID", orph_id);
                            cmd.Parameters.AddWithValue("@DON_ID", Session["DONOR_ID"]);
                            cmd.Parameters.AddWithValue("@D_DATETIME", DateTime.Now);

                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                // Get total amount of donations for the orphanage
                                SqlCommand cmd1 = new SqlCommand("SELECT SUM(CONVERT(float, D_AMOUNT)) FROM DONATION WHERE ORPH_ID =@ORPH_ID ", con);
                                cmd1.Parameters.AddWithValue("@ORPH_ID", orph_id);
                                object sum = cmd1.ExecuteScalar();
                                if (sum != null && sum != DBNull.Value)
                                {
                                    total = Convert.ToInt32(sum);
                                }
                                // Update the total donation amount for the orphanage
                                SqlCommand cmd2 = new SqlCommand("UPDATE OP_TABLE SET OP_TOTALDONATION=@TOTAL WHERE  OP_ID =@OP_ID", con);
                                cmd2.Parameters.AddWithValue("@TOTAL", total);
                                cmd2.Parameters.AddWithValue("@OP_ID", orph_id);
                                cmd2.ExecuteNonQuery();
                            }
                            con.Close();
                            Transaction_Logs();
                            // add your feedback message here
                        }
                    }
                    else
                    {
                        // add error message for invalid session variable for orphanage id
                        Response.Write("<script>alert('Invalid Orphanage ID')</script>");

                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email')</script>");

                    // add error message for empty or invalid email
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }


            Session["msg"] = txtmessage.Text.Trim();
            Session["name"] = txtDonorName.Text.Trim();
            Session["Mon"] = txtamount.Text.Trim();
            Response.Redirect("Confirmation.aspx");


        }

        private void HandlePayPalRedirection()
        {

            //  Set a flag so we know we redirected
            Session["PayPal_Redirected"] = "True";

            // Save any values you might need when you return here
            Session["PayPal_OrderAmount"] = this.amount;  // already saved above



            paypalhelpers PayPal = new paypalhelpers();
            PayPal.PayPalBaseUrl = Configuration.PayPalUrl;
            PayPal.AccountEmail = Configuration.AccountEmail;
            PayPal.Amount = this.amount;




            PayPal.ItemName = "Warm Hearts Invoice #" + new Guid().GetHashCode().ToString("x");

            PayPal.SuccessUrl = Request.Url + "?PayPal=Success";
            PayPal.CancelUrl = Request.Url + "?PayPal=Cancel";

            Response.Redirect(PayPal.GetSubmitUrl());

            return;
        }

        private void Transaction_Logs()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd3 = new SqlCommand("INSERT INTO Transac_Logs(OP_ID, donor_ID,  Amount, Orph_Name,  D_NAME,  TIMESTAMPP, ACTIVITY) " +
                    "VALUES (@OP_ID, @donor_ID, @Amount, @Orph_Name,  @D_NAME, @TIMESTAMPP, @ACTIVITY)", con);
                cmd3.Parameters.AddWithValue("@OP_ID", Session["op_ID"]);
                cmd3.Parameters.AddWithValue("@donor_ID", Session["DONOR_ID"]);
                cmd3.Parameters.AddWithValue("@Amount", txtamount.Text.Trim());
                cmd3.Parameters.AddWithValue("@Orph_Name", Session["op_name"].ToString());
                cmd3.Parameters.AddWithValue("@D_NAME", txtDonorName.Text.Trim());
                cmd3.Parameters.AddWithValue("@TIMESTAMPP", DateTime.Now);
                cmd3.Parameters.AddWithValue("@ACTIVITY", "Success");
                cmd3.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>('" + ex.Message + "')</script>");
            }
        }
        private void HandlePayPalReturn()
        {
            string Result = Request.QueryString["PayPal"];
            string Redir = (string)Session["PayPal_Redirected"];

            //  Only do this if we are redirected!
            if (Redir == "True")
            {
                Session.Remove("PayPal_Redirected");


                // Set flag so we know not to go TO PayPal again
                this.PayPalReturnRequest = true;

                //  Retrieve saved Page content
                this.txtamount.Text = ((decimal)Session["PayPal_OrderAmount"]).ToString();
                this.don.SelectedValue = "PP";



                if (Result == "Cancel")
                {
                    this.ShowError("PayPal Donation has been cancel ");
                }
                else
                {

                    // We returned successfully - simulate button click to save the Donation
                    this.DonMon_Click(this, EventArgs.Empty);

                }
            }
        }

        void ShowError(string ErrorMessage)
        {
            this.lblErrorMessage.Text = ErrorMessage + "<p>";
        }


        private void getDataPost()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM POST_NEEDS where OP_ID='" + Session["op_id"] + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                rPostNeeds.DataSource = ds;
                rPostNeeds.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }

        protected void lnkDonate_Click(object sender, System.EventArgs e)
        {


            LinkButton btn = (LinkButton)sender;
            string args = btn.CommandArgument;
            string[] comandArgs = args.Split(';');
            string needs = comandArgs[0];
            string Op = comandArgs[1];
            //TextBox1.Text = orphans;
            //TextBox2.Text = Op;
            Session["needs_id"] = needs;
            Session["op_id"] = Op;
            // Response.Write("<script>alert('" + orphans +Op+ "');</script>");
            Response.Redirect("PostNeedsSched.aspx");
        }



    }
}