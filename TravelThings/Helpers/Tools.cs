using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;
using System.Web.UI;

namespace TravelThings.Helpers
{
    public class Tools : Page
    {
        //private static readonly SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString.ToString());
        public string UserName
        {
            get { return Session["UserName"] as string; }
            set { Session["UserName"] = value; }
        }
        public string UserId
        {
            get { return Session["UserId"] as string; }
            set { Session["UserId"] = value; }
        }
        

        public static string Alert(string Message)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(Message);
            sb.Append("')};");
            sb.Append("</script>");
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            return sb.ToString();
        }

        //if (confirm('Are you sure you want to save this thing into the database?')) {
        //  // Save it!
        //  console.log('Thing was saved to the database.');
        //} else {
        //  // Do nothing!
        //  console.log('Thing was not saved to the database.');
        //}

        //<script type = "text/javascript" language="javascript"> 
        //function confirm_user()
        //{
        //    if (confirm("Are you sure you want to go home ?") == true)
        //        return true;
        //    else
        //        return false;
        //}
        //</script>
        public static string AlertConform(string Message)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("if (confirm('");
            sb.Append(Message);
            sb.Append("')){}};");
            sb.Append("</script>");
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            return sb.ToString();
        }
        
        //public static string CurrentUserName { get; set; }
        //public static string CurrentUserId { get; set; }
        //public string CurrentUserName
        //{
        //    get { return CurrentUserName; }
        //    set { UserName = CurrentUserName; }
        //}
        //public string CurrentUserId
        //{
        //    get { return CurrentUserId; }
        //    set { UserId = CurrentUserId; }
        //}



        public static string Encryptdata(string password)
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            strmsg = Convert.ToBase64String(encode);
            return strmsg;
        }
        public static string Decryptdata(string encryptpwd)
        {
            string decryptpwd = string.Empty;
            UTF8Encoding encodepwd = new UTF8Encoding();
            Decoder Decode = encodepwd.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
            int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            decryptpwd = new String(decoded_char);
            return decryptpwd;
        }

        public static string CreateRandomPassword()//int length = 8
        {
            // Create a string of characters, numbers, special characters that allowed in the password  
            string validChars = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*?_-";
            Random random = new Random();

            // Select one random character at a time from the string  
            // and create an array of chars  
            //char[] chars = new char[length];
            char[] chars = new char[8];
            for (int i = 0; i < 8; i++)
            {
                chars[i] = validChars[random.Next(0, validChars.Length)];
            }
            return new string(chars);
        }

        public static bool ExecuteNonQuery(string strQuery)
        {
            bool blnRes = false;
            try
            {
                DataProcessing dtprc = new DataProcessing();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strQuery;
                cmd.CommandType = CommandType.Text;
                blnRes = dtprc.ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
            return blnRes;
        }

        public static DataTable ExecuteReader(string strQuery)
        {
            DataTable dtRes = new DataTable();
            try
            {
                DataProcessing dtprc = new DataProcessing();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strQuery;
                cmd.CommandType = CommandType.Text;
                dtRes = dtprc.ExecuteReader(cmd);
            }
            catch
            {
                throw;
            }
            return dtRes;
        }

        public static object ExecuteScalar(string strQuery)
        {
            object objRes = new object();
            try
            {
                DataProcessing dtprc = new DataProcessing();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strQuery;
                cmd.CommandType = CommandType.Text;
                objRes = dtprc.ExecuteScalar(cmd);
            }
            catch
            {
                throw;
            }
            return objRes;
        }

        public static DataSet ExecuteAdapter(string strQuery)
        {
            DataSet dsRes = new DataSet();
            try
            {
                DataProcessing dtprc = new DataProcessing();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strQuery;
                cmd.CommandType = CommandType.Text;
                dsRes = dtprc.ExecuteAdapter(cmd);
            }
            catch
            {
                throw;
            }
            return dsRes;
        }

    }
}