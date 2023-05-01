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

namespace WarmHearts.User
{
    public partial class SignupOrphanage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string usename;
        string idOp;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)   /* && Session["OrphId"] != null*/
                {
                    getOrphDetails();

                }
                else if (Session["OP_ID"] != null)
                {
                    Response.Redirect("Homepage.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SignupOrph();

        }



        void SignupOrph()
        {

            try
            {
                string securepass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtOrphPassword.Text, "MD5");
                string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty, fileExtension2 = string.Empty, imagePath2 = string.Empty;
                bool isValidToExecute = false;
                int userID = Convert.ToInt32(Request.QueryString["id"]);
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("OPUSERS_CRUD", con);
                cmd.Parameters.AddWithValue("@Action", userID == 0 ? "INSERT" : "UPDATE");
                cmd.Parameters.AddWithValue("@OP_ID", userID);
                cmd.Parameters.AddWithValue("@OP_NAME", txtOrphanageName.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_ADD", OPLoc.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_CONT", txtOPContactNum.Text.Trim());
                //  cmd.Parameters.AddWithValue("@OP_CRT", SqlDbType.Binary).Value = bytes;
                cmd.Parameters.AddWithValue("@OP_MAIL", txtOPEmailAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_DATE", txtOPDateEstab.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_ZIP", txtOPZipCode.Text.Trim());
                //cmd.Parameters.AddWithValue("@OP_TYPE", SqlDbType.VarChar).Value = filename1;
                cmd.Parameters.AddWithValue("@OP_ABOUT", txtOPAboutUs.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_UNAME", txtOrphUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_PASS", securepass);
                cmd.Parameters.AddWithValue("@OP_PROV", txtOPProvince.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_LAT", OPLat.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_LON", OPLon.Text.Trim());
                cmd.Parameters.AddWithValue("@orp_num", txtnumOrph.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_SOLCT", txtPermit.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_LCENSE", txtLicense.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_ACDTN", txtAccreditation.Text.Trim());
                cmd.Parameters.AddWithValue("@OP_PNC", txtPNC.Text.Trim());
                if (OPFile.HasFile)
                {
                    string filePath = OPFile.PostedFile.FileName; // getting the file path of uploaded file  
                    string filename1 = Path.GetFileName(filePath); // getting the file name of uploaded file  
                    string ext = Path.GetExtension(filename1); // getting the file extension of uploaded file  
                    Stream fs = OPFile.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs); //reads the binary files  
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length); //counting the file length into bytes  
                    cmd.Parameters.AddWithValue("@OP_CRT", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.AddWithValue("@OP_TYPE", SqlDbType.VarChar).Value = filename1;
                    cmd.Parameters.AddWithValue("@OP_STAT", "Pending");

                }
                if (FileUpload1.HasFile)
                {
                    if (Connection.Utils.IsValidExtension(FileUpload1.FileName))
                    {
                        Guid obj = Guid.NewGuid();
                        fileExtension = Path.GetExtension(FileUpload1.FileName);
                        imagePath = "Images/OrphanagePictures/" + obj.ToString() + fileExtension;
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/OrphanagePictures/") + obj.ToString() + fileExtension);
                        cmd.Parameters.AddWithValue("@OP_IMG", imagePath);
                        isValidToExecute = true;
                    }
                    else
                    {
                        isValidToExecute = false;
                        lblMsg.Visible = true;
                        lblMsg.Text = "Please select .jpg, .jpeg or .png image";
                        lblMsg.CssClass = "alert alert-danger";

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


                        SqlCommand cmd2 = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_UNAME ='" + txtOrphUsername.Text + "'", con);
                        SqlDataReader dr = cmd2.ExecuteReader();
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                usename = dr.GetValue(11).ToString();
                                idOp = dr.GetValue(0).ToString();




                            }

                        }
                        SqlCommand cmd1 = new SqlCommand("INSERT INTO NotifAd(name, orphname, msg, placed)values(@name, @orphname, @msg, @placed)", con);
                        cmd1.Parameters.AddWithValue("@name", "admin");
                        cmd1.Parameters.AddWithValue("@orphname", idOp);
                        cmd1.Parameters.AddWithValue("@msg", "Please Check my Informaation");
                        cmd1.Parameters.AddWithValue("@placed", "no");
                        cmd1.ExecuteNonQuery();

                        //SqlCommand cmd1 = new SqlCommand("INSERT INTO NotifAd(name, orphname, msg, placed)values(@name, @orphname, @msg, @placed)", con);
                        //cmd1.Parameters.AddWithValue("@name", "admin");
                        //cmd1.Parameters.AddWithValue("@orphname", txtOrphanageName.Text.Trim());
                        //cmd1.Parameters.AddWithValue("@msg", "Please Check my Informaation");
                        //cmd1.Parameters.AddWithValue("@placed", "no");
                        //cmd1.ExecuteNonQuery();
                        actionName = userID == 0 ?
                            "Registration is successful! <b> <a href='LoginPage2.aspx'></a> </b> Please wait until the Admin approve your registration." :
                            "Details Has Been Updated Successfully! <b> <a href='OrphanageProfile.aspx'></a> </b>";
                        lblMsg.Visible = true;
                        lblMsg.Text = "<b>" + txtOrphUsername.Text.Trim() + "</b>&nbsp" + actionName;
                        lblMsg.CssClass = "alert alert-success";
                        if (userID != 0)
                        {
                            Response.AddHeader("REFRESH", "1;URL=OrphanageProfile.aspx");
                        }
                        clear();
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "<b>" + txtOrphUsername.Text.Trim() + "</b> Username already exist, try new one!";
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

                //}

            }
            catch (Exception ex)
            {

            }

        }


        private void clear()
        {
            txtOrphanageName.Text = string.Empty;
            txtOPEmailAdd.Text = string.Empty;
            txtOPContactNum.Text = string.Empty;
            txtOrphUsername.Text = string.Empty;
            txtOrphPassword.Text = string.Empty;
            txtOPProvince.Text = string.Empty;
            txtOPZipCode.Text = string.Empty;
            txtOPDateEstab.Text = string.Empty;


        }

        //password custom validator
        protected void OrphPasswordCV_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int len = args.Value.Length;
            if (len >= 8 && len <= 15)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }



        //sign up button click event

        protected void getOrphDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("OPUSERS_CRUD", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("OP_ID", Request.QueryString["id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                txtOrphPassword.CausesValidation = false;
                txtOrphanageName.Text = dt.Rows[0]["OP_NAME"].ToString();
                //txtOrphanageAddress.Text = dt.Rows[0]["OP_ADD"].ToString();
                txtOPProvince.Text = dt.Rows[0]["OP_PROV"].ToString();
                txtOPDateEstab.Text = dt.Rows[0]["OP_DATE"].ToString();
                txtOPZipCode.Text = dt.Rows[0]["OP_ZIP"].ToString();
                imgOrph.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["OP_IMG"].ToString())
                    ? "../Images/no-photo.png" : "../" + dt.Rows[0]["OP_IMG"].ToString();
                imgOrph.Height = 200;
                imgOrph.Width = 200;
                txtOPEmailAdd.Text = dt.Rows[0]["OP_MAIL"].ToString();
                txtOPContactNum.Text = dt.Rows[0]["OP_CONT"].ToString();
                txtOPDateEstab.Text = dt.Rows[0]["OP_DATE"].ToString();
                txtOPAboutUs.Text = dt.Rows[0]["OP_ABOUT"].ToString();
                txtOrphUsername.Text = dt.Rows[0]["OP_UNAME"].ToString();
                txtOrphPassword.Text = dt.Rows[0]["OP_PASS"].ToString();
                txtOrphPassword.TextMode = TextBoxMode.SingleLine;
                txtnumOrph.Text = dt.Rows[0]["orp_num"].ToString();
                txtPermit.Text = dt.Rows[0]["OP_SOLCT"].ToString();
                txtLicense.Text = dt.Rows[0]["OP_LCENSE"].ToString();
                txtAccreditation.Text = dt.Rows[0]["OP_ACDTN"].ToString();
                txtPNC.Text = dt.Rows[0]["OP_PNC"].ToString();




            }
            OrphPassRFV.Enabled = false;
            RegularExpressionValidator3.Enabled = false;
            divHideOrphUpdate.Visible = false;
            divAttach.Visible = false;
            divPolicy.Visible = false;
            divAboutUs.Visible = true;
            divProfPic.Visible = true;
            btnSubmit.Text = "UPDATE";
        }
    }
}




//SqlConnection con;
//SqlCommand cmd;
//SqlDataAdapter sda;
//DataTable dt;
//string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
//bool isValidToExecute = false;
//int userId = Convert.ToInt32(Request.QueryString["id"]);
//con = new SqlConnection(con.GetConnectionString());
//cmd = new SqlCommand("User_Crud", con);
//cmd.Parameters.AddWithValue("@Action", userId == 0 ? "INSERT" : "UPDATE");
//cmd.Parameters.AddWithValue("@UserId", userId);
//cmd.Parameters.AddWithValue("@Orphname", txtOrphanageName.Text.Trim());
//cmd.Parameters.AddWithValue("@OrphAddress", txtOrphanageAddress.Text.Trim());
//cmd.Parameters.AddWithValue("@Email", txtOPEmailAdd.Text.Trim());
//cmd.Parameters.AddWithValue("@Contact", txtOPContactNum.Text.Trim());
//cmd.Parameters.AddWithValue("@Username", txtOrphUsername.Text.Trim());
//cmd.Parameters.AddWithValue("@Password", txtOrphPassword.Text.Trim());


//clear();





//        }

//        private void clear()
//{
//    txtOrphanageName.Text = string.Empty;
//    txtOrphanageAddress.Text = string.Empty;
//    txtOPEmailAdd.Text = string.Empty;
//    txtOPContactNum.Text = string.Empty;
//    txtOrphUsername.Text = string.Empty;
//    txtOrphPassword.Text = string.Empty;



//}