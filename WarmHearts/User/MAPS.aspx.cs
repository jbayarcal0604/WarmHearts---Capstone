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
    public partial class MAPS : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               DataTable dt = this.GetData(@"SELECT OP_LAT, OP_LON, OP_NAME, OP_ADD FROM OP_TABLE ");
                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();
            }
        }

       private DataTable GetData(string Query)
        {
            SqlCommand cmd = new SqlCommand(Query);
            using(SqlConnection con = new SqlConnection(strcon))
            {
               using(SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using(DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }
}