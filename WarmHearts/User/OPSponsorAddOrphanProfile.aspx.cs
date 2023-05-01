using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using static WarmHearts.Connection;

namespace WarmHearts.User
{
    public partial class OPSponsorAddOrphanProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OPSponsorshipbtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPAddOrphan.aspx");
        }

        protected void OPPstNeeds_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPPostNeeds.aspx");
        }

        protected void OpVwDnrs_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPViewDonors.aspx");
        }

        protected void OPVolunRqst_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPVolunteers.aspx");
        }

        protected void OPreports_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPReports.aspx");
        }

        protected void OPOrphanListID_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPOrphanList.aspx");
        }

        protected void btnAddorUpdate_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int orphID = Convert.ToInt32(hdnID.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Orph_Crud", con);
            cmd.Parameters.AddWithValue("Action", orphID == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("orphan_ID", orphID);
            cmd.Parameters.AddWithValue("Fname", FnameText.Text.Trim());
            cmd.Parameters.AddWithValue("Lname", LnameText.Text.Trim());
            //cmd.Parameters.AddWithValue("Age", AgeText.Text.Trim());
            cmd.Parameters.AddWithValue("IsActive", cbIsActive.Checked);
            if (fuCategoryImage.HasFile)
            {
                if (Utils.IsValidExtension(fuCategoryImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                    imagePath = "Images/Orphans/" + obj.ToString() + fileExtension;
                    fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/Orphans/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpg, .jpeg or .png image";
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
                    actionName = orphID == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Orphan User is " + actionName + " successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    //getOrphans();
                    clear();
                }
                catch(Exception ex)
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

        private void clear()
        {
            FnameText.Text = string.Empty;
            LnameText.Text = string.Empty;
            //AgeText.Text = string.Empty;
            cbIsActive.Checked = false;
            hdnID.Value = "0";
            Button1.Text = "Add";
        }
    }
}