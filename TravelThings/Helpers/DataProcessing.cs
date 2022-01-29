using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TravelThings.Helpers
{
    public class DataProcessing
    {
        readonly string  Psw = "Password=Chiru5512#";
        private static readonly SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString.ToString());
        public DataProcessing()
        {
            if (!connection.ConnectionString.Contains(Psw))
            {
                connection.ConnectionString = connection.ConnectionString + Psw;
            }
        }
        //~DataProcessing()
        //{
        //    if(connection.ConnectionString.Contains(Psw))
        //    {
        //        connection.ConnectionString.Replace(Psw, "");
        //    }
        //    //connection.ConnectionString = connection.ConnectionString + "Chiru5512#";
        //}
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
                connection.Close();
            }
            return dt;
        }

        internal DataSet ExecuteAdapter(SqlCommand cmd)
        {
            DataSet ds = new DataSet();
            try
            {
                cmd.Connection = connection;
                connection.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
            }
            catch
            {
                throw;
            }
            finally
            {
                connection.Close();
            }
            return ds;
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