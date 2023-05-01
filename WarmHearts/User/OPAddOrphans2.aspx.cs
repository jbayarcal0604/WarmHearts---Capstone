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
    public partial class OPAddOrphans2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //if (Session["OP_ID"] == null)
                //{
                //    Response.Redirect("LoginPage2.aspx");
                //}

            }
        }

        protected void btnAddorUpdate_Click(object sender, EventArgs e)
        {

            try
            {
                int donNum = 0;
                int ages;
                string filePath = "~/Images/Orphans/";
                string fileName = Path.GetFileName(FileImg.PostedFile.FileName);
                FileImg.SaveAs(Server.MapPath("~/Images/Orphans/" + fileName));
                filePath = "~/Images/Orphans/" + fileName;

                DateTime birthDate = DateTime.Parse(txtBday.Text);
                TimeSpan age = DateTime.Now - birthDate;
                double years = age.TotalDays / 365;
                ages = (int)Math.Round(years);
                //Response.Redirect("OPAddorphans2.aspx");

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }


                SqlCommand cmd = new SqlCommand("INSERT INTO ORPHANS_TBL(Fname, Lname, Age, Needs, priorty, DOB, Gender, dscrpt, ImageUrl, OP_ID, DONATION_NUM)" +
                        "values(@Fname, @Lname, @Age, @Needs, @priorty, @DOB, @Gender, @dscrpt, @ImageUrl, @OP_ID, @DONATION_NUM)", conn);


                cmd.Parameters.AddWithValue("@Fname", FnameText.Text.Trim());
                cmd.Parameters.AddWithValue("@Lname", LnameText.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", ages);
                cmd.Parameters.AddWithValue("@Needs", txtNeeds.Text.Trim());
                cmd.Parameters.AddWithValue("@priorty", ddlPrio.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@DOB", txtBday.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@dscrpt", dscrpTEXT.Text.Trim());
                cmd.Parameters.AddWithValue("@ImageUrl", filePath);
                cmd.Parameters.AddWithValue("@OP_ID", Session["OP_ID"]);
                cmd.Parameters.AddWithValue("@DONATION_NUM", donNum);

                cmd.ExecuteNonQuery();
                conn.Close();

                clear();
                Response.Write("<script>alert('Submit Successful!');</script>");
                // clear();

                //if (FileImg.HasFile)
                //{
                //    if (Utils.IsValidExtension(FileImg.FileName))
                //    {
                //        Guid obj = Guid.NewGuid();
                //        fileExtension = Path.GetExtension(FileImg.FileName);
                //        imagePath = "Images/Orphans/" + obj.ToString() + fileExtension;
                //        FileImg.PostedFile.SaveAs(Server.MapPath("~/Images/Orphans/") + obj.ToString() + fileExtension);
                //        cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                //        isValidtoExecute = true;
                //    }
                //    else
                //    {//////////////////////////////////
                //        lblMsg.Visible = true;
                //        lblMsg.Text = "Please Select .jpg, .jpeg, or .png Image";
                //        lblMsg.CssClass = "alert alert-danger";
                //        isValidtoExecute = false;
                //    }
                //}





            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }




        //go button
        protected void goBtn_Click(object sender, EventArgs e)
        {
            getOrphanID();
        }

        //get orphan id
        void getOrphanID()
        {
            try
            {
                RVneeds.Enabled = false;
                revInput.Enabled = false;
                RVddl.Enabled = false;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM ORPHANS_TBL WHERE orphan_ID='" + orphID.Text.Trim() + "' AND OP_ID='" + Session["OP_ID"] + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                //ddlPrio.Items.Add(new ListItem("High Priority", "High Priority"));
                //ddlPrio.Items.Add(new ListItem("Medium Priority", "Medium Priority"));
                //ddlPrio.Items.Add(new ListItem("Low Priority", "Low Priority"));

                da.Fill(dt);
                //ddlGender.DataSource = dt;
                //ddlGender.DataValueField = "Gender";
                //ddlGender.DataTextField = "Gender";
                //ddlGender.DataBind();


                //ddlPrio.DataSource = dt;
                //ddlPrio.DataValueField = "priorty";
                //ddlPrio.DataTextField = "priorty";
                //ddlPrio.DataBind();

                if (dt.Rows.Count >= 1)
                {
                    FnameText.Text = dt.Rows[0]["Fname"].ToString().Trim();
                    LnameText.Text = dt.Rows[0]["Lname"].ToString().Trim();
                    txtNeeds.Text = dt.Rows[0]["Needs"].ToString().Trim();
                    ddlPrio.SelectedValue = dt.Rows[0]["priorty"].ToString().Trim();
                    // AgeText.Text = dt.Rows[0]["Age"].ToString().Trim();
                    txtNeeds.Text = dt.Rows[0]["Needs"].ToString().Trim();
                    txtBday.Text = dt.Rows[0]["DOB"].ToString().Trim();
                    ddlGender.SelectedValue = dt.Rows[0]["Gender"].ToString().Trim();
                    dscrpTEXT.Text = dt.Rows[0]["dscrpt"].ToString().Trim();
                    global_filepath = dt.Rows[0]["ImageUrl"].ToString();



                }
                else
                {
                    Response.Write("<script>alert('Error!');</script>");
                }


            }
            catch (Exception ex)
            {

            }





        }

        bool checkIfOrphanExist()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM ORPHANS_TBL where orphan_ID = '" + orphID.Text.Trim() + "';", con);
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
                return false;

            }
        }

        //UPDATE ORPHAN
        //void UpdateOrphanByID()
        //{
        //    if (checkIfOrphanExist())
        //    {
        //        try
        //        {

        //string filePath = "~/Images/Orphans/";
        //string fileName = Path.GetFileName(FileImg.PostedFile.FileName);
        //FileImg.SaveAs(Server.MapPath("~/Images/Orphans/" + fileName));
        //            filePath = "~/Images/Orphans/" + fileName;

        //            if (fileName == "" || fileName == null)
        //            {
        //                filePath = global_filepath;
        //            }
        //            else
        //            {
        //                FileImg.SaveAs(Server.MapPath("~/Images/Orphans/" + fileName));
        //                filePath = "~/Images/Orphans/" + fileName;
        //            }



        //            SqlConnection con = new SqlConnection(strcon);
        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();
        //            }
        //            SqlCommand cmd = new SqlCommand("UPDATE Orphan_USER SET Fname=@Fname, Lname=@Lname," +
        //                "Age=@Age, Gender=@Gender, DOB=@DOB, dscrpt=@dscrpt WHERE orphan_ID = '" + orphID.Text.Trim() + "'", con);

        //                cmd.Parameters.AddWithValue("Fname", FnameText.Text.Trim());
        //                cmd.Parameters.AddWithValue("Lname", LnameText.Text.Trim());
        //                cmd.Parameters.AddWithValue("Age", AgeText.ToString());
        //                cmd.Parameters.AddWithValue("Gender", ddlGender.SelectedItem.Value);
        //                cmd.Parameters.AddWithValue("DOB", txtBday.Text.Trim());
        //                cmd.Parameters.AddWithValue("dscrpt", DscrpText.Text.Trim());
        //                //cmd.Parameters.AddWithValue("ImageUrl", filePath);


        //                cmd.ExecuteNonQuery();
        //                con.Close();

        //        Response.Write("<script>alert('Orphan Updated Successfuly!');</script>");

        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write("<script>alert('" + ex.Message + "');</script>");
        //        }
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Invalid Orphan ID');</script>");
        //    }

        //}


        void UpdateOrphanByID()
        {
            if (checkIfOrphanExist())
            {
                try
                {
                    int ages;
                    DateTime birthDate = DateTime.Parse(txtBday.Text);
                    TimeSpan age = DateTime.Now - birthDate;
                    double years = age.TotalDays / 365;
                    ages = (int)Math.Round(years);

                    string filePath = "~/Images/Orphans/";
                    string fileName = Path.GetFileName(FileImg.PostedFile.FileName);
                    //FileImg.SaveAs(Server.MapPath("~/Images/Orphans/" + fileName));
                    //filePath = "~/Images/Orphans/" + fileName;

                    if (fileName == "" || fileName == null)
                    {
                        filePath = global_filepath;
                    }
                    else
                    {
                        FileImg.SaveAs(Server.MapPath("~/Images/Orphans/" + fileName));
                        filePath = "~/Images/Orphans/" + fileName;
                    }



                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE ORPHANS_TBL SET Fname=@Fname, Lname=@Lname, Age=@Age," +
                        "Gender=@Gender, DOB=@DOB, [Needs]= @Needs, [priorty] = @priorty, dscrpt=@dscrpt, ImageUrl=@ImageUrl WHERE orphan_ID = '" + orphID.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("Fname", FnameText.Text.Trim());
                    cmd.Parameters.AddWithValue("Lname", LnameText.Text.Trim());
                    cmd.Parameters.AddWithValue("Age", ages);
                    cmd.Parameters.AddWithValue("Gender", ddlGender.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("DOB", txtBday.Text.Trim());
                    cmd.Parameters.AddWithValue("Needs", txtNeeds.Text.Trim());
                    cmd.Parameters.AddWithValue("priorty", ddlPrio.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("dscrpt", dscrpTEXT.Text.Trim());
                    cmd.Parameters.AddWithValue("ImageUrl", filePath);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    clear();
                    Response.Write("<script>alert('Orphan Updated Successfuly!');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Orphan ID');</script>");
            }

        }

        void clear()
        {
            FnameText.Text = "";
            LnameText.Text = "";
            // AgeText.Text = "";
            txtBday.Text = "";
            dscrpTEXT.Text = "";
        }


        protected void OPOrphanListID_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPOrphanList.aspx");
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

        protected void OPSponsorshipbtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPAddOrphans2.aspx");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            UpdateOrphanByID();
        }
    }




}