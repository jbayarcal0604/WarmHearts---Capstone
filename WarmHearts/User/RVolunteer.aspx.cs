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
    public partial class RVolunteer : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
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
                        txtContactNum.Text = dr.GetValue(8).ToString();
                        txtEmailAdd.Text = dr.GetValue(9).ToString();
                        //OPZip.Text = dr.GetValue(12).ToString();
                        //OPdate.Text = dr.GetValue(13).ToString();


                    }

                }
                SqlCommand cmd2 = new SqlCommand("SELECT * FROM [OP_TABLE] WHERE [OP_ID]=@op_id", con);
                cmd2.Parameters.AddWithValue("@op_id", Session["op_id"]);
                SqlDataReader drr = cmd2.ExecuteReader();

                if (drr.HasRows)
                {
                    while (drr.Read())
                    {
                        txtopname.Text = drr.GetValue(1).ToString();


                    }

                }
                con.Close();

                //Request.QueryString["orphname"] = " ";

                // Response.Write("<script>alert('Orphanage Status Updated Successfuly');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnReqVol_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO REQVOL(V_STATUS, V_NAME, V_EMAIL, DON_ID, OP_ID) values(@V_STATUS, @V_NAME, @V_EMAIL, @DON_ID, @OP_ID)", con);
                cmd.Parameters.AddWithValue("@V_STATUS", "pending");
                cmd.Parameters.AddWithValue("@V_NAME", txtFName.Text.Trim() + " " + txtMidName.Text.Trim() + " " + txtLName.Text.Trim());
                cmd.Parameters.AddWithValue("@V_EMAIL", txtEmailAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@DON_ID", Session["DONOR_ID"]);
                cmd.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
                cmd.ExecuteNonQuery();



                con.Close();

                Response.Write("<script>alert('Request Submitted Successfully !');</script>");
                Response.Redirect("Homepage.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //
        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    string id = Request.QueryString["op_id"];
        //    int op_id = Int32.Parse(id);
        //    //int op_id = 1;
        //    //int d_id = 2;
        //    try
        //    {
        //        SqlConnection conn = new SqlConnection(strcon);

        //        if (conn.State == ConnectionState.Closed)
        //        {
        //            conn.Open();
        //        }

        //        SqlCommand cmd = new SqlCommand("INSERT INTO Volunteer(VOL_STAT, VOL_ACT, D_ID)values(@VOL_STAT, @VOL_ACT, @D_ID)", conn);
        //        cmd.Parameters.AddWithValue("@VOL_STAT", "pending");
        //        cmd.Parameters.AddWithValue("@VOL_ACT", "manaygon");
        //        cmd.Parameters.AddWithValue("@D_ID", Session["DONOR_ID"]);
        //        //cmd.Parameters.AddWithValue("@OP_ID", op_id);

        //        cmd.ExecuteNonQuery();

        //        conn.Close();
        //        Response.Write("<script>alert('Request sent');</script>");
        //        Response.Redirect("Homepage.aspx");
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");
        //    }

        //}
    }
}