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
using System.Web.Security;
using System.Security.Cryptography;

namespace WarmHearts.User
{
    public partial class LoginPage2 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlConnection cons;

        SqlCommand cmd;
        SqlCommand cmd2;

        SqlDataAdapter sda;
        DataTable dt;
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string stcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DONOR_ID"] != null)
            {
                Response.Redirect("Homepage.aspx");
            }
            else if (Session["OP_ID"] != null)
            {
                Response.Redirect("Homepage.aspx");
            }

        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string securepass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "MD5");
                //string providedPassword = txtPassword.Text;
                //byte[] providedPasswordBytes = System.Text.Encoding.UTF8.GetBytes(providedPassword);
                //SHA256Managed hash = new SHA256Managed();
                //byte[] providedPasswordHash = hash.ComputeHash(providedPasswordBytes);
                // BitConverter.ToString(providedPasswordHash).Replace("-", "")

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // Check for orphanage user login               
                SqlCommand cmd = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_UNAME=@OP_UNAME AND OP_PASS=@OP_PASS", con);
                cmd.Parameters.AddWithValue("@OP_UNAME", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_PASS", securepass);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        //Session["role"] = "orph";
                        Session["status"] = dr.GetValue(6).ToString();
                        //Response.Write("<script>alert('Login Successful!'); </script>");
                        //Response.Redirect("Homepage.aspx");


                        if (Session["status"].ToString().Trim() == "Pending" || Session["status"].ToString().Trim() == "pending")
                        {
                            //Session["role"] = "";
                            Response.Write("<script>alert('Please wait your account is  " + Session["status"].ToString().Trim() + "');</script>");
                        }
                        else if (Session["status"].ToString().Trim() == "InActive" || Session["status"].ToString().Trim() == "inactive")
                        {
                            Response.Write("<script>alert('Sorry,  your account is  " + Session["status"].ToString().Trim() + "');</script>");
                        }
                        else
                        {
                            Session["OP_ID"] = dr.GetValue(0).ToString();
                            Session["username"] = dr.GetValue(11).ToString();
                            Session["firstname"] = dr.GetValue(1).ToString();

                            Session["role"] = "orph";
                            Response.Write("<script>alert('Login Successful!'); </script>");
                            orphanageLogs();
                            Response.Redirect("Homepage.aspx");
                        }
                    }
                }




                else
                {
                    // Check for admin login
                    SqlConnection con2 = new SqlConnection(stcon);
                    if (con2.State == ConnectionState.Closed)
                    {
                        con2.Open();
                    }

                    SqlCommand cmd2 = new SqlCommand("SELECT * FROM [ADMIN_TABLE] WHERE [username]=@username AND [password]=@password", con2);
                    cmd2.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                    cmd2.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    SqlDataReader drr = cmd2.ExecuteReader();

                    if (drr.HasRows)
                    {
                        while (drr.Read())
                        {
                            Session["admin_ID"] = drr.GetValue(0).ToString();
                            Session["username"] = drr.GetValue(1).ToString();
                            Session["adminx"] = txtUsername.Text.Trim();
                            Session["status"] = drr.GetValue(5).ToString();

                        }
                        if (Session["status"].ToString().Trim() == "Deactivated" || Session["status"].ToString().Trim() == "deactivated")
                        {
                            //Session["role"] = "";
                            Response.Write("<script>alert('Sorry  your account is  " + Session["status"].ToString().Trim() + " Please Contact Administrator');</script>");
                        }
                        else
                        {
                            Session["role"] = "adminx";
                            Response.Write("<script>alert('Login Successful!'); </script>");
                            Response.Redirect("Dashboard.aspx");

                            //Session["id"] = dr.GetValue(0).ToString();
                            //Session["username"] = dr.GetValue(6).ToString();
                            //Session["firstname"] = dr.GetValue(1).ToString();
                            //Session["role"] = "user";
                        }

                    }
                    else
                    {
                        // Check for donor login
                        con = new SqlConnection(Connection.GetConnectionString());
                        cmd = new SqlCommand("DonorUsers_CRUD", con);
                        cmd.Parameters.AddWithValue("Action", "SELECT4LOGIN");
                        cmd.Parameters.AddWithValue("@DON_USERNAME", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@DON_PASS", securepass);
                        cmd.CommandType = CommandType.StoredProcedure;
                        sda = new SqlDataAdapter(cmd);
                        dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count == 1)
                        {
                            Session["username"] = txtUsername.Text.Trim();
                            Session["DONOR_ID"] = dt.Rows[0]["DONOR_ID"];
                            Session["role"] = "donor";
                            donorLogs();
                            Response.Redirect("Homepage.aspx");

                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid Credentials!'); </script>");

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        private void donorLogs()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd3 = new SqlCommand("INSERT INTO USERLOGS_TBL (DONOR_ID, TIMESTAMPP, ACTIVITY) VALUES (@DONOR_ID, @TIMESTAMPP, @ACTIVITY)", con);
                cmd3.Parameters.AddWithValue("@DONOR_ID", Session["DONOR_ID"]);
                cmd3.Parameters.AddWithValue("@TIMESTAMPP", DateTime.Now);
                cmd3.Parameters.AddWithValue("@ACTIVITY", "Login");
                cmd3.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>('" + ex.Message + "')</script>");
            }
        }

        private void orphanageLogs()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd3 = new SqlCommand("INSERT INTO USERLOGS_TBL (OP_ID, TIMESTAMPP, ACTIVITY) VALUES (@OP_ID, @TIMESTAMPP, @ACTIVITY)", con);
                cmd3.Parameters.AddWithValue("@OP_ID", Session["OP_ID"]);
                cmd3.Parameters.AddWithValue("@TIMESTAMPP", DateTime.Now);
                cmd3.Parameters.AddWithValue("@ACTIVITY", "Login");
                cmd3.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>('" + ex.Message + "')</script>");
            }
        }

    }

}