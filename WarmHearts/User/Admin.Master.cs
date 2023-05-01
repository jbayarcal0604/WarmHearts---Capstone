using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WarmHearts.User
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from NotifAd where name='admin' and placed ='no'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            count = Convert.ToInt32(dt.Rows.Count.ToString());
            //notification1.Text = count.ToString();
            //Notification2.Text = count.ToString();
            //r1.DataSource = dt;
            //r1.DataBind();
            notification1.Text = count.ToString();
            Notification2.Text = count.ToString();
            r1.DataSource = dt;
            r1.DataBind();

        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginPage2.aspx");
        }
    }
}