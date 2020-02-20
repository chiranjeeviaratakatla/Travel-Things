using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace TravelThings.DAL.Interfaces
{
    internal interface IUserAccess
    {
        DataTable InsertUserDetails(string UserName, string PhoneNo, string TypeOfUser);
    }
}