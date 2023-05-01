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
using System.Net.Mail;
using System.Net;

namespace WarmHearts.User
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        //string email;
        //DataTable dt = new DataTable();
        //int uid;



        protected void Page_Load(object sender, EventArgs e)
        {

            // Verify that the reset token is present in the query string
            if (!IsPostBack)
            {
                string resetToken = Request.QueryString["token"];
                if (string.IsNullOrEmpty(resetToken))
                {
                    Response.Write("Invalid or expired reset token.");
                    Response.Redirect("ForgotPassword.aspx");

                }
            }




        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            if (txtconpass.Text != "" && txtnewpass.Text != "" && txtnewpass.Text == txtconpass.Text)
            {

                string resetToken = Request.QueryString["token"];
                string query = "SELECT OP_MAIL, reset_token, rt_exp, NULL FROM OP_TABLE WHERE reset_token = @reset_token AND rt_exp > @time " +
   "UNION SELECT [DONOR_EMAIL], reset_token, er_exp, NULL FROM DONOR_USERS WHERE reset_token = @reset_token AND er_exp > @time";



                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@reset_token", resetToken);
                cmd.Parameters.AddWithValue("@time", DateTime.Now);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Update the password in the database
                    reader.Close();
                    string password = txtnewpass.Text;
                    if (password.Length < 8) //adding password validation
                    {
                        Response.Write("<script>alert('Password should be at least 8 characters!');</script>");
                        return;
                    }
                    if (!password.Any(char.IsUpper) || !password.Any(char.IsLower) || !password.Any(char.IsDigit) || !password.Any(char.IsPunctuation))
                    {
                        Response.Write("<script>alert('Password should contain at least one uppercase letter, one lowercase letter, one digit and one special character!');</script>");
                        return;
                    }
                    string securepass = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
                    query = "UPDATE OP_TABLE SET OP_PASS = @OP_PASS, reset_token = NULL, rt_exp = NULL WHERE reset_token = @reset_token " +
                      "UPDATE DONOR_USERS SET DON_PASS = @DON_PASS, reset_token = NULL, er_exp = NULL WHERE reset_token = @reset_token";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@OP_PASS", securepass);
                    cmd.Parameters.AddWithValue("@DON_PASS", securepass);
                    cmd.Parameters.AddWithValue("@reset_token", resetToken);
                    cmd.ExecuteNonQuery();

                    string script = "alert('Your Password has been reset. You Can Now Login.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                    Response.Redirect("LoginPage2.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid or Token have Expired!');</script>");
                }
                con.Close();


            }
            else
            {
                Response.Write("<script>alert('Password does not match!');</script>");

            }


        }
    }
}