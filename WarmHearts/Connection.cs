using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WarmHearts
{
    public class Connection
    {
        
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }

        public class Utils
        {
            public static bool IsValidExtension(string fileName)
            {
                bool isValid = false;
                string[] fileExtension = { ".jpg", ".png", ".jpeg" };
                for (int i = 0; i<= fileExtension.Length - 1; i++)
                {
                    if (fileName.Contains(fileExtension[i]))
                    {
                        isValid = true;
                        break;
                    }
                }
                return isValid;
            }

            //Setting default image i their is no image 
            public static string GetImageUrl(Object url)
            {
                string url1 = ""; 
                if(string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
                {
                    url1 = "../Images/no-photo.jpg";
                }
                else
                {
                    url1 = string.Format("../{0}", url);
                }

                return url1;
            }

            public static string GetImageUrl2(Object url)
            {
                string url2 = "";
                if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
                {
                    url2 = "../Images/no-photo.jpg";
                }
                else
                {
                    url2 = string.Format("../{0}", url);
                }

                return url2;
            }

            public static string GetImageUrl3(Object url)
            {
                string url3 = "";
                if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
                {
                    url3 = "../Images/PostNeeds/No_image.png";
                }
                else
                {
                    url3 = string.Format("../{0}", url);
                }

                return url3;
            }

            public static string GetImageUrl4(Object url)
            {
                string url4 = "";
                if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
                {
                    url4 = "../Images/no-photo.jpg";
                }
                else
                {
                    url4 = string.Format("../{0}", url);
                }

                return url4;
            }

            internal static bool IsValidExtension(object filename2)
            {
                throw new NotImplementedException();
            }
        }

    }
}