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
    internal class TransactionAccess : DataProcessing, ItransactionAccess
    {
        public bool InsertTransactionDetails(string strUsterId, string strTavelFrom, string strTravelTo, int intWeight, DateTime dtJourneyFrom, DateTime dtJourneyTo, string strTravelBy)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Insert_User_Traveling_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_Id", strUsterId);
                cmd.Parameters.AddWithValue("@TypeOfUser", "TRAVELER");
                cmd.Parameters.AddWithValue("@Item_From", strTavelFrom);
                cmd.Parameters.AddWithValue("@Item_To", strTravelTo);
                cmd.Parameters.AddWithValue("@TD_Item_Weight", intWeight);
                cmd.Parameters.AddWithValue("@Strat_Dt", dtJourneyFrom);
                cmd.Parameters.AddWithValue("@End_Dt", dtJourneyTo);
                cmd.Parameters.AddWithValue("@TD_Travel_by", strTravelBy);
                return ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }
        public DataTable GetITransactionDetails(string strUserId)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Get_Traveler_Details_By_UserID");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User_Id", strUserId);
                dt = ExecuteReader(cmd);
                return dt;
            }
            catch
            {
                throw;
            }
        }

        public DataTable InsertItemDetails(string strUserId, string strItemName, string strItemDesc, string strItemWeight, int strItemTypeId, string strRemarks)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Insert_Item_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@I_User_Id", strUserId);
                cmd.Parameters.AddWithValue("@I_Item_Name", strItemName);
                cmd.Parameters.AddWithValue("@I_Item_Desc", strItemDesc);
                cmd.Parameters.AddWithValue("@I_Item_Type_Id", strItemTypeId);
                cmd.Parameters.AddWithValue("@I_Weight", strItemWeight);
                cmd.Parameters.AddWithValue("@I_Remarks", strRemarks);
                return ExecuteReader(cmd);
            }
            catch
            {
                throw;
            }
        }
        public DataTable GetItemDetails(string strUserId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Get_Item_Details_By_UserID");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@I_User_Id", strUserId);
                return ExecuteReader(cmd);
            }
            catch
            {
                throw;
            }
        }
        public DataTable GetAvailableTravelers(string strUserId,string strFromAdd, string strToAdd, string strTillDate)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Get_Traveler_Availability");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", strUserId);
                cmd.Parameters.AddWithValue("@TD_Item_From", strFromAdd);
                cmd.Parameters.AddWithValue("@TD_Item_To", strToAdd);
                cmd.Parameters.AddWithValue("@TD_Ending_Dt", string.IsNullOrEmpty(strTillDate) ? strTillDate : Convert.ToDateTime(strTillDate).ToString("yyyy-MM-dd"));
                return ExecuteReader(cmd);
            }
            catch
            {
                throw;
            }
        }

        public bool UpdateTransactionDetails(string strTransId, string strTavelFrom, string strTravelTo, int intWeight, DateTime dtJourneyFrom, DateTime dtJourneyTo, string strTravelBy)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Update_Traveler_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TD_Sno", strTransId);
                cmd.Parameters.AddWithValue("@TD_Item_From", strTavelFrom);
                cmd.Parameters.AddWithValue("@TD_Item_To", strTravelTo);
                cmd.Parameters.AddWithValue("@TD_Item_Weight", intWeight);
                cmd.Parameters.AddWithValue("@TD_Strating_Dt", Convert.ToDateTime(dtJourneyFrom).ToString("yyyy/MM/dd"));
                cmd.Parameters.AddWithValue("@TD_Ending_Dt", Convert.ToDateTime(dtJourneyTo).ToString("yyyy/MM/dd"));
                cmd.Parameters.AddWithValue("@TD_Travel_by", strTravelBy);
                return ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }
        public bool DeleteTransactionDetails(string strTransId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Delete_Traveler_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TD_Sno", strTransId);
                return ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }

        public bool AssignTraveler(string strSno, string strSenderId, string StrReceiverId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Update_Assign_SenderToTraveler");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TD_Sno", strSno);
                cmd.Parameters.AddWithValue("@TD_Sender_Id", strSenderId);
                cmd.Parameters.AddWithValue("@TD_Recever_Id", StrReceiverId);
                return ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }

        public bool AssignItems(string strTrancId, string strItemId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Inset_Items_AssignToTraveler");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UTD_Sno", strTrancId);
                cmd.Parameters.AddWithValue("@ITD_Sno", strItemId);
                return ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }
        public DataSet GetPaymentSummery(string strTrancId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Get_Payment_Summery");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TD_Sno", strTrancId);
                return ExecuteAdapter(cmd);
            }
            catch
            {
                throw;
            }
        }

        public DataTable GetReceivingItem(string strUserId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Get_Receiving_Items");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UD_User_Id", strUserId);
                return ExecuteReader(cmd);
            }
            catch
            {
                throw;
            }
        }
        public DataTable GetTravelerApprovals(string strUserId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Get_Traveler_Approval_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TD_Traveler_Id", strUserId);
                return ExecuteReader(cmd);
            }
            catch
            {
                throw;
            }
        }
        public DataTable GetAllItemTyps()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("usp_Get_All_Item_Types");
                cmd.CommandType = CommandType.StoredProcedure;
                return ExecuteReader(cmd);
            }
            catch
            {
                throw;
            }
        }
    }
}