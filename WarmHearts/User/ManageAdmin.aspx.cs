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

namespace WarmHearts.User
{
    public partial class ManageAdmin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["breadcrumb"] = "Manage Admin";
                if (Session["adminx"] == null)
                {
                    Response.Redirect("LoginPage2.aspx");
                }
            }
            GridView1.DataBind();
        }

        void getAdminID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM [ADMIN_TABLE] WHERE admin_ID ='" + admnID.Text.Trim()
                     + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        fnameText.Text = dr.GetValue(3).ToString();
                        accstatus.Text = dr.GetValue(5).ToString();
                        dnContact.Text = dr.GetValue(4).ToString();
                        usrname.Text = dr.GetValue(1).ToString();
                        oldpssword.Text = dr.GetValue(2).ToString();
                        Session["adminx"] = usrname.Text.Trim();


                    }
                    oldpssword.ReadOnly = true;
                }
                else
                {
                    Response.Write("<script>alert('Invalid ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateStatusByID(string status)
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE ADMIN_TABLE SET acc_status='"
                    + status + "' WHERE  admin_ID='" + admnID.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Admin Status Updated Successfuly');</script>");






            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }








        }

        bool checkMemberExist()
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM ADMIN_TABLE WHERE admin_ID='" + admnID.Text.Trim() + "';", con);
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
        

        void clear()
        {
            admnID.Text = "";
            fnameText.Text = "";
            accstatus.Text = "";
            dnContact.Text = "";
            usrname.Text = "";
            oldpssword.Text = "";
            //dnAddress.Text = "";
            //dnProv.Text = "";
            //dnZipCode.Text = "";
            //dnDOB.Text = "";
            //dnEmail.Text = "";
            //dnSchool.Text = "";
            //dnWork.Text = "";

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getAdminID();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            UpdateStatusByID("Admin");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            UpdateStatusByID("Deactivated");

        }

        protected void addbtn_Click(object sender, EventArgs e)
        {

            try
            {


                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }


                SqlCommand cmd = new SqlCommand("INSERT INTO [ADMIN_TABLE] ([username], [password], [full_name], [contact_num], [acc_status])" +
                        "values(@username, @password, @full_name, @contact_num, @acc_status)", conn);


                cmd.Parameters.AddWithValue("@username", usrname.Text.Trim());
                cmd.Parameters.AddWithValue("@password", oldpssword.Text.Trim());
                cmd.Parameters.AddWithValue("@full_name", fnameText.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_num", dnContact.Text.Trim());
                cmd.Parameters.AddWithValue("@acc_status", "Admin");


                cmd.ExecuteNonQuery();
                conn.Close();

                clear();
                Response.Write("<script>('Added Successfully!')</script>");
                GridView1.DataBind();




            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }


        //UPDATE
        protected void updbtn_Click(object sender, EventArgs e)
        {
            updateAdminById();
        }
       

        void updateAdminById()
        {
            if (checkMemberExist())
            {

                string password = "";
                if (newpssword.Text.Trim() == "")
                {
                    password = oldpssword.Text.Trim();
                }
                else
                {
                    password = newpssword.Text.Trim();
                }
                try
                {

                  

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE [ADMIN_TABLE] SET [username]=@username, [password]=@password," +
                        "[full_name]=@full_name,[contact_num]=@contact_num WHERE [admin_ID] = '" + admnID.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("username", usrname.Text.Trim());
                    cmd.Parameters.AddWithValue("password", password);
                    cmd.Parameters.AddWithValue("full_name", fnameText.Text.Trim());
                    cmd.Parameters.AddWithValue("contact_num", dnContact.Text.Trim());
                   

                    cmd.ExecuteNonQuery();
                    con.Close();
                    clear();
                    Response.Write("<script>alert('Admin Updated Successfuly!');</script>");
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Admin ID');</script>");
            }

        }
    }


}



