using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public class Setco
{
    static SqlConnection con;

    public static SqlConnection setConnection()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
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