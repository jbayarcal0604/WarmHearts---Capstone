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
    public partial class SubmitFoundChildPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSFCPPublish_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO FoundChild_TABLE(FC_Fname," +
                    "FC_Lname," +
                    "FC_MI," +
                    "FC_Location," +
                    "FC_DateLost," +
                    "FC_TimeLost," +
                    "FCFinder_Fname," +
                    "FCFinder_Lname," +
                    "FCFinder_MI," +
                    "FCFinder_Email," +
                    "FCFinder_ContactNumber) VALUES (@FC_Fname, @FC_Lname, @FC_MI, @FC_Location, @FC_DateLost, @FC_TimeLost, @FCFinder_Fname, @FCFinder_Lname, @FCFinder_MI, @FCFinder_Email, @FCFinder_ContactNumber)", con);
                cmd.Parameters.AddWithValue("@FC_Fname", txtSFCPFName.Text);
                cmd.Parameters.AddWithValue("@FC_Lname", txtSFCPLName.Text);
                cmd.Parameters.AddWithValue("@FC_MI", txtSFCPMI.Text);
                cmd.Parameters.AddWithValue("@FC_Location", txtSFCPLoccation.Text);
                cmd.Parameters.AddWithValue("@FC_DateLost", txtSFCPDateLost.Text);
                cmd.Parameters.AddWithValue("@FC_TimeLost", txtSFCPTimeLost.Text);
                cmd.Parameters.AddWithValue("@FCFinder_Fname", txtSFCPContactInfoFName.Text);
                cmd.Parameters.AddWithValue("@FCFinder_Lname", txtSFCPContactInfoLName.Text);
                cmd.Parameters.AddWithValue("@FCFinder_MI", txtSFCPContactInfoMI.Text);
                cmd.Parameters.AddWithValue("@FCFinder_Email", txtSFLPEmailAdd.Text);
                cmd.Parameters.AddWithValue("@FCFinder_ContactNumber", txtSFLPContactNum.Text);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Submit Successful!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error!');</script>");
            }
        }

        protected void btnNearbyDropIns_Click(object sender, EventArgs e)
        {
            Response.Redirect("NearbyDropIns.aspx");
        }
    }
}