using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Collections;
using System.Net;
using System.Net.Mail;

namespace WarmHearts.User
{
    public partial class OPVolunteers : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["OP_ID"] == null)
                {
                    Response.Redirect("LoginPage2.aspx");
                }
                else
                {

                }
            }
            r2.DataBind();
            Rep1.DataBind();
            getDonPost();
            getOrphanNeeds();

        }

        protected void OpVwDnrs_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPViewDonors.aspx");
        }

        protected void OPVolunRqst_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPVolunteers.aspx");
        }

        protected void OPreports_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPReports.aspx");
        }

        protected void OPOrphanListID_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPOrphanList.aspx");
        }

        protected void OPSponsorship_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPAddOrphans2.aspx");
        }

        protected void lnkAccept_Click(object sender, EventArgs e)
        {
            string op_name = Session["firstname"].ToString();
            string emailAdd;
            string name;

            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            Label1.Text = id.ToString();
            Session["volid"] = Label1.Text.ToString();
            // Response.Redirect("RVolunteer.aspx");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE REQVOL SET V_STATUS='" + "Accept" + "' WHERE V_ID ='" + Session["volid"] + "'", con);
                cmd.ExecuteNonQuery();

                SqlCommand cmd1 = new SqlCommand("SELECT * FROM REQVOL WHERE V_ID ='" + Session["volid"] + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        name = dr.GetValue(2).ToString();
                        emailAdd = dr.GetValue(3).ToString();
                        //OPZip.Text = dr.GetValue(12).ToString();
                        //OPdate.Text = dr.GetValue(13).ToString();
                        MailMessage mail = new MailMessage();
                        mail.To.Add(emailAdd);
                        mail.From = new MailAddress("warmheartstest2022@gmail.com");
                        mail.Subject = "Approval";
                        mail.Body = "Hello " + name + " you are volunteer request has been accepted by " + op_name + " .<br><a href=\"http://localhost:52845/User/LoginPage.aspx\">click here to Login</a> ";
                        mail.IsBodyHtml = true;

                        SmtpClient smtp = new SmtpClient();
                        smtp.Port = 587;//25 456
                        smtp.EnableSsl = true;
                        smtp.UseDefaultCredentials = false;
                        smtp.Host = "smtp.gmail.com	";
                        smtp.Credentials = new System.Net.NetworkCredential("warmheartstest2022@gmail.com", "uqbujofkdxpmvasb");
                        smtp.Send(mail);

                    }

                }


                con.Close();
                Response.Redirect("OPVolunteers.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }
        protected void lnkDecline_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            Label1.Text = id.ToString();
            Session["volid1"] = Label1.Text.ToString();

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE REQVOL SET V_STATUS='" + "Decline" + "' WHERE V_ID ='" + Session["volid1"] + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //GridView2.DataBind();
                // GridView1.DataBind();
                Response.Redirect("OPVolunteers.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void getDonPost()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();

                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM [Sup_Needs_tbl] WHERE OP_ID = @opid AND status = 'no' AND orphan_ID IS NULL";
                    cmd.Parameters.AddWithValue("@opid", Session["OP_ID"]);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        r2.DataSource = dt;
                        r2.DataBind();
                    }
                }
            }




        }


        private void getOrphanNeeds()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();

                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM [Sup_Needs_tbl] WHERE OP_ID = @opid AND status = 'no' AND orphan_ID IS NOT NULL";
                    cmd.Parameters.AddWithValue("@opid", Session["OP_ID"]);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        Rep1.DataSource = dt;
                        Rep1.DataBind();
                    }
                }
            }




        }

        protected void btnAccept_Click(object sender, System.EventArgs e)
        {

            string M;
            string N;


            Button btn = (Button)sender;
            string args = btn.CommandArgument;
            string[] comandArgs = args.Split(';');
            string N_id = comandArgs[0];
            string D_id = comandArgs[1];

            RepeaterItem item = btn.NamingContainer as RepeaterItem;
            TextBox txtDateDS = item.FindControl("txtDateDS") as TextBox;
            TextBox txtTimeDS = item.FindControl("txtTimeDS") as TextBox;
            string Sched = txtDateDS.Text;
            string Time = txtTimeDS.Text;

            //Session["N_id"] = N_id;
            Session["D_id"] = D_id;
            //Session["Sched"] = Sched.ToString();
            //Session["Time"] = Time.ToString();
            // Response.Write("<script>alert('" + orphans +Op+ "');</script>");
            // Response.Redirect("PostNeedsSched.aspx");

            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //SqlCommand cmd = new SqlCommand("UPDATE Supp/Needs_tbl SET status='" + "yes" + "', Needs_Sched='"+ Session["Sched"]
                //+ "',  Needs_Time='" + Session["Time"] + "'  WHERE Needs_ID ='" + Session["N_id"] + "'", con);
                //cmd.ExecuteNonQuery();
                //con.Close();

                SqlCommand cmd = new SqlCommand("UPDATE Sup_Needs_tbl SET status=@status, Needs_Sched=@Needs_Sched," +
                       "Needs_Time=@Needs_Time WHERE Needs_ID = @N_id", con);

                cmd.Parameters.AddWithValue("status", "yes");
                cmd.Parameters.AddWithValue("Needs_Sched", Sched);
                cmd.Parameters.AddWithValue("Needs_Time", Time);
                cmd.Parameters.AddWithValue("N_id", N_id);

                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                r2.DataSource = dt;
                r2.DataBind();

                SqlCommand cmd1 = new SqlCommand("SELECT * FROM DONOR_USERS WHERE DONOR_ID ='" + Session["D_id"] + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        N = dr.GetValue(1).ToString() + " " + dr.GetValue(3).ToString();
                        M = dr.GetValue(9).ToString();
                        //OPZip.Text = dr.GetValue(12).ToString();
                        //OPdate.Text = dr.GetValue(13).ToString();
                        MailMessage mail = new MailMessage();
                        mail.To.Add(M);
                        mail.From = new MailAddress("warmheartstest2022@gmail.com");
                        mail.Subject = "Donation Approval";
                        mail.Body = "Hello " + N + " Your supply donation is accepted by " + Session["firstname"] + " .<br>" +
                            "Below is your scheduled date and time to deliver your donations.<br>" +
                            "Date: " + Sched.ToString() + "<t> Time:" + Time.ToString() + "<br>" +
                            "Thank you and Godbless ";
                        mail.IsBodyHtml = true;

                        SmtpClient smtp = new SmtpClient();
                        smtp.Port = 587;//25 456
                        smtp.EnableSsl = true;
                        smtp.UseDefaultCredentials = false;
                        smtp.Host = "smtp.gmail.com	";
                        smtp.Credentials = new System.Net.NetworkCredential("warmheartstest2022@gmail.com", "uqbujofkdxpmvasb");
                        smtp.Send(mail);

                    }

                }


                con.Close();

                Response.Write("<script>alert(' Updated Successfuly!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }


        protected void btnAcceptORP_Click(object sender, System.EventArgs e)
        {

            string M = "";
            string N = "";
            string O = "";

            Button btn = (Button)sender;
            string args = btn.CommandArgument;
            string[] comandArgs = args.Split(';');
            string N_id = comandArgs[0];
            string D_id = comandArgs[1];
            string O_id = comandArgs[2];

            RepeaterItem item = btn.NamingContainer as RepeaterItem;
            TextBox txtDateDS = item.FindControl("txtDate") as TextBox;
            TextBox txtTimeDS = item.FindControl("txtTime") as TextBox;
            string Sched = txtDateDS.Text;
            string Time = txtTimeDS.Text;

            //Session["N_id"] = N_id;
            Session["D_id"] = D_id;
            Session["O_id"] = O_id;


            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }



                SqlCommand cmd = new SqlCommand("UPDATE Sup_Needs_tbl SET status=@status, Needs_Sched=@Needs_Sched," +
               "Needs_Time=@Needs_Time WHERE Needs_ID = @N_id", con);

                cmd.Parameters.AddWithValue("status", "yes");
                cmd.Parameters.AddWithValue("Needs_Sched", Sched);
                cmd.Parameters.AddWithValue("Needs_Time", Time);
                cmd.Parameters.AddWithValue("N_id", N_id);

                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                Rep1.DataSource = dt;
                Rep1.DataBind();

                SqlCommand cmd1 = new SqlCommand("SELECT * FROM DONOR_USERS WHERE DONOR_ID ='" + Session["D_id"] + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        N = dr.GetValue(1).ToString() + " " + dr.GetValue(3).ToString();
                        M = dr.GetValue(9).ToString();

                    }

                }
                dr.Close();

                SqlCommand cmd2 = new SqlCommand("SELECT * FROM ORPHANS_TBL WHERE orphan_ID ='" + Session["O_id"] + "'", con);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.HasRows)
                {
                    while (dr2.Read())
                    {
                        O = dr2.GetValue(1).ToString() + " " + dr2.GetValue(2).ToString();
                    }
                }
                dr2.Close();

                MailMessage mail = new MailMessage();
                mail.To.Add(M);
                mail.From = new MailAddress("warmheartstest2022@gmail.com");
                mail.Subject = "Donation Approval";
                mail.Body = "Hello " + N + " Your supply donation to " + O + " is accepted by " + Session["firstname"] + " .<br>" +
                    "Below is your scheduled date and time to deliver your donations.<br>" +
                    "Date: " + Sched.ToString() + "<t> Time:" + Time.ToString() + "<br>" +
                    "Thank you and Godbless ";
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;//25 456
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com	";
                smtp.Credentials = new System.Net.NetworkCredential("warmheartstest2022@gmail.com", "uqbujofkdxpmvasb");
                smtp.Send(mail);
                con.Close();

                Response.Write("<script>alert('Donation Approved Successfuly!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}