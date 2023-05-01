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
using static WarmHearts.Connection;

namespace WarmHearts.User
{
    public partial class SubmitLostChildPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSLCPSubmit_Click(object sender, EventArgs e)
        {
            //string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            //bool isValidtoExecute = false;
            try
            {
                string filePath = "~/Images/SLCP";
                string fileName = Path.GetFileName(SLCPimg.PostedFile.FileName);
                SLCPimg.SaveAs(Server.MapPath("~/Images/SLCP/" + fileName));
                filePath = "~/Images/SLCP/" + fileName;

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO LostChild_TABLE(LC_Fname, " +
                    "LC_Lname," +
                    "LC_MI," +
                    "LC_Location," +
                    "LC_DateLost," +
                    "LC_TimeLost," +
                    "LC_Image," +
                    "LCGuardian_Fname," +
                    "LCGUardian_Lname," +
                    "LCGUardian_MI," +
                    "LCGUardian_Email," +
                    "LCGUardian_ContactNumber," +
                    "LC_Lat," +
                    "LC_Lon)" +
                    "VALUES (@LC_Fname, @LC_Lname, @LC_MI, @LC_Location, @LC_DateLost, @LC_TimeLost, @LC_Image, @LCGuardian_Fname, @LCGUardian_Lname, @LCGUardian_MI, @LCGUardian_Email, @LCGUardian_ContactNumber, @LC_Lat, @LC_Lon)", conn);

                cmd.Parameters.AddWithValue("@LC_Fname", txtSLCPFName.Text);
                cmd.Parameters.AddWithValue("@LC_Lname", txtSLCPLName.Text);
                cmd.Parameters.AddWithValue("@LC_MI", txtSLCPMI.Text);
                cmd.Parameters.AddWithValue("@LC_Location", LC_Loc.Text);
                cmd.Parameters.AddWithValue("@LC_DateLost", txtSLCPDateLost.Text);
                cmd.Parameters.AddWithValue("@LC_TimeLost", txtSLCPTimeLost.Text);
                cmd.Parameters.AddWithValue("@LC_Lat", LC_lat.Text);
                cmd.Parameters.AddWithValue("@LC_Lon", LC_lon.Text);
                cmd.Parameters.AddWithValue("@LC_Image", filePath);
                //if (SLCPimg.HasFile)
                //{
                //    if (Utils.IsValidExtension(SLCPimg.FileName))
                //    {
                //        Guid obj = Guid.NewGuid();
                //        fileExtension = Path.GetExtension(SLCPimg.PostedFile.FileName);
                //        imagePath = "~/Images/SLCP/";
                //        SLCPimg.SaveAs(Server.MapPath("~/Images/SLCP/" + fileExtension));
                //        cmd.Parameters.AddWithValue("@LC_Image", imagePath);
                //        isValidtoExecute = true;
                //    }
                //    else
                //    {
                //        SLCPlblMsg.Visible = true;
                //        SLCPlblMsg.Text = "Please Select .jpg, .jpeg, or .png Image";
                //        SLCPlblMsg.CssClass = "alert alert-danger";
                //        isValidtoExecute = false;
                //    }
                //}

                //else
                //{

                //}


                cmd.Parameters.AddWithValue("@LCGuardian_Fname", txtSLCPContactInfoFName.Text);
                cmd.Parameters.AddWithValue("@LCGUardian_Lname", txtSLCPContactInfoLName.Text);
                cmd.Parameters.AddWithValue("@LCGUardian_MI", txtSLCPContactInfoMI.Text);
                cmd.Parameters.AddWithValue("@LCGUardian_Email", txtSLCPEmailAdd.Text);
                cmd.Parameters.AddWithValue("@LCGUardian_ContactNumber", txtSLCPContactNum.Text);

                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Write("<script>alert('Submit Successful!');</script>");
                clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error');</script>");
            }
        }

        private void clear()
        {
            txtSLCPFName.Text = "";
            txtSLCPLName.Text = "";
            txtSLCPMI.Text = "";
            //LC_Loc.Text = "";
            txtSLCPDateLost.Text = "";
            txtSLCPTimeLost.Text = "";
            txtSLCPContactInfoFName.Text = "";
            txtSLCPContactInfoLName.Text = "";
            txtSLCPContactInfoMI.Text = "";
            txtSLCPEmailAdd.Text = "";
            txtSLCPContactNum.Text = "";
        }

        protected void btnNearbyDropIns_Click(object sender, EventArgs e)
        {
            Response.Redirect("NearbyDropIns.aspx");
        }
    }
}