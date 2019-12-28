using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelThings.DAL.Interfaces
{
    internal interface IUserAccess
    {
        string InsertUserDetails(string UserName, string PhoneNo);
    }
}