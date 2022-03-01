using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.SessionState;
using System.Web.UI;
using TravelThings.DAL.Interfaces;
using TravelThings.DAL.BusinessLogic;

namespace TravelThings.Helpers
{
    public class Tools : Page
    {
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

        public static bool CheckAddressExists(string strAddress)
        {
            bool IsExists = false;
            try
            {
                IHelper Dll = new Helper();
                string[] Address = splitAreaAndCity(strAddress);
                if (Address.Length == 2)
                    IsExists = Dll.CheckAddressExists(Address[0].ToString().Trim(), Address[1].ToString().Trim());
                else
                    IsExists = false;
            }
            catch
            {
                throw;
            }
            return IsExists;
        }

        private static string[] splitAreaAndCity(string strAddress)
        {
            string[] Address = strAddress.Split('(');
            if (Address.Length > 1)
                Address[1] = Address[1].Replace(")", "");
            return Address;
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