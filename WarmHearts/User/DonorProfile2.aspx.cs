using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace WarmHearts.User
{
    public partial class DonorProfile2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["username"].ToString() == "" || Session["username"] == null)
                    {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("LoginPage.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("LoginPage.aspx");
            }
        }

        // update button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("LoginPage.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            }
        }



        // user defined function


        void updateUserPersonalDetails()
        {
            string password = "";
            if (newpsword.Text.Trim() == "")
            {
                password = oldpsword.Text.Trim();
            }
            else
            {
                password = newpsword.Text.Trim();
            }
            try
            {
                string filePath = "~/Images/DonorPP/";
                string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);
               

                if (fileName == "" || fileName == null)
                {
                    filePath = global_filepath;
                }
                else
                {
                    FileUpload2.SaveAs(Server.MapPath("~/Images/DonorPP/" + fileName));
                    filePath = "~/Images/DonorPP/" + fileName;
                }
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("UPDATE DONOR_USER set DONOR_FNAME=@DONOR_FNAME, " +
                    "[DONOR_MNAME]=@DONOR_MNAME, [DONOR_LNAME]=@DONOR_LNAME, [DONOR_ADD]=@DONOR_ADD, [DONOR_PROV]=@DONOR_PROV, [DONOR_ZIPCODE]=@DONOR_ZIPCODE," +
                    "[DONOR_BDAY]=@DONOR_BDAY, [DONOR_CONT]=@DONOR_CONT, [DONOR_EMAIL]=@DONOR_EMAIL, [DONOR_EDUC]=@DONOR_EDUC, [DONOR_SCHOOLGRAD]=@DONOR_SCHOOLGRAD," +
                    "[DONOR_WORK]=@DONOR_WORK, [DONOR_PWORK]=@DONOR_PWORK,  " +
                    "DON_PASS=@DON_PASS, DONOR_PIMAGE=@DONOR_PIMAGE, [account_status]=@account_status  WHERE DON_USERNAME='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@DONOR_FNAME", fname.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_MNAME", mname.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_LNAME", lname.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_ADD", address.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_PROV", prov.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_ZIPCODE", zipcode.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_BDAY", dob.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_CONT", contactn.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_EMAIL", emailad.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_EDUC", course.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_SCHOOLGRAD", schoolg.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_WORK", work.Text.Trim());
                cmd.Parameters.AddWithValue("@DONOR_PWORK", placework.Text.Trim());
                cmd.Parameters.AddWithValue("@DON_PASS", password);
                cmd.Parameters.AddWithValue("@DONOR_PIMAGE", filePath);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from [DONOR_USER] where [DON_USERNAME]='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                fname.Text = dt.Rows[0]["DONOR_FNAME"].ToString();
                mname.Text = dt.Rows[0]["DONOR_MNAME"].ToString();
                lname.Text = dt.Rows[0]["DONOR_LNAME"].ToString();
                address.Text = dt.Rows[0]["DONOR_ADD"].ToString();
                prov.Text = dt.Rows[0]["DONOR_PROV"].ToString();
                zipcode.Text = dt.Rows[0]["DONOR_ZIPCODE"].ToString();
                dob.Text = dt.Rows[0]["DONOR_BDAY"].ToString();
                contactn.Text = dt.Rows[0]["DONOR_CONT"].ToString();
                emailad.Text = dt.Rows[0]["DONOR_EMAIL"].ToString();
                course.Text = dt.Rows[0]["DONOR_EDUC"].ToString();
                schoolg.Text = dt.Rows[0]["DONOR_SCHOOLGRAD"].ToString();
                work.Text = dt.Rows[0]["DONOR_WORK"].ToString();
                placework.Text = dt.Rows[0]["DONOR_PWORK"].ToString();
                usrname.Text = dt.Rows[0]["DON_USERNAME"].ToString();
                oldpsword.Text = dt.Rows[0]["DON_PASS"].ToString();
                global_filepath = dt.Rows[0]["DONOR_PIMAGE"].ToString();
                Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();
                if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-info");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

      

     
    }
}