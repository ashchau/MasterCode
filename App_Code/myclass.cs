using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class myclass
{
    static SqlConnection con;

    public static SqlConnection SetConnnection()
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