using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TravelThings.DAL.Interfaces
{
    internal interface ItransactionAccess
    {
        bool InsertTransactionDetails(string strUsterId, string strTavelFrom, string strTravelTo, int intWeight, DateTime dtJourneyFrom, DateTime dtJourneyTo, string strTravelBy);

        DataTable GetITransactionDetails(string strUserId);

        DataTable InsertItemDetails(string strUserId, string strItemName, string strItemDesc, string strItemWeight, int strItemTypeId, string strRemarks);

        DataTable GetItemDetails(string strUserId);

        DataTable GetAvailableTravelers(string strUserId, string strFromAdd, string strToAdd, string strTillDate);

        bool UpdateTransactionDetails(string strTransId, string strTavelFrom, string strTravelTo, int intWeight, DateTime dtJourneyFrom, DateTime dtJourneyTo, string strTravelBy);

        bool DeleteTransactionDetails(string strTransId);

        bool AssignTraveler(string strSno, string strSenderId, string StrReceiverId);

        bool AssignItems(string strTrancId, string strItemId);

        DataSet GetPaymentSummery(string strTrancId);

        DataTable GetReceivingItem(string strUserId);

        DataTable GetTravelerApprovals(string strUserId);
        
        DataTable GetAllItemTyps();

        DataTable GetAllVehicle();
        
    }
}