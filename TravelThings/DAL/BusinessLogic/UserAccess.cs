using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelThings.Helpers;
using TravelThings.DAL.Interfaces;
using System.Data;
using System.Data.SqlClient;

namespace TravelThings.DAL.BusinessLogic
{
    internal class UserAccess : DataProcessing, IUserAccess
    {
        public DataTable InsertUserDetails(string UserName, string strPhoneNo, string strAltPhoneNo, string strEmailId, string strPassword)
        {
            SqlCommand cmd = new SqlCommand("usp_Insert_User_Details");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User_Name", UserName);
            cmd.Parameters.AddWithValue("@Phone_No", strPhoneNo);
            cmd.Parameters.AddWithValue("@UD_Alter_Phone_No", string.IsNullOrEmpty(strAltPhoneNo) ? (object)DBNull.Value : strAltPhoneNo);
            cmd.Parameters.AddWithValue("@UD_EmailId", strEmailId);
            cmd.Parameters.AddWithValue("@UD_Password", strPassword);
            return ExecuteReader(cmd);
        }

        public DataTable GettUserDetails(string UserId)
        {
            SqlCommand cmd = new SqlCommand("usp_Get_User_Details");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User_Id", UserId);
            return ExecuteReader(cmd);
        }

        public bool UpdateUserProfile(string strUserId, string strUserName, string strAltPhoNo, string strAadharNo, string strEmailId, string strAddress)
        {
            SqlCommand cmd = new SqlCommand("usp_Update_User_Profile");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UD_User_Id", strUserId);
            cmd.Parameters.AddWithValue("@UD_User_Name", strUserName);
            cmd.Parameters.AddWithValue("@UD_Alter_Phone_No", (strAltPhoNo == "" || strAltPhoNo == null) ? (object)DBNull.Value.ToString() : strAltPhoNo);
            cmd.Parameters.AddWithValue("@UD_Aadhar_No", strAadharNo);
            cmd.Parameters.AddWithValue("@UD_EmailId", strEmailId);
            cmd.Parameters.AddWithValue("@UD_Address", strAddress);
            return ExecuteNonQuery(cmd);
        }

        public DataTable ConfirmCredentials(string strPhoneNo, string strPassword)
        {
            SqlCommand cmd = new SqlCommand("usp_Confirm_Credentials");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UD_Phone_No", strPhoneNo);
            cmd.Parameters.AddWithValue("@UD_Password", strPassword);
            return ExecuteReader(cmd);
        }
    }
}