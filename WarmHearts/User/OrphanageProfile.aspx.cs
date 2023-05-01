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
    public partial class OrphanageProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        public string lati { get; set; }
        public string longi { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["OP_ID"] == null)
                {
                    Response.Redirect("LoginPage2.aspx");
                }
                else
                {
                    getOrphanageDetails();
                    getDSWDPermits();
                    getMapDetails();
                }
                getDataPost();
            }
        }

        void getMapDetails()
        {

            try
            {
                using (var db = new SqlConnection(strcon))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM OP_TABLE WHERE OP_ID = '" + Session["OP_ID"] + "'";
                        SqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            //desc.Text = rdr["OP_NAME"].ToString();
                            lati = rdr["OP_LAT"].ToString();
                            longi = rdr["OP_LON"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>'Error!'</script>");
                        }
                    }
                }
            }
            catch
            {
                Response.Write("<script>'Error!'</script>");
            }




        }
        void getDSWDPermits()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("OPUSERS_CRUD", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@OP_ID", Session["OP_ID"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rptr2.DataSource = dt;
            rptr2.DataBind();
            if (dt.Rows.Count == 1)
            {
                Session["OP_SOLCT"] = dt.Rows[0]["OP_SOLCT"].ToString();
                Session["OP_LCENSE"] = dt.Rows[0]["OP_LCENSE"].ToString();
                Session["OP_ACDTN"] = dt.Rows[0]["OP_ACDTN"].ToString();
                Session["OP_PNC"] = dt.Rows[0]["OP_PNC"].ToString();


            }
        }

        void getOrphanageDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("OPUSERS_CRUD", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@OP_ID", Session["OP_ID"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrphProfile.DataSource = dt;
            rOrphProfile.DataBind();
            if (dt.Rows.Count == 1)
            {
                Session["OP_NAME"] = dt.Rows[0]["OP_NAME"].ToString();
                Session["OP_ADD"] = dt.Rows[0]["OP_ADD"].ToString();
                Session["OP_MAIL"] = dt.Rows[0]["OP_MAIL"].ToString();
                Session["OP_CONT"] = dt.Rows[0]["OP_CONT"].ToString();
                Session["OP_IMG"] = dt.Rows[0]["OP_IMG"].ToString();


            }
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

        protected void OPSponsorship_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPAddOrphans2.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridView1.EditIndex = e.NewEditIndex;
            //GridView1.DataSource = SqlDataSource1;
            //GridView1.DataBind();
            //GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //GridView1.EditIndex = -1;
            //GridView1.DataSource = SqlDataSource1;
            //GridView1.DataBind();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //TextBox pneeds = GridView1.Rows[e.RowIndex].FindControl
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //string filePath = "~/Images/PostNeeds/";
            //string fileName = Path.GetFileName(FileImg.PostedFile.FileName);
            //FileImg.SaveAs(Server.MapPath("~/Images/PostNeeds/" + fileName));
            //filePath = "~/Images/PostNeeds/" + fileName;

            //try
            //{
            //    SqlConnection con = new SqlConnection(strcon);
            //    if (con.State == ConnectionState.Closed)
            //    {
            //        con.Open();
            //    }

            //    SqlCommand cmd = new SqlCommand("INSERT INTO PostNeeds_TBL (post_needs, post_img) VALUES (@pstneeds, @pstimg)", con);

            //    cmd.Parameters.AddWithValue("@pstneeds", txtPostNeeds.Text.Trim());
            //    cmd.Parameters.AddWithValue("@pstimg", filePath);

            //    cmd.ExecuteNonQuery();
            //    con.Close();

            //    Response.Write("<script>alert('Needs Posted');</script>");
            //    clear();
            //    getDataPost();
            //}
            //catch (Exception ex)
            //{
            //    Response.Write("<script>alert('Error!');</script>");
            //}
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int postID = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("NEEDS_CRUD", con);
            cmd.Parameters.AddWithValue("@Action", postID == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@post_ID", postID);
            cmd.Parameters.AddWithValue("@post_needs", txtPostNeeds.Text.Trim());
            cmd.Parameters.AddWithValue("@OP_ID", Session["OP_ID"]);
            if (FileImg.HasFile)
            {
                if (Utils.IsValidExtension(FileImg.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(FileImg.FileName);
                    imagePath = "Images/PostNeeds/" + obj.ToString() + fileExtension;
                    FileImg.PostedFile.SaveAs(Server.MapPath("~/Images/PostNeeds/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@post_img", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or .png image.";
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
                    actionName = postID == 0 ? "posted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Needs " + actionName + " successfully.";
                    lblMsg.CssClass = "alert alert-success";
                    getDataPost();
                    clear();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-success";
                }
                finally
                {
                    con.Close();
                }
            }
        }

        private void clear()
        {
            txtPostNeeds.Text = string.Empty;
            hdnId.Value = "0";
            btnSubmitOrUpdate.Text = "Submit";
            OPPostNeedsimgprw.ImageUrl = String.Empty;
        }

        private void getDataPost()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM POST_NEEDS where OP_ID='" + Session["OP_ID"] + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                rPostNeeds.DataSource = ds;
                rPostNeeds.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }
        protected void rPostNeeds_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            if (e.CommandName == "edit")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("NEEDS_CRUD", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@post_ID", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtPostNeeds.Text = dt.Rows[0]["post_needs"].ToString();
                OPPostNeedsimgprw.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["post_img"].ToString()) ? "../Images/PostNeeds/No_image.png" : "../" + dt.Rows[0]["post_img"].ToString();
                OPPostNeedsimgprw.Height = 200;
                OPPostNeedsimgprw.Width = 260;
                hdnId.Value = dt.Rows[0]["post_ID"].ToString();
                btnSubmitOrUpdate.Text = "Update";
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge-warning";

            }
            else if (e.CommandName == "delete")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("PostNeeds_CRUD", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@post_ID", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Needs deleted successfully.";
                    lblMsg.CssClass = "alert alert-success";
                    getDataPost();
                    clear();
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

        protected void rPostNeeds_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            //    Label lbl = e.Item.FindControl("lblIsActive") as Label;
            //    if(lbl.Text == "True")
            //    {
            //        lbl.Text = "True";
            //        lbl.CssClass = "badge badge-success";
            //    }
            //    else
            //    {
            //        lbl.Text = "In-Active";
            //        lbl.CssClass = "badge badge-danger";
            //    }
            //}
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clear();
            btnClear.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

    }
}