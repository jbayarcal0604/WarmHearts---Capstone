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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            string email = txtEmail.Text;
            string query = "SELECT OP_MAIL AS EMAIL FROM OP_TABLE WHERE OP_MAIL = @OP_MAIL " +
                          "UNION SELECT DONOR_EMAIL AS EMAIL FROM DONOR_USERS WHERE DONOR_EMAIL = @DONOR_EMAIL";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@OP_MAIL", email);
            cmd.Parameters.AddWithValue("@DONOR_EMAIL", email);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                // The email exists in one of the tables
                string resetToken = Guid.NewGuid().ToString();
                SendResetEmail(email, resetToken);

                // Save the reset token to the database
                reader.Close();
                query = "UPDATE OP_TABLE SET reset_token = @reset_token, rt_exp = DATEADD(hour, 24, @time) WHERE OP_MAIL = @OP_MAIL " +
                        "UPDATE DONOR_USERS SET reset_token = @reset_token, er_exp = DATEADD(hour, 24, @time) WHERE DONOR_EMAIL = @DONOR_EMAIL";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@reset_token", resetToken);
                cmd.Parameters.AddWithValue("@OP_MAIL", email);
                cmd.Parameters.AddWithValue("@DONOR_EMAIL", email);
                cmd.Parameters.AddWithValue("@time", DateTime.Now);
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Check your email for a password reset link.!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Email Does Not Exist, Try another Email!');</script>");
            }



            con.Close();
        }
        private void SendResetEmail(string email, string resetToken)
        {
            MailMessage message = new MailMessage();
            message.To.Add(email);
            message.From = new MailAddress("warmheartstest2022@gmail.com");
            message.Subject = "Password Reset";
            message.Body = "Click the following link to reset your password: <a href='http://localhost:52845/User/ResetPassword.aspx?token=" + resetToken + "'>Reset Password</a>";
            message.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;//25 456
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = "smtp.gmail.com	";
            smtp.Credentials = new System.Net.NetworkCredential("warmheartstest2022@gmail.com", "uqbujofkdxpmvasb");
            smtp.Send(message);

            //SmtpClient client = new SmtpClient();
            //client.Send(message);
        }

    }
}