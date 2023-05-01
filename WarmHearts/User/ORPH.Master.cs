using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WarmHearts.User
{
    public partial class ORPH : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                LKBtnLogout.Visible = true;
            }
            else if (Session["OP_ID"] != null)
            {
                lbProfile.Visible = false;
                LKBtnLogin.Visible = false;
                LKBtnLogout.Visible = true;
                LKBtnSignup.Visible = false;
            }
        }

        protected void LKBtnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO USERLOGS_TBL(OP_ID, TIMESTAMPP, ACTIVITY) VALUES(@OP_ID, @TIMESTAMPP, @ACTIVITY)", con);
                cmd.Parameters.AddWithValue("@OP_ID", Session["OP_ID"]);
                cmd.Parameters.AddWithValue("@TIMESTAMPP", DateTime.Now);
                cmd.Parameters.AddWithValue("@ACTIVITY", "Logout");
                cmd.ExecuteNonQuery();

                Session.Abandon();
                LKBtnLogout.Visible = false;
                Response.Redirect("Homepage.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }

        }
    }
}