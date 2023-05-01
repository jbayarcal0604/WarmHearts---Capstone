using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Web.SessionState;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace WarmHearts.User
{
	public partial class Confirmation : System.Web.UI.Page
	{
		string strcon = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

		public object InvPk;

		protected decimal amount
		{
			get
			{
				if (this._Amount != -1.11M)
					return this._Amount;

				try
				{

				}
				catch { this._Amount = 0.00M; }

				return this._Amount;
			}
		}
		private decimal _Amount = -1.11M;

		override protected void OnInit(EventArgs e)
		{

			InitializeComponent();
			base.OnInit(e);
		}
		private void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_Load);

		}

		protected void Page_Load(object sender, EventArgs e)
		{


			var Mon = Session["Mon"].ToString();
			var name = Session["name"].ToString();




			if (this.amount == 0.00M)
			//	Response.Redirect("MoneyDonation.aspx");


			// Throw away the key
			Session.Remove("amount");

		}

		protected void redi_Click(object sender, EventArgs e)
		{
			Response.Redirect("Homepage.aspx");
		}
	}
}