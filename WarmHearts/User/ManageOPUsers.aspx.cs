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
using System.Reflection;
using System.Net;
using System.Net.Mail;

namespace WarmHearts.User
{
    public partial class ManageOPUsers : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["breadcrumb"] = "Manage Orphanage";
                if (Session["adminx"] == null)
                {
                    Response.Redirect("LoginPage2.aspx");
                }
                view();
            }
            else
            {
                ClearQueryString();
            }
            

            GridView1.DataBind();

            

        }

        protected void LinkButton3_Click1(object sender, EventArgs e)
        {
            try
            {
               
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd3 = new SqlCommand("INSERT INTO OrphLog_Table (admin_ID, OP_ID, TIMESTAMPP, ACTIVITY) VALUES (@admin_ID, @OP_ID, @TIMESTAMPP, @ACTIVITY)", con);
                cmd3.Parameters.AddWithValue("@admin_ID", Session["adminx"]);
                cmd3.Parameters.AddWithValue("@OP_ID", OpID.Text.Trim());
                cmd3.Parameters.AddWithValue("@TIMESTAMPP", DateTime.Now);
                cmd3.Parameters.AddWithValue("@ACTIVITY", "Deactivate");
                cmd3.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>('" + ex.Message + "')</script>");
            }
            UpdateStatusByID("InActive");
        }

        void view()
        {
            try
            {
                //string encodedString = Request.QueryString["orphname"];
                //string decodedString = Uri.UnescapeDataString(encodedString);


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE NotifAd SET placed='"
                    + "yes" + "' WHERE  orphname ='" + Request.QueryString["orphname"] + "'", con);
                cmd.ExecuteNonQuery();

                SqlCommand cmd1 = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_ID ='" + Request.QueryString["orphname"] + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        OpID.Text = dr.GetValue(0).ToString();
                        OPfname.Text = dr.GetValue(1).ToString();
                        accstatus.Text = dr.GetValue(6).ToString();
                        OPAddress.Text = dr.GetValue(2).ToString();
                        OPEmail.Text = dr.GetValue(5).ToString();
                        OPContact.Text = dr.GetValue(3).ToString();
                        OPProv.Text = dr.GetValue(7).ToString();
                       


                    }

                }


                con.Close();

                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        private void ClearQueryString()
        {
            PropertyInfo isreadonly = typeof(System.Collections.Specialized.NameValueCollection).GetProperty("IsReadOnly", BindingFlags.Instance | BindingFlags.NonPublic);
            isreadonly.SetValue(this.Request.QueryString, false, null);
            this.Request.QueryString.Remove("orphname");
            
        }

        void getOPbyID()
        {
            
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_ID ='" + OpID.Text.Trim()
                     + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        

                        OPfname.Text = dr.GetValue(1).ToString();
                        accstatus.Text = dr.GetValue(6).ToString();
                        OPAddress.Text = dr.GetValue(2).ToString();
                        OPEmail.Text = dr.GetValue(5).ToString();
                        OPContact.Text = dr.GetValue(3).ToString();
                        OPProv.Text = dr.GetValue(7).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials');</script>");
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

                SqlCommand cmd = new SqlCommand("UPDATE OP_TABLE SET OP_STAT='"
                    + status + "' WHERE  OP_ID ='" + OpID.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Orphanage Status Updated Successfuly');</script>");
                GridView1.DataBind();






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

                SqlCommand cmd = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_ID='" + OpID.Text.Trim() + "';", con);
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

        void deleteOPByID()
        {
            if (checkMemberExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from OP_TABLE WHERE OP_ID='" + OpID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Orphanage Deleted Successfully');</script>");
                    clear();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void clear()
        {
            //fnameText.Text = "";
            //lnameText.Text = "";
            //accstatus.Text = "";
            //dnContact.Text = "";
            //dnAddress.Text = "";
            //dnProv.Text = "";
            //dnZipCode.Text = "";
            //dnDOB.Text = "";
            //dnEmail.Text = "";
            //dnSchool.Text = "";
            //dnWork.Text = "";
            //accstatus.Text = "";

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
           
            getOPbyID();
        }



        protected void dltButton_Click(object sender, EventArgs e)
        {
            deleteOPByID();
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            string OP = OPfname.Text.ToString();

            MailMessage mail = new MailMessage();
            mail.To.Add(OPEmail.Text.ToString().Trim());
            mail.From = new MailAddress("warmheartstest2022@gmail.com");
            mail.Subject = "verification";
            mail.Body = "Hello " + OP + " your acc is verified log in to your acc.<br><a href=\"http://localhost:52845/User/LoginPage.aspx\">click here to Login</a> ";
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;//25 456
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = "smtp.gmail.com	";
            smtp.Credentials = new System.Net.NetworkCredential("warmheartstest2022@gmail.com", "uqbujofkdxpmvasb");
            smtp.Send(mail);

            UpdateStatusByID("Active");
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            UpdateStatusByID("Pending");
        }

//        email with certificate
//            MailMessage mail = new MailMessage();
//        mail.To.Add(OPEmail.Text.ToString().Trim());
//mail.From = new MailAddress("warmheartstest2022@gmail.com");
//        mail.Subject = "Certificate of Achievement";
//mail.Body = "Congratulations on your achievement! Attached is your certificate.<br><br>Sincerely,<br>The Warm Hearts Team";
//mail.IsBodyHtml = true;

//// Attach the certificate file to the email
//mail.Attachments.Add(new Attachment("C:\\path\\to\\certificate.pdf"));

//SmtpClient smtp = new SmtpClient();
//        smtp.Port = 587;
//smtp.EnableSsl = true;
//smtp.UseDefaultCredentials = false;
//smtp.Host = "smtp.gmail.com";
//smtp.Credentials = new System.Net.NetworkCredential("warmheartstest2022@gmail.com", "uqbujofkdxpmvasb");
//smtp.Send(mail);

        //protected void LinkButton3_Click1(object sender, EventArgs e)
        //{
        //    UpdateStatusByID("InActive");
        //}
        
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            string type = "application/pdf";
            int opId = int.Parse((sender as LinkButton).CommandArgument);

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("SELECT OP_TYPE,OP_CRT FROM OP_TABLE where OP_ID = @OP_ID ", con);
            cmd.Parameters.AddWithValue("OP_ID", opId); ;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = type.ToString();
                Response.AddHeader("content-disposition", "attachment;filename=" + dr["OP_TYPE"].ToString()); // to open file prompt Box open or Save file  
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite((byte[])dr["OP_CRT"]);
                Response.End();
            }
        }

        protected void view_Click(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            try
            {
                ProcessRequest2(id, HttpContext.Current);
            }
            catch (SystemException ex)
            {
                Response.Write(ex.Message);
            }
        }

        public void ProcessRequest2(int id, HttpContext context)
        {
            byte[] bytes;
            string fileextension;
           
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@OP_ID", id);
                    cmd.CommandText = "SELECT OP_TYPE,OP_CRT FROM OP_TABLE where OP_ID = @OP_ID";
                    using (SqlDataReader sdr2 = cmd.ExecuteReader())
                    {
                        sdr2.Read();
                        bytes = (byte[])sdr2["OP_CRT"];
                        fileextension = sdr2["OP_TYPE"].ToString();
                    }
                    con.Close();
                }
            }
            context.Response.Buffer = true;
            context.Response.Charset = "";
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            if (fileextension.Substring(fileextension.IndexOf('.') + 1).ToLower() == "pdf")
            {
                context.Response.Buffer = true;
                context.Response.Charset = "";
                context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                context.Response.ContentType = "application/pdf";
                context.Response.BinaryWrite(bytes);
                context.Response.Flush();
                context.Response.End();
            }
           
        }
    }


}



