using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TravelThings.DAL.Interfaces
{
    internal interface IappAccess
    {
        string GetArea(string Area);
        DataTable GetTravelrDetails(string From, string To, DateTime Staritng);
    }
}
