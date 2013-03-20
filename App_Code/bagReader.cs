using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;


public class bagReader
{
		public static ArrayList getRow(int pID)
        {
            ArrayList arrRow = new ArrayList();
            string connStr = ConfigurationManager.ConnectionStrings["connStr_eStore"].ConnectionString;
            SqlConnection conn = null;
            string sql = "SELECT * FROM (tProducts) WHERE [ProductID] = " + pID;
            try
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    arrRow.Add(1);
                    for(int i=0;i < dr.FieldCount;i++)
                    {
                        arrRow.Add(dr.GetValue(i));
                    }
                }
            }
            catch (SqlException ex)
            {
                if(conn != null)
                {
                    conn.Close();
                }
            }

            return arrRow;
        }
	
}