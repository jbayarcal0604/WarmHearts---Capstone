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

    public partial class SponsorEducation : System.Web.UI.Page
    {
        string opEmail;
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        // protected System.Web.UI.WebControls.Button SubmitSponsorEducation;      
        protected System.Web.UI.WebControls.Label lblErrorMessage;

        private bool PayPalReturnRequest = false;
        protected decimal amount = 0.00M;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DONOR_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");
            }
            else
            {
                if (Session["id_op"] == null)
                {
                    viewDnr();
                    getOrphanDetails();
                    viewOP();
                }
                else
                {
                    try
                    {

                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd1 = new SqlCommand("SELECT * FROM DONOR_USERS WHERE DONOR_ID ='" + Session["DONOR_ID"]
                            + "'", con);
                        SqlDataReader dr = cmd1.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {

                                txtFName.Text = dr.GetValue(1).ToString();
                                txtMidName.Text = dr.GetValue(2).ToString();
                                txtLName.Text = dr.GetValue(3).ToString();
                                txtAddress.Text = dr.GetValue(4).ToString();
                            }
                        }

                        SqlCommand cmd2 = new SqlCommand("SELECT * FROM ORPHANS_TBL WHERE orphan_ID ='" + Session["orphan_id"] + "' and OP_ID ='" + Session["id_op"] + "'", con);
                        SqlDataReader dr2 = cmd2.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr2.Read())
                            {
                                TextBox2.Text = dr2.GetValue(1).ToString();
                                TextBox3.Text = dr2.GetValue(2).ToString();

                            }

                        }

                        SqlCommand cmd3 = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_ID ='" + Session["id_op"] + "'", con);
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        if (dr3.HasRows)
                        {
                            while (dr3.Read())
                            {
                                orphname.Text = dr3.GetValue(1).ToString();
                                Session["email"] = dr3.GetValue(5).ToString();

                            }
                        }
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
            }
            if (Request.QueryString["PayPal"] != null)
                this.HandlePayPalReturn();


        }
        private void getOrphanDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd1 = new SqlCommand("SELECT * FROM ORPHANS_TBL WHERE orphan_ID ='" + Session["orphan_id"] + "' and OP_ID ='" + Session["op_id"] + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(1).ToString();
                        TextBox3.Text = dr.GetValue(2).ToString();
                        // TextBox4.Text = dr.GetValue(3).ToString();




                    }

                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }
        void viewDnr()
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd1 = new SqlCommand("SELECT * FROM DONOR_USERS WHERE DONOR_ID ='" + Session["DONOR_ID"]
                    + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        txtFName.Text = dr.GetValue(1).ToString();
                        txtMidName.Text = dr.GetValue(2).ToString();
                        txtLName.Text = dr.GetValue(3).ToString();
                        txtAddress.Text = dr.GetValue(4).ToString();




                    }

                }


                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        void viewOP()
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd1 = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_ID ='" + Session["op_id"]
                    + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        orphname.Text = dr.GetValue(1).ToString();
                        Session["email"] = dr.GetValue(5).ToString();



                    }

                }


                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        protected void BackOPOrphanList2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sponsor.aspx");
        }

        protected void SubmitSponsorEducation_Click(object sender, EventArgs e)
        {
            string value;



            try
            {
                this.amount = decimal.Parse(this.RadioButtonList1.SelectedValue);
            }
            catch
            {
                this.ShowError("Invalid  Amount. Get a grip.");
                return;
            }

            Session["amount"] = this.amount;

            if (!this.PayPalReturnRequest)
                this.HandlePayPalRedirection();

            if (checkSPExist())
            {
                //Response.Write("<script>alert('Username Already Exist, Try another Username!');</script>");
                //try
                //{
                //    SqlConnection con = new SqlConnection(strcon);
                //    if (con.State == ConnectionState.Closed)
                //    {
                //        con.Open();
                //    }
                //    DateTime currentDate = DateTime.Now;
                //    DateTime expirationDate = currentDate.AddMonths(1);

                //    SqlCommand cmd = new SqlCommand("UPDATE DONATION SET D_AMOUNT='"
                //        + RadioButtonList1.SelectedValue.Trim() + "', D_SPSDATE='"+ currentDate +"', D_SPEDATE='"+ expirationDate + "' WHERE  DON_ID = '" + Session["DONOR_ID"] + "' AND orphan_ID ='" + Session["orphan_id"] + "'", con);
                //    cmd.ExecuteNonQuery();

                //        //tryan pasad ni 
                //        //SqlCommand cmd3 = new SqlCommand("UPDATE ORPHANS_TBL SET DONATION_NUM = DONATION_NUM + 1 WHERE  orphan_ID =@orphan_id", con);
                //        //cmd3.Parameters.AddWithValue("@orphan_id", Session["orphan_id"]);
                //        //cmd3.ExecuteNonQuery();

                //    con.Close();
                //    //Response.Write("<script>alert('Orphanage Status Updated Successfuly');</script>");
                //    Response.Redirect("DnrProfile2.aspx");
                //}
                //catch (Exception ex)
                //{
                //    Response.Write("<script>alert('" + ex.Message + "');</script>");
                //}
                try
                {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        con.Open();
                        DateTime currentDate = DateTime.Now;
                        DateTime expirationDate = currentDate.AddMonths(1);
                        if (Session["DONOR_ID"] != null && Session["orphan_id"] != null)
                        {
                            SqlCommand cmd = new SqlCommand("UPDATE DONATION SET D_AMOUNT=@amount, D_SPSDATE=@startdate, D_SPEDATE=@enddate, D_DATETIME= @D_DATETIME WHERE DON_ID = @donor_id AND orphan_ID = @orphan_id", con);
                            cmd.Parameters.AddWithValue("@amount", RadioButtonList1.SelectedValue.Trim());
                            cmd.Parameters.AddWithValue("@startdate", currentDate);
                            cmd.Parameters.AddWithValue("@enddate", expirationDate);
                            cmd.Parameters.AddWithValue("@D_DATETIME", DateTime.Now);
                            cmd.Parameters.AddWithValue("@donor_id", Session["DONOR_ID"]);
                            cmd.Parameters.AddWithValue("@orphan_id", Session["orphan_id"]);
                            cmd.ExecuteNonQuery();
                        }
                        else
                        {
                            // handle the case where donor_id or orphan_id is null
                        }
                        //tryan pasad ni 
                        SqlCommand cmd3 = new SqlCommand("UPDATE ORPHANS_TBL SET DONATION_NUM = DONATION_NUM + 1 WHERE  orphan_ID =@orphan_ID", con);
                        cmd3.Parameters.AddWithValue("@orphan_ID", Session["orphan_id"]);
                        cmd3.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("DnrProfile2.aspx");
                    }
                }
                catch (Exception ex)
                {
                    // handle the exception, for example by logging it
                    // Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                SponsorNew();

            }


        }

        //protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string val;
        //    if (RadioButtonList1.SelectedValue == 0.ToString())
        //    {
        //        TextBox1.Visible = true;
        //        TextBox1.ReadOnly = false;

        //    }
        //    else if (RadioButtonList1.SelectedValue == 150.ToString())
        //    {
        //        TextBox1.Visible = false;
        //        TextBox1.ReadOnly = true;
        //    }
        //    else if (RadioButtonList1.SelectedValue == 250.ToString())
        //    {
        //        TextBox1.Visible = false;
        //        TextBox1.ReadOnly = true;
        //    }
        //    else if (RadioButtonList1.SelectedValue == 350.ToString())
        //    {
        //        TextBox1.Visible = false;
        //        TextBox1.ReadOnly = true;
        //    }
        //}
        void SponsorNew()
        {
            try
            {
                int total = 0;
                int orph_id;
                if (int.TryParse(Session["op_id"].ToString(), out orph_id) && orph_id > 0)
                {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        con.Open();
                        DateTime currentDate = DateTime.Now;
                        DateTime expirationDate = currentDate.AddMonths(1);

                        SqlCommand cmd = new SqlCommand("INSERT INTO DONATION(D_NAME, D_ORPHAN, D_OPNAME, D_AMOUNT, D_DATETIME, D_SPSDATE, D_SPEDATE, ORPH_ID, DON_ID, orphan_ID) " +
                            "values(@D_NAME, @D_ORPHAN, @D_OPNAME,  @D_AMOUNT,  @D_DATETIME, @D_SPSDATE, @D_SPEDATE, @ORPH_ID, @DON_ID, @orphan_ID)", con);
                        cmd.Parameters.AddWithValue("@D_NAME", txtFName.Text.Trim() + " " + txtLName.Text.Trim());
                        cmd.Parameters.AddWithValue("@D_ORPHAN", TextBox2.Text.Trim() + " " + TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@D_OPNAME", orphname.Text.Trim());
                        cmd.Parameters.AddWithValue("@D_AMOUNT", RadioButtonList1.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@D_DATETIME", DateTime.Now);
                        cmd.Parameters.AddWithValue("@D_SPSDATE", currentDate);
                        cmd.Parameters.AddWithValue("@D_SPEDATE", expirationDate);
                        cmd.Parameters.AddWithValue("@ORPH_ID", orph_id);
                        cmd.Parameters.AddWithValue("@DON_ID", Session["DONOR_ID"]);
                        cmd.Parameters.AddWithValue("@orphan_ID", Session["orphan_id"]);

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
                            // cmd2.ExecuteNonQuery();

                            if (cmd2.ExecuteNonQuery() > 0)
                            {
                                //tryan pasad ni 
                                SqlCommand cmd3 = new SqlCommand("UPDATE ORPHANS_TBL SET DONATION_NUM = DONATION_NUM + 1 WHERE  orphan_ID =@orphan_id", con);
                                cmd3.Parameters.AddWithValue("@orphan_id", Session["orphan_id"]);
                                cmd3.ExecuteNonQuery();
                            }
                            con.Close();
                        }

                    }
                }
                //    SqlConnection con = new SqlConnection(strcon);
                //if (con.State == ConnectionState.Closed)
                //{
                //    con.Open();
                //}




                Response.Redirect("DnrProfile2.aspx");
                // Session.Remove("email");
                // Response.Write("<script>alert('Successfully!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        bool checkSPExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM DONATION where DON_ID = '" + Session["DONOR_ID"] + "' AND orphan_ID ='" + Session["orphan_id"] + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            return false;
        }

        private void HandlePayPalRedirection()
        {

            // *** Set a flag so we know we redirected
            Session["PayPal_Redirected"] = "True";

            // *** Save any values you might need when you return here
            Session["PayPal_OrderAmount"] = this.amount;  // already saved above



            paypalhelpers PayPal = new paypalhelpers();
            PayPal.PayPalBaseUrl = Configuration.PayPalUrl;
            PayPal.AccountEmail = Configuration.AccountEmail;
            PayPal.Amount = this.amount;




            PayPal.ItemName = "Warm Hearts Invoice #" + new Guid().GetHashCode().ToString("x");

            //  Have paypal return back to this URL
            PayPal.SuccessUrl = Request.Url + "?PayPal=Success";
            PayPal.CancelUrl = Request.Url + "?PayPal=Cancel";

            Response.Redirect(PayPal.GetSubmitUrl());

            return;
        }

        private void HandlePayPalReturn()
        {
            string Result = Request.QueryString["PayPal"];
            string Redir = (string)Session["PayPal_Redirected"];

            // Only do this if we are redirected!
            if (Redir == "True")
            {
                Session.Remove("PayPal_Redirected");


                // Set flag so we know not to go TO PayPal again
                this.PayPalReturnRequest = true;

                // *** Retrieve saved Page content
                this.RadioButtonList1.SelectedValue = ((decimal)Session["PayPal_OrderAmount"]).ToString();
                //this.don.SelectedValue = "PP";


                if (Result == "Cancel")
                {
                    this.ShowError("PayPal Donation has been cancel ");
                }
                else
                {

                    //  We returned successfully - simulate button click to save the order
                    this.SubmitSponsorEducation_Click(this, EventArgs.Empty);

                }
            }
        }

        void ShowError(string ErrorMessage)
        {
            this.lblErrorMessage.Text = ErrorMessage + "<p>";
        }


    }
}