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

namespace WarmHearts.User
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public string lati { get; set; }
        public string longi { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadcrumb"] = "Dashboard";
                if (Session["adminx"] == null)
                {
                    Response.Redirect("LoginPage2.aspx");
                }

            }
           
        }

       
    }
}