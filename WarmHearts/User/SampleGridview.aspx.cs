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
    public partial class SampleGridview : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["Filter"] = "ALL";
                BindGrid();
            }

        }

        private void BindGrid()
        {
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(strcon);
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("spx_Priority");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Filter", ViewState["Filter"].ToString());
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            DropDownList ddlCountry =
                (DropDownList)GridView2.HeaderRow.FindControl("ddlCountry");
            this.BindCountryList(ddlCountry);
        }

        private void BindCountryList(DropDownList ddlCountry)
        {

            SqlConnection con = new SqlConnection(strcon);
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("select distinct priorty" +
                            " from ORPHANS_TBL");
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

    }
    
}