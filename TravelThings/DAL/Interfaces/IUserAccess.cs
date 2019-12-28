using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelThings.DAL.Interfaces
{
    internal interface IUserAccess
    {
        int InsertUserDetails(string UserName, string PhoneNo);
    }
}