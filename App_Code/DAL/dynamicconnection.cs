using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


/// <summary>
/// Summary description for dynamicconnection
/// </summary>
public class dynamicconnection
{
    public SqlConnection sqlconn;
    public string Dbname;
    public dynamicconnection(string Dbname)
    {
        string server = @"DILSHAD";
        sqlconn = new SqlConnection("server=" + server + ";integrated security=sspi;database=" + Dbname + ";");
        sqlconn.Open();
    }
}