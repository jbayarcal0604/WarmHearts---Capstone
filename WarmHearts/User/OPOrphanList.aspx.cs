using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WarmHearts.User
{
    public partial class OPOrphanList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["OP_ID"] == null)
                {
                    Response.Redirect("LoginPage2.aspx");
                }
                else
                {

                }
            }
        }

        protected void OPAddOrphan_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPAddOrphans2.aspx");
        }

        protected void OPOrphanListID_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPOrphanList.aspx");
        }

        protected void OPPstNeeds_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPPostNeeds.aspx");
        }

        protected void OpVwDnrs_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPViewDonors.aspx");
        }

        protected void OPVolunRqst_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPVolunteers.aspx");
        }

        protected void OPreports_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OPReports.aspx");
        }
    }
}