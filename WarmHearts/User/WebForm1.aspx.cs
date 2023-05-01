using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WarmHearts.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //this function Convert to Encord your Password
        public static string EncodePasswordToBase64(string password)
        {
            try
            {
                byte[] encData_byte = new byte[password.Length];
                encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
                string encodedData = Convert.ToBase64String(encData_byte);
                return encodedData;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in base64Encode" + ex.Message);
            }
        }
        //this function Convert to Decord your Password
        public string DecodeFrom64(string encodedData)
        {
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            System.Text.Decoder utf8Decode = encoder.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encodedData);
            int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            string result = new String(decoded_char);
            return result;
        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Label1.Text = EncodePasswordToBase64(TextBox1.Text);
        //}
        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    Label1.Text = DecodeFrom64(Label1.Text);
        ////}


        protected void Button1_Click1(object sender, EventArgs e)
        {
            Label1.Text = EncodePasswordToBase64(TextBox1.Text);
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Label1.Text = DecodeFrom64(Label1.Text);

        }

    }
}