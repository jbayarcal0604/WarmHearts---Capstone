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
    public partial class DnrProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        //static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DONOR_ID"] == null)
                {
                    Response.Redirect("LoginPage2.aspx");
                }
                else
                {
                    getDonorDetails();
                    GetDonationHistory();
                    getSponsors();
                    DonNeeds();
                }
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE DONATION SET D_STAT='"
                    + "R" + "' WHERE  DON_ID ='" + Session["DONOR_ID"] + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getDonorDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("DonorUsers_CRUD", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@DONOR_ID", Session["DONOR_ID"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            if (dt.Rows.Count == 1)
            {
                Session["DONOR_FNAME"] = dt.Rows[0]["DONOR_FNAME"].ToString();
                Session["DONOR_MNAME"] = dt.Rows[0]["DONOR_MNAME"].ToString();
                Session["DONOR_LNAME"] = dt.Rows[0]["DONOR_LNAME"].ToString();
                Session["DONOR_ADD"] = dt.Rows[0]["DONOR_ADD"].ToString();
                Session["DONOR_EMAIL"] = dt.Rows[0]["DONOR_EMAIL"].ToString();
                Session["DONOR_CONT"] = dt.Rows[0]["DONOR_CONT"].ToString();
                Session["DONOR_PIMAGE"] = dt.Rows[0]["DONOR_PIMAGE"].ToString();



            }


        }
        void DonNeeds()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Sup_Needs_tbl where DONOR_ID='" + Session["DONOR_ID"] + "' and status='yes'", con);
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Repeater2.DataSource = ds;
                Repeater2.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }
        void GetDonationHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM DONATION where DON_ID='" + Session["DONOR_ID"] + "'", con);
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Rep2.DataSource = ds;
                Rep2.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }

        private void getSponsors()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("SELECT D_OPNAME, D_ORPHAN, D_AMOUNT, D_SPSDATE, D_SPEDATE, orphan_ID, ORPH_ID FROM DONATION WHERE ((DON_ID='" + Session["DONOR_ID"] + "') AND ([orphan_ID] IS NOT NULL))", con);
                    SqlDataAdapter sdaa = new SqlDataAdapter();
                    DataSet ds = new DataSet();
                    sdaa.SelectCommand = cmd;
                    sda.Fill(ds);
                    //Repeater2.DataSource = ds;
                    //Repeater2.DataBind();
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    DateTime dt = Convert.ToDateTime(e.Row.Cells[3].Text);
                    DateTime today = DateTime.Today;

                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.Red;

                    }
                }
            }
            catch (Exception ex)
            {
                //  Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            GridViewRow row = (GridViewRow)button.NamingContainer;
            //int orphanId = (int)DataBinder.Eval(row.DataItem, "orphan_ID");
            //int opId = (int)DataBinder.Eval(row.DataItem, "OP_ID");
            int orphanId = Convert.ToInt32(row.Cells[4].Text);
            int opId = Convert.ToInt32(row.Cells[5].Text);
            Session["orphan_id"] = orphanId;
            Session["id_op"] = opId;
            Response.Redirect("SponsorEducation.aspx");
        }



    }

}