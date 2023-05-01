using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WarmHearts.User
{
    public partial class ComputeAge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //walay leap year
            //DateTime birthDate = DateTime.Parse(txtBday.Text);
            //TimeSpan age = DateTime.Now - birthDate ;            
            ////double years = Math.Floor(age.TotalDays / 365);
            ////Label1.Text = years.ToString();
            ///

            //naay leap year
            //DateTime birthDate = DateTime.Parse(txtBday.Text);
            //TimeSpan age = DateTime.Now - birthDate;

            //// Calculate the number of leap days
            //double days = age.TotalDays;
            //double leapDays = Math.Floor(days / 366) * 366;

            //// Calculate the age in years
            //double years = (days - leapDays) / 365;

            //// Display the age in years
            //Label1.Text = years.ToString();



            //// apil ang leap year

            //DateTime birthDate = DateTime.Parse(txtBday.Text);
            //DateTime now = DateTime.Now;

            //int years = now.Year - birthDate.Year;
            //int months = now.Month - birthDate.Month;
            //int days = now.Day - birthDate.Day;

            //if (days < 0)
            //{
            //    months--;
            //    days += DateTime.DaysInMonth(birthDate.Year, birthDate.Month);
            //}

            //if (months < 0)
            //{
            //    years--;
            //    months += 12;
            //}

            //// Display the age in years, months, and days
            //Label1.Text = $"{years} years, {months} months, {days} days";
            string input = TextBox1.Text;
            string encodedInput = HttpUtility.HtmlEncode(input);
            Label2.Text = encodedInput;




            //Compute all donations  
//            string connString = "server=hostname;user=username;password=password;database=database_name";
//            MySqlConnection conn = new MySqlConnection(connString);
//            conn.Open();

//            // Define the SELECT query
//            string query = "SELECT SUM(CAST(amount AS DECIMAL(10,2))) FROM donations";

//            // Execute the query
//            MySqlCommand cmd = new MySqlCommand(query, conn);
//            object result = cmd.ExecuteScalar();

//            // Extract the value from the result object
//            decimal totalAmount = Convert.ToDecimal(result);

//            // Print the result
//            Response.Write("Total amount: " + totalAmount);

//            // Close the connection
//            conn.Close();
//        }
//    }
//}


        }
    }
}