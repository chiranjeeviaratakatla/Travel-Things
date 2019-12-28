using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TravelThings.Helpers
{
    internal class DataProcessing
    {
        private static readonly SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString.ToString());
        internal bool ExecuteNonQuery(SqlCommand cmd)
        {
            bool res = false;
            try
            {
                cmd.Connection = connection;
                connection.Open();
                res = Convert.ToBoolean(cmd.ExecuteNonQuery());
            }
            catch
            {
                throw;
            }
            finally
            {
                connection.Close();
            }
            return res;
        }

        internal DataTable ExecuteReader(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            try
            {
                cmd.Connection = connection;
                connection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);
            }
            catch
            {
                throw;
            }
            finally
            {
                cmd.Clone();
            }
            return dt;
        }

        internal object ExecuteScalar(SqlCommand cmd)
        {
            object res = new object();
            try
            {
                cmd.Connection = connection;
                connection.Open();
                res = cmd.ExecuteScalar();
            }
            catch
            {
                throw;
            }
            {
                connection.Close();
            }
            return res;
        }
    }
}