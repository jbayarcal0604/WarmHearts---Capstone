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
using System.Collections;
using System.Reflection;
using System.Net;
using System.Net.Mail;

namespace WarmHearts.User
{
    public partial class SponsorNeeds : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DONOR_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");
            }
            viewDnr();
            viewOP();
            getOrphanDetails();
        }

        void viewDnr()
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd1 = new SqlCommand("SELECT * FROM DONOR_USERS WHERE DONOR_ID ='" + Session["DONOR_ID"]
                    + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        txtFName.Text = dr.GetValue(1).ToString();
                        txtMidName.Text = dr.GetValue(2).ToString();
                        txtLName.Text = dr.GetValue(3).ToString();
                        txtAddress.Text = dr.GetValue(4).ToString();




                    }

                }


                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        void viewOP()
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd1 = new SqlCommand("SELECT * FROM OP_TABLE WHERE OP_ID ='" + Session["op_id"]
                    + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        Label1.Text = dr.GetValue(1).ToString();




                    }

                }


                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        private void getOrphanDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd1 = new SqlCommand("SELECT * FROM ORPHANS_TBL WHERE orphan_ID ='" + Session["orphan_id"] + "' and OP_ID ='" + Session["op_id"] + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox1.Text = dr.GetValue(1).ToString();
                        TextBox2.Text = dr.GetValue(2).ToString();
                        Needs.Text = dr.GetValue(5).ToString();
                        // TextBox4.Text = dr.GetValue(3).ToString();




                    }

                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }

        protected void SubmitSponsorNeeds_Click(object sender, EventArgs e)
        {
            try
            {
                int count = 0;
                string name;
                //name = txtFnameDdetails.Text.Trim() + " " + txtLnameDdetails.Text.Trim();

                name = txtFName.Text.Trim() + " " + txtLName.Text.Trim();



                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO [Sup_Needs_tbl]([Needs_name], [Needs_Dname], [status], [OP_ID], [orphan_ID], [DONOR_ID], [date])" +
                                                                       " values(@Needs_name, @Needs_Dname, @status, @OP_ID, @orphan_ID, @DONOR_ID, @date)", con);
                // cmd.Parameters.AddWithValue("@D_NAME", name);
                // cmd.Parameters.AddWithValue("@D_SUPPLIES", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Needs_name", Needs.Text.Trim());
                cmd.Parameters.AddWithValue("@Needs_Dname", name);
                cmd.Parameters.AddWithValue("@status", "no");
                cmd.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
                cmd.Parameters.AddWithValue("@DONOR_ID", Session["DONOR_ID"]);
                cmd.Parameters.AddWithValue("@orphan_ID", Session["orphan_id"]);
                cmd.Parameters.AddWithValue("@date", DateTime.Now);
                //tryan pa if mo gana ba 
                if (cmd.ExecuteNonQuery() > 0)
                {
                    // Get total number of donor for the orphans
                    SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM Sup_Needs_tbl WHERE orphan_ID = @orphan_ID AND OP_ID =@OP_ID", con);
                    cmd1.Parameters.AddWithValue("@orphan_ID", Session["orphan_ID"]);
                    cmd1.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
                    object totcount = cmd1.ExecuteScalar();
                    if (totcount != null && totcount != DBNull.Value)
                    {
                        count = Convert.ToInt32(totcount);
                    }
                    // Update the total donors for the orphans
                    SqlCommand cmd2 = new SqlCommand("UPDATE ORPHANS_TBL SET DONATION_NUM=@DONATION_NUM WHERE  orphan_ID=@orphan_ID", con);
                    cmd2.Parameters.AddWithValue("@DONATION_NUM", count);
                    cmd2.Parameters.AddWithValue("@orphan_ID", Session["orphan_ID"]);
                    cmd2.ExecuteNonQuery();
                }

                //cmd.ExecuteNonQuery();

                //SqlCommand cmd1 = con.CreateCommand();
                //cmd1.CommandType = CommandType.Text;
                //cmd1.CommandText = "select * from NotifAd where name='admin' and placed ='no'";
                //cmd1.ExecuteNonQuery();
                //DataTable dt = new DataTable();
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                //da.Fill(dt);
                //count = Convert.ToInt32(dt.Rows.Count.ToString());
                con.Close();
                Response.Redirect("HomePage.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void BackOPOrphanList_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sponsor.aspx");
        }

        //protected void SubmitSponsorNeeds_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }

        //        SqlCommand cmd = new SqlCommand("INSERT INTO SPONSOR_TBL(SP_SUPPLIES, SP_DATE, SP_TIME, OP_ID, DON_ID, orphan_ID) values(@SP_SUPPLIES, @SP_DATE, @SP_TIME, @OP_ID, @DON_ID, @orphan_ID)", con);
        //        cmd.Parameters.AddWithValue("@SP_SUPPLIES", txtSponsorDescription.Text.Trim());
        //        cmd.Parameters.AddWithValue("@SP_DATE", txtDateDS.Text.Trim());
        //        cmd.Parameters.AddWithValue("@SP_TIME", txtTimeDS.Text.Trim());
        //        cmd.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
        //        cmd.Parameters.AddWithValue("@DON_ID", Session["DONOR_ID"]);
        //        cmd.Parameters.AddWithValue("@orphan_ID", Session["orphan_id"]);



        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //        // Session.Remove("email");
        //        Response.Write("<script>alert('Successfully!');</script>");

        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");

        //    }
        //}
    }

}