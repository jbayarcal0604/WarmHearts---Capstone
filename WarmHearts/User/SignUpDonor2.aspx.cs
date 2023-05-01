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
    public partial class SignUpDonor2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;


        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)   /* && Session["DonorId"] != null*/
                {
                    getDonorDetails();

                }
                else if (Session["DONOR_ID"] != null)
                {
                    Response.Redirect("Homepage.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //string password = txtDonorPassword.Text;
            //byte[] passwordBytes = System.Text.Encoding.UTF8.GetBytes(password);

            //SHA256Managed hash = new SHA256Managed();
            //byte[] hashedPassword = hash.ComputeHash(passwordBytes);

            //string encryptedPassword = BitConverter.ToString(hashedPassword).Replace("-", "");
            string securepass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtDonorPassword.Text, "MD5");
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int userId = Convert.ToInt32(Request.QueryString["id"]);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("DonorUsers_CRUD", con);
            cmd.Parameters.AddWithValue("@Action", userId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@DONOR_ID", userId);
            cmd.Parameters.AddWithValue("@DONOR_FNAME", txtFName.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_MNAME", txtMidName.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_LNAME", txtLName.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_ADD", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_PROV", txtProvince.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_ZIPCODE", txtZipCode.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_BDAY", txtBday.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_CONT", txtContactNum.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_EMAIL", txtEmailAdd.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_EDUC", txtEducation.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_SCHOOLGRAD", txtSchoolUniv.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_WORK", txtWork.Text.Trim());
            cmd.Parameters.AddWithValue("@DONOR_PWORK", txtPlaceWork.Text.Trim());
            cmd.Parameters.AddWithValue("@DON_USERNAME", txtDonorUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@DON_PASS", securepass);
            cmd.Parameters.AddWithValue("@acc_status", "Active");
            if (FileUpload1.HasFile)
            {
                if (Connection.Utils.IsValidExtension(FileUpload1.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(FileUpload1.FileName);
                    imagePath = "Images/DonorPP/" + obj.ToString() + fileExtension;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/DonorPP/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@DONOR_PIMAGE", imagePath);
                    isValidToExecute = true;

                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or .png image";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;
            }
            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = userId == 0 ?
                        "Registration is successful! <b> <a href='LoginPage2.aspx'>Click here </a> </b> to  Login" :
                        "Details Has Been Updated Successfully! <b> <a href='DnrProfile2.aspx'></a> </b>";
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtDonorUsername.Text.Trim() + "</b>&nbsp" + actionName;
                    lblMsg.CssClass = "alert alert-success";
                    if (userId != 0)
                    {
                        Response.AddHeader("REFRESH", "1;URL=DnrProfile2.aspx");
                    }
                    clear();
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "<b>" + txtDonorUsername.Text.Trim() + "</b> Username already exist, try new one!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }
        }

        void getDonorDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("DonorUsers_CRUD", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@DONOR_ID", Request.QueryString["id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                txtFName.Text = dt.Rows[0]["DONOR_FNAME"].ToString();
                txtMidName.Text = dt.Rows[0]["DONOR_MNAME"].ToString();
                txtLName.Text = dt.Rows[0]["DONOR_LNAME"].ToString();
                txtAddress.Text = dt.Rows[0]["DONOR_ADD"].ToString();
                txtProvince.Text = dt.Rows[0]["DONOR_PROV"].ToString();
                txtZipCode.Text = dt.Rows[0]["DONOR_ZIPCODE"].ToString();
                txtBday.Text = dt.Rows[0]["DONOR_BDAY"].ToString();
                txtContactNum.Text = dt.Rows[0]["DONOR_CONT"].ToString();
                txtEmailAdd.Text = dt.Rows[0]["DONOR_EMAIL"].ToString();
                txtEducation.Text = dt.Rows[0]["DONOR_EDUC"].ToString();
                txtSchoolUniv.Text = dt.Rows[0]["DONOR_SCHOOLGRAD"].ToString();
                txtWork.Text = dt.Rows[0]["DONOR_WORK"].ToString();
                txtPlaceWork.Text = dt.Rows[0]["DONOR_PWORK"].ToString();
                txtDonorUsername.Text = dt.Rows[0]["DON_USERNAME"].ToString();
                imgUser.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["DONOR_PIMAGE"].ToString())
                    ? "../Images/no-photo.png" : "../" + dt.Rows[0]["DONOR_PIMAGE"].ToString();
                imgUser.Height = 200;
                imgUser.Width = 200;
                txtDonorPassword.Text = dt.Rows[0]["DON_PASS"].ToString();
                txtDonorPassword.TextMode = TextBoxMode.SingleLine;
            }
            lblHeaderMsg.Text = "<h2> Edit Profile </h2>";
            divPolicy.Visible = false;
            btnSubmit.Text = "UPDATE";
            RequiredFieldValidator3.Enabled = false;


        }

        private void clear()
        {
            txtFName.Text = string.Empty;
            txtDonorUsername.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtBday.Text = string.Empty;
            txtContactNum.Text = string.Empty;
            txtDonorPassword.Text = string.Empty;
            txtEmailAdd.Text = string.Empty;
            txtLName.Text = string.Empty;


        }
    }
}