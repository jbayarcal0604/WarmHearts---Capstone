using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; 
using System.IO;

namespace WarmHearts.User
{
    public partial class Homepage : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string stat = "Active";
            Session["stat"] = stat;

            if (!this.IsPostBack)
            {
                
                DataTable dt = this.GetData(@"SELECT OP_LAT, OP_LON, OP_NAME, OP_ADD, orp_num, OP_COVERPHOTO   FROM OP_TABLE ");
                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();
            }
            CheckImages();


            //string mainconn = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            //try
            //{
            //SqlConnection cs = new SqlConnection(mainconn);
            //if (cs.State == ConnectionState.Closed)
            //{
            //cs.Open();
            //}

            //SqlCommand cmd = new SqlCommand("SELECT * FROM LostChild_TABLE", cs);
            //SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = cmd;
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //DataList1.DataSource = ds;
            //DataList1.DataBind();
            //cs.Close();
            //}
            //catch (Exception ex)
            //{

            //}
            //BindGrind();
            //GridView1.DataBind();
        }

        private DataTable GetData(string Query)
        {
            SqlCommand cmd = new SqlCommand(Query);
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected string PreviewImage(string filepath)
        {
            string ImageUrl = "";
            if (File.Exists(filepath))
            {
                FileStream fs = new FileStream(filepath, FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                br.Close();
                fs.Close();
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                ImageUrl = "data:image/png;base64," + base64String;
            }
            return ImageUrl;

        }
        private void CheckImages()
        {
            //try
            //{
            //    SqlConnection con = new SqlConnection(strcon);
            //    if(con.State == ConnectionState.Closed)
            //    {
            //        con.Open();
            //    }

            //    SqlCommand cmd = new SqlCommand("SELECT * FROM [OP_TABLE]", con);
            //    SqlDataAdapter sda = new SqlDataAdapter();
            //    sda.SelectCommand = cmd;
            //    DataSet ds = new DataSet();
            //    sda.Fill(ds);
            //    Repeater1.DataSource = ds;
            //    Repeater1.DataBind();
            //    con.Close();
            //}
            //catch (Exception ex)
            //{

            //}
        }

        protected void chk_CheckedChanged(object sender, EventArgs e)
        {

        }
        protected void chkheader_CheckedChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, EventArgs e)
        {

        }

        protected void btnSubmitLostChild_Click(object sender, EventArgs e)
        {
            Response.Redirect("SubmitLostChildPage.aspx");
        }

        protected void btnSubmitFoundChild_Click(object sender, EventArgs e)
        {
            Response.Redirect("SubmitFoundChildPage.aspx");
        }

        protected void DonBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoneyDonation.aspx");
        }

        protected void lnkDonate_Click(object sender, EventArgs e)
        {
            if (Session["DONOR_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");
            }
            if (Session["email"] != null)
            {
                Session.Remove("email");
                HttpContext.Current.Session["email"] = null;
            }

            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            post.Text = id.ToString();
            //Session["op_id"] = postht.Text;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_ID ='" + post.Text.Trim()
                + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["op_id"] = dr.GetValue(0).ToString();
                        Session["op_name"] = dr.GetValue(1).ToString();
                        Session["email"] = dr.GetValue(5).ToString();
                        Response.Redirect("MoneyDonation.aspx");

                    }

                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }



        }



        //protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "volunteer")
        //    {
        //        Session["OP_ID"] = e.CommandArgument;
        //        Response.Redirect("RVolunteer.aspx");
        //    }
        //}
        protected void lnkVolunteer_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            post.Text = id.ToString();
            Session["op_id"] = post.Text;
            Response.Redirect("RVolunteer.aspx");
            //Session["op_id"] = id.ToString();
            // Response.Redirect("RVolunteer.aspx?op_id="+post.Text);
        }


        protected void lnkView_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            post.Text = id.ToString();
            Session["op_id"] = post.Text;
            Response.Redirect("Sponsor.aspx");
            //Session["op_id"] = id.ToString();
            // Response.Redirect("RVolunteer.aspx?op_id="+post.Text);
        }
        //        protected void ReqVol_Click(object sender, EventArgs e)
        //        {

       
        //            //try
        //            //{
        //            //    SqlConnection con = new SqlConnection(strcon);
        //            //    if (con.State == ConnectionState.Closed)
        //            //    {
        //            //        con.Open();
        //            //    }

        //            //    SqlCommand cmd = new SqlCommand("SELECT OP_NAME FROM OP_TABLE WHERE OP_ID ='" + Request.QueryString["OP_ID"]
        //            //    + "'", con);
        //            //    SqlDataReader dr = cmd.ExecuteReader();
        //            //    if (dr.HasRows)
        //            //    {
        //            //        while (dr.Read())
        //            //        {
        //            //            //OPfname.Text = dr.GetValue(1).ToString();
        //            //            //accstatus.Text = dr.GetValue(9).ToString();
        //            //            //OPEmail.Text = dr.GetValue(3).ToString();
        //            //            //OPAddress.Text = dr.GetValue(2).ToString();
        //            //            //OPContact.Text = dr.GetValue(4).ToString();
        //            //            //OPProv.Text = dr.GetValue(11).ToString();
        //            //            //OPZip.Text = dr.GetValue(12).ToString();
        //            //            //OPdate.Text = dr.GetValue(13).ToString();

        //            //           txtop.Text = dr.GetValue(1).ToString();

        //            //        }

        //            //    }


        //            //}
        //            //catch (Exception ex)
        //            //{
        //            //    Response.Write("<script>alert('" + ex.Message + "');</script>");
        //            //}




        //        }

        //protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        // string txnId = GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Values[0].ToString().Trim();
        //        txtop.Text = GridView2.SelectedRow.Cells[0].Text;


        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#ModalVol').modal();", true);

        //    }
        //    catch (Exception ex)
        //    {
        //        //shared.WriteLog(ex.Message, "FindDispatchNote", "gvDDO_SelectedIndexChanged");
        //    }
        //}
    }
}