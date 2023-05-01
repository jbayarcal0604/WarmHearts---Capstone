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
using System.Net;
using System.Net.Mail;

namespace WarmHearts.User
{
    public partial class OPReports : System.Web.UI.Page
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
                getOrphanList();
                getDonation();
                // getOrphanLists();
            }
        }

        protected void OPPstNeeds_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPPostNeeds.aspx");
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

        protected void OPAddOrphans_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPAddOrphans2.aspx");
        }

        protected void ddlOPReportList_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

        }

        protected void btnOPReportsGenerate_Click(object sender, EventArgs e)
        {
            if (ddlOPReportList.SelectedValue == 0.ToString())
            {
                rOrphanList.Visible = false;
                Repeater1.Visible = false;
                DivSpon.Visible = false;

            }
            else if (ddlOPReportList.SelectedValue == 1.ToString())
            {

                DivSpon.Visible = false;
                rOrphanList.Visible = false;
                Repeater1.Visible = true;



            }
            else if (ddlOPReportList.SelectedValue == 2.ToString())
            {
                rOrphanList.Visible = true;
                Repeater1.Visible = false;
                DivSpon.Visible = false;
            }
            else if (ddlOPReportList.SelectedValue == 3.ToString())
            {
                Repeater1.Visible = false;
                rOrphanList.Visible = false;
                DivSpon.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Error!');</script>");

            }
        }

        protected void getOrphanList()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM ORPHANS_TBL WHERE OP_ID ='" + Session["OP_ID"] + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                rOrphanList.DataSource = ds;
                rOrphanList.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void getDonation()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM DONATION WHERE ORPH_ID ='" + Session["OP_ID"] + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    DateTime dt = Convert.ToDateTime(e.Row.Cells[4].Text);
                    DateTime today = DateTime.Today;
                    int id = (int)DataBinder.Eval(e.Row.DataItem, "DON_ID");
                    string dname = (string)DataBinder.Eval(e.Row.DataItem, "D_NAME");
                    string orpname = (string)DataBinder.Eval(e.Row.DataItem, "D_ORPHAN");
                    string email;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.Red;
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        SqlCommand cmd1 = new SqlCommand("SELECT * FROM DONOR_USERS WHERE DONOR_ID =" + id, con);
                        SqlDataReader dr = cmd1.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                email = dr.GetValue(9).ToString();
                                MailMessage mail = new MailMessage();
                                mail.To.Add(email);
                                mail.From = new MailAddress("warmheartstest2022@gmail.com");
                                mail.Subject = "Sponsorship";
                                mail.Body = "Hello " + dname + " youre sponsorship has been due!!.<br> " +
                                    "Your sponsorship to" + orpname + " has been due <br>" +
                                    "If you want to countinue sponsoring please <a href=\"http://localhost:52845/User/LoginPage.aspx\">click here to Login</a> ";
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


                    }
                }
            }
            catch (Exception ex)
            {
                //  Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}