﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TravelThings.Helpers;
using TravelThings.DAL.Interfaces;
using System.Data;
using System.Data.SqlClient;

namespace TravelThings.DAL.BusinessLogic 
{
    internal class AppAccess : DataProcessing,IappAccess
    {
        public string GetArea(string Area)
        {
            SqlCommand cmd = new SqlCommand("usp_Get_Search_Area");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Area", Area);
            return Convert.ToString(ExecuteScalar(cmd));
        }
        
        public DataTable GetTravelrDetails(string From, string To, DateTime Staritng)
        {
            SqlCommand cmd = new SqlCommand("usp_Get_Travelr_Details");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@From", From);
            cmd.Parameters.AddWithValue("@To", To);
            cmd.Parameters.AddWithValue("@Strating_Dt", Staritng);
            return ExecuteReader(cmd);
        }
    }
}