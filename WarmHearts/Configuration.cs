using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace WarmHearts
{
	public class Configuration
	{
		//string PaypalEmail = HttpContext.Current.Session["op_email"].ToString();
		public Configuration()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		//"sb-h6jrx22990723@business.example.com"
		//testingan pani ug mo gana ba 
		public static string AccountEmail = HttpContext.Current.Session["email"].ToString();
		public static string PayPalUrl = "https://www.sandbox.paypal.com/us/cgi-bin/webscr?";
		//"https://www.paypal.com/cgi-bin/webscr?";
		//"https://www.sandbox.paypal.com/us/cgi-bin/webscr?";
		//last "https://www.sandbox.paypal.com/us/cgi-bin/webscr?";

		//bag"https://www.paypalobjects.com/donate/sdk/donate-sdk.js";
		//"https://www.sandbox.paypal.com/en_PH/i/scr/pixel.gif";
		//public static string logoutEmail = "https://www.sandbox.paypal.com/us/cgi-bin/webscr?cmd=_logout";

		//HttpContext.Current.Session["email"].ToString();

	}
}