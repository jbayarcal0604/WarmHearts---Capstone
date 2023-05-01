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
    public partial class Sponsor : System.Web.UI.Page
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
                
                    ViewState["Filter"] = "ALL";
                    BindGrid();
                    getOrphanageDetails();
                    getMapDetails();
                    getDSWDPermits();
                




            }
        }
        private void BindGrid()
        {
            if (GridView2 != null)
            {
                DataTable dt = new DataTable();

                SqlConnection con = new SqlConnection(strcon);
                SqlDataAdapter sda = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand("spx_Priority");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Filter", ViewState["Filter"].ToString());
                cmd.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
                if (GridView2.HeaderRow != null)
                {
                    DropDownList ddlCountry = (DropDownList)GridView2.HeaderRow.FindControl("ddlCountry");
                    this.BindCountryList(ddlCountry);
                }
            }

        }

        private void BindCountryList(DropDownList ddlCountry)
        {

            SqlConnection con = new SqlConnection(strcon);
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("select distinct priorty from ORPHANS_TBL WHERE OP_ID=@OP_ID");

            cmd.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
            cmd.Connection = con;
            con.Open();
            
            ddlCountry.DataSource = cmd.ExecuteReader();
            ddlCountry.DataTextField = "priorty";
            ddlCountry.DataValueField = "priorty";
            ddlCountry.DataBind();
            con.Close();
            ddlCountry.Items.FindByValue(ViewState["Filter"].ToString())
                    .Selected = true;
        }


        protected void CountryChanged(object sender, EventArgs e)
        {
            DropDownList ddlCountry = (DropDownList)sender;
            ViewState["Filter"] = ddlCountry.SelectedValue;
            this.BindGrid();
        }



        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            this.BindGrid();
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
        //void getMapDetails()
        //{

        //    try
        //    {
        //        using (var db = new SqlConnection(strcon))
        //        {
        //            db.Open();
        //            using (var cmd = db.CreateCommand())
        //            {
        //                cmd.CommandType = CommandType.Text;
        //                cmd.CommandText = "SELECT * FROM OP_TABLE WHERE OP_ID = '" + Session["OP_ID"] + "'";
        //                SqlDataReader rdr = cmd.ExecuteReader();
        //                if (rdr.Read())
        //                {
        //                    //desc.Text = rdr["OP_NAME"].ToString();
        //                    lati = rdr["OP_LAT"].ToString();
        //                    longi = rdr["OP_LON"].ToString();
        //                }
        //                else
        //                {
        //                    Response.Write("<script>'Error!'</script>");
        //                }
        //            }
        //        }
        //    }
        //    catch
        //    {
        //        Response.Write("<script>'Error!'</script>");
        //    }




        //}

        void getMapDetails()
        {

            try
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("OPUSERS_CRUD", con);
                cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
                cmd.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                    lati = dt.Rows[0]["OP_LAT"].ToString();
                    longi = dt.Rows[0]["OP_LON"].ToString();


                }
            }
            catch
            {
                Response.Write("<script>'Error!'</script>");
            }




        }


        void getOrphanageDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("OPUSERS_CRUD", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
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

        //protected void GridViews_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Needs")
        //    {
        //        string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
        //        string orphans = commandArgs[0];
        //        string Op = commandArgs[1];
        //        orphansID.Text = orphans.ToString();
        //        OPS.Text = Op.ToString();
        //        Response.Redirect("Sponsor.aspx");
        //    }
        //}
        protected void lnkSpNeeds_Click(object sender, System.EventArgs e)
        {


            //LinkButton btn = (sender as LinkButton);
            LinkButton btn = (LinkButton)sender;
            string args = btn.CommandArgument;
            string[] comandArgs = args.Split(';');
            string orphans = comandArgs[0];
            string Op = comandArgs[1];
            //TextBox1.Text = orphans;
            //TextBox2.Text = Op;
            Session["orphan_id"] = orphans;
            Session["op_id"] = Op;
            // Response.Write("<script>alert('" + orphans +Op+ "');</script>");
            Response.Redirect("SponsorNeeds.aspx");
            // Response.Redirect(string.Format("SponsorNeeds.aspx?orphan_id={0}&op_id={1}", orphans, Op), false);
        }

        protected void lnkSpEduc_Click(object sender, System.EventArgs e)
        {


            LinkButton btn = (LinkButton)sender;
            string args = btn.CommandArgument;
            string[] comandArgs = args.Split(';');
            string orphans = comandArgs[0];
            string Op = comandArgs[1];
            //TextBox1.Text = orphans;
            //TextBox2.Text = Op;
            Session["orphan_id"] = orphans;
            Session["op_id"] = Op;
            
            // Response.Write("<script>alert('" + orphans +Op+ "');</script>");
            Response.Redirect("SponsorEducation.aspx");
        }

        

    }
}