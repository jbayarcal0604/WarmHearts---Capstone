using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WarmHearts.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        int count = 0;
        int count1 = 0;

        public object LKBNotifDon { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.Url.AbsoluteUri.ToString().Contains("Homepage.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");
            }
            else
            {
                form1.Attributes.Remove("class");

                //Load the control
                Control SliderUserControl = (Control)Page.LoadControl("SliderUserControl.ascx");

                //Add the control to the panel
                pnlSliderUC.Controls.Add(SliderUserControl);
            }
            if (Session["DONOR_ID"] != null)
            {
                LKBtnSignup.Visible = false;
                LKBtnLogin.Text = "Logout";
            }
            else if (Session["OP_ID"] != null)
            {
                LKBtnSignup.Visible = false;
                LKBtnLogin.Text = "Logout";
               
            }
            else
            {
                LKBtnLogin.Text = "Login";
            }

            try
            {
                if (Session["role"] == null)
                {
                    LKBtnLogin.Visible = true;
                    LKBtnSignup.Visible = true;
                    lbProfile.Visible = false;
                    lbOrphProfile.Visible = false;
                    LKBtnLogout.Visible = false;
                    LKBtnHelloUser.Visible = false;
                    LKBtnNotifOp.Visible = false;
                    LKBNotifD.Visible = false;
                }
                else if (Session["role"].Equals("orph"))
                {
                    LKBtnLogin.Visible = false;
                    LKBtnSignup.Visible = false;
                    lbProfile.Visible = false;
                    lbOrphProfile.Visible = true;
                    LKBtnLogout.Visible = true;
                    LKBtnHelloUser.Visible = false;
                    LKBtnNotifOp.Visible = true;
                    LKBNotifD.Visible = false;
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select * from DONATION where ORPH_ID= '"+Session["OP_ID"]+"' and D_STAT ='no'";
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    count = Convert.ToInt32(dt.Rows.Count.ToString());
                    notification3.Text = count.ToString();
                    Notification4.Text = count.ToString();
                    //notification3.Text = count.ToString();
                    //Notification4.Text = count.ToString();
                    r2.DataSource = dt;
                    r2.DataBind();

                }
                else if (Session["role"].Equals("donor"))
                {
                    LKBtnLogin.Visible = false;
                    LKBtnSignup.Visible = false;
                    lbProfile.Visible = true;
                    lbOrphProfile.Visible = false;
                    LKBtnLogout.Visible = true;
                    LKBtnHelloUser.Visible = false;
                    LKBtnNotifOp.Visible = false;
                    LKBNotifD.Visible = true;
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select * from DONATION where DON_ID= '" + Session["DONOR_ID"] + "' and D_STAT ='yes'";
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    count1 = Convert.ToInt32(dt.Rows.Count.ToString());
                    Notification5.Text = count1.ToString();
                    Notification6.Text = count1.ToString();
                    r3.DataSource = dt;
                    r3.DataBind();
                    //notification3.Text = count.ToString();
                    //Notification4.Text = count.ToString();
                    //r3.DataSource = dt;
                    //r2.DataBind();
                }
                else if (Session["role"].Equals("adminx"))
                {
                    LKBtnLogin.Visible = false;
                    LKBtnSignup.Visible = false;
                    lbProfile.Visible = false;
                    lbOrphProfile.Visible = false;
                    LKBtnLogout.Visible = true;
                    LKBtnHelloUser.Visible = true;
                    LKBtnNotifOp.Visible = false;
                    LKBNotifD.Visible = false;
                    LKBtnHelloUser.Text = "Hello Admin";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error :" + ex.Message + "');</script>");

            }
        }

        protected void LKBtnLogin_Click(object sender, EventArgs e)
        {
            if (Session["DONOR_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");

            }
            else if (Session["OP_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("LoginPage2.aspx");
            }

        }

        protected void LKBtnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignupchoosePage.aspx");
        }

        protected void LKBtnLogout_Click(object sender, EventArgs e)
        {
            //Session["username"] = "";
            //Session["firstname"] = "";
            //Session["role"] = "";
            if (Session["OP_ID"] != null)
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO USERLOGS_TBL(OP_ID, TIMESTAMPP, ACTIVITY) VALUES(@OP_ID, @TIMESTAMPP, @ACTIVITY)", con);
                    cmd.Parameters.AddWithValue("@OP_ID", Session["OP_ID"]);
                    cmd.Parameters.AddWithValue("@TIMESTAMPP", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ACTIVITY", "Logout");
                    cmd.ExecuteNonQuery();

                    Session.Abandon();
                    LKBtnLogout.Visible = false;
                    Response.Redirect("Homepage.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "'); </script>");
                }

            }
            else if (Session["DONOR_ID"] != null)
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO USERLOGS_TBL(DONOR_ID, TIMESTAMPP, ACTIVITY) VALUES(@DONOR_ID, @TIMESTAMPP, @ACTIVITY)", con);
                    cmd.Parameters.AddWithValue("@DONOR_ID", Session["DONOR_ID"]);
                    cmd.Parameters.AddWithValue("@TIMESTAMPP", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ACTIVITY", "Logout");
                    cmd.ExecuteNonQuery();

                    Session.Abandon();
                    LKBtnLogout.Visible = false;
                    Response.Redirect("Homepage.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "'); </script>");
                }
            }

            LKBtnLogin.Visible = true;
            LKBtnSignup.Visible = true;

            LKBtnLogout.Visible = false;
            LKBtnHelloUser.Visible = false;

            //for LoginPage2  experiment
            if (Session["DONOR_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");

            }
            else if (Session["OP_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("LoginPage2.aspx");
            }

        }

        protected void LKBtnHelloUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrphanageProfile.aspx");

        }

        protected void lbProfile_Click(object sender, EventArgs e)
        {

            if (Session["DONOR_ID"] != null)
            {
                lbProfile.ToolTip = "User Profile";
                Response.Redirect("DnrProfile2.aspx");
            }
            else
            {
                lbProfile.ToolTip = "User Registration";
                Response.Redirect("SignupchoosePage.aspx");
            }

        }

        protected void lbOrphProfile_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["OP_ID"] != null)
                {
                    lbOrphProfile.ToolTip = "User Orph Profile";
                    Response.Redirect("OrphanageProfile.aspx");
                }
                else
                {
                    lbOrphProfile.ToolTip = "User Registration";
                    Response.Redirect("SignupchoosePage.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error :" + ex.Message + "');</script>");
            }


        }

    }
}