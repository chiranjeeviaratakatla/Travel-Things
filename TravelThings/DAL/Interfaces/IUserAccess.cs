using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace TravelThings.DAL.Interfaces
{
    internal interface IUserAccess
    {
        DataTable InsertUserDetails(string UserName, string strPhoneNo,string strAltPhoneNo,string strEmailId,string strPassword);
        DataTable GettUserDetails(string strUserId);
        bool UpdateUserProfile(string strUserId, string strUserName, string strAltPhoNo, string strAadharNo, string strEmailId,string strPhotoPath,string strAddress);
        DataTable ConfirmCredentials(string strPhoneNo, string strPassword);
    }
}