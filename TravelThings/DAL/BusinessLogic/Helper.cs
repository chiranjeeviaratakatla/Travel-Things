using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TravelThings.DAL.Interfaces;
using TravelThings.Helpers;

namespace TravelThings.DAL.BusinessLogic
{
    public class Helper : DataProcessing, IHelper
    {
        public bool CheckAddressExists(string strArea, string City)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Usp_Check_Address_Exists");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Area", strArea);
                cmd.Parameters.AddWithValue("@City", City);
                return ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }
    }
}