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
    public partial class ManageUsers : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadcrumb"] = "Manage Users";
                if (Session["adminx"] == null)
                {
                    Response.Redirect("LoginPage2.aspx");
                }
            }
           

            GridView1.DataBind();
        }

        void getDonorID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM DONOR_USERS WHERE DONOR_ID ='" + dnrID.Text.Trim()
                     + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        fnameText.Text = dr.GetValue(1).ToString();
                        midnameText.Text = dr.GetValue(2).ToString();
                        lnameText.Text = dr.GetValue(3).ToString();
                        dnContact.Text = dr.GetValue(8).ToString();
                        dnAddress.Text = dr.GetValue(4).ToString();
                        dnProv.Text = dr.GetValue(5).ToString();
                        dnZipCode.Text = dr.GetValue(6).ToString();
                        dnDOB.Text = dr.GetValue(7).ToString();
                        dnEmail.Text = dr.GetValue(9).ToString();
                        dnSchool.Text = dr.GetValue(12).ToString();
                        dnWork.Text = dr.GetValue(14).ToString();
                        accstatus.Text = dr.GetValue(19).ToString();


                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateStatusByID(string status)
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE DONOR_USERS SET account_status='"
                    + status + "' WHERE  DONOR_ID='" + dnrID.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Donor Status Updated Successfuly');</script>");



            
               

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }








        }

        bool checkMemberExist()
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM DONOR_USERS WHERE DONOR_ID='" + dnrID.Text.Trim() + "';", con);
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

            }
            return false;
        }

        void deleteDonorById()
        {
            if (checkMemberExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from DONOR_USERS WHERE DONOR_ID='" + dnrID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Donor Deleted Successfully');</script>");
                    clear();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

       void clear()
        {
            fnameText.Text = "";
            lnameText.Text = "";
            accstatus.Text = "";
            dnContact.Text = "";
            dnAddress.Text = "";
            dnProv.Text = "";
            dnZipCode.Text = "";
            dnDOB.Text = "";
            dnEmail.Text = "";
            dnSchool.Text = "";
            dnWork.Text = "";
            accstatus.Text = "";

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getDonorID();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            UpdateStatusByID("Active");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            UpdateStatusByID("Pending");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UpdateStatusByID("InActive");

        }

        protected void dltButton_Click(object sender, EventArgs e)
        {
            deleteDonorById();
        }
    }
    

}



