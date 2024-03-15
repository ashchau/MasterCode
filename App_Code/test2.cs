using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class test2
{
    static SqlConnection con;
    public static SqlConnection SetConn()
    {
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            return con;
        }
        catch
        {
            con.Close();
            return con;
        }
    }
}