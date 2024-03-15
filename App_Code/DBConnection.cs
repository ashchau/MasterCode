using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
    public static SqlConnection conn;
    public static FileInfo file;
    public DBConnection()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static SqlConnection SqlConn_JaipurMcDB()
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        if (conn.State == ConnectionState.Closed) conn.Open();
        return conn;
    }

    public static FileInfo Xml_Conn()
    {
        file = new FileInfo(System.Web.HttpContext.Current.Server.MapPath("~/XML/Xml_PraName.config"));
        return file;
    }
}