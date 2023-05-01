
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.ComponentModel;
using System.IO;
using System.Configuration;


namespace WarmHearts.User
{
    public partial class PostNeedsSched : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DONOR_ID"] == null)
            {
                Response.Redirect("LoginPage2.aspx");
            }
            viewOP();
            viewDnr();
            viewNeeds();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            try
            {

                string name;
                //name = txtFnameDdetails.Text.Trim() + " " + txtLnameDdetails.Text.Trim();
                
                    name = txtFnameDdetails.Text.Trim() + " " + txtLnameDdetails.Text.Trim();


              
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO [Sup_Needs_tbl]([Needs_name], [Needs_Dname], [status], [OP_ID], [post_ID], [DONOR_ID], [date],Op_name)" +
                                                                       " values(@Needs_name, @Needs_Dname, @status, @OP_ID, @post_ID, @DONOR_ID, @date,@Op_name)", con);
                // cmd.Parameters.AddWithValue("@D_NAME", name);
                // cmd.Parameters.AddWithValue("@D_SUPPLIES", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Needs_name", Label2.Text.Trim());
                cmd.Parameters.AddWithValue("@Needs_Dname", name);
                cmd.Parameters.AddWithValue("@status", "no");
                cmd.Parameters.AddWithValue("@OP_ID", Session["op_id"]);
                cmd.Parameters.AddWithValue("@DONOR_ID", Session["DONOR_ID"]);
                cmd.Parameters.AddWithValue("@post_ID", Session["needs_id"]);
                cmd.Parameters.AddWithValue("@date", DateTime.Now);
                cmd.Parameters.AddWithValue("@Op_name", Label1.Text.Trim());



                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("HomePage.aspx");

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

                        txtFnameDdetails.Text = dr.GetValue(1).ToString();
                       // txtMidName.Text = dr.GetValue(2).ToString();
                        txtLnameDdetails.Text = dr.GetValue(3).ToString();
                       // txtAddress.Text = dr.GetValue(4).ToString();




                    }

                }


                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }



        void viewNeeds()
        {
            try
            {


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd1 = new SqlCommand("SELECT * FROM POST_NEEDS WHERE OP_ID ='" + Session["op_id"] + "' and post_ID ='"+ Session["needs_id"] + "'", con);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        Label2.Text = dr.GetValue(1).ToString();
                        // txtMidName.Text = dr.GetValue(2).ToString();
                       // txtLnameDdetails.Text = dr.GetValue(3).ToString();
                        // txtAddress.Text = dr.GetValue(4).ToString();




                    }

                }


                con.Close();



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

    }
}