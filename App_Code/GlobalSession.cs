using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GlobalSession
/// </summary>
public class GlobalSession
{
    public GlobalSession()
    {
        Level = "";
        Co_Code = "";
        Co_Name = "";
        Client_Id = "";
        UserId = "";
        UserName = "";
    }
    public static string Level
    {
        get { return HttpContext.Current.Session["Level"].ToString(); }
        set { HttpContext.Current.Session["Level"] = value; }
    }
    public static string Co_Code
    {
        get { return HttpContext.Current.Session["Co_Code"].ToString(); }
        set { HttpContext.Current.Session["Co_Code"] = value; }
    }
    public static string Co_Name
    {
        get { return HttpContext.Current.Session["Co_Name"].ToString(); }
        set { HttpContext.Current.Session["Co_Name"] = value; }
    }
    public static string Client_Id
    {
        get { return HttpContext.Current.Session["Client_Id"].ToString(); }
        set { HttpContext.Current.Session["Client_Id"] = value; }
    }
    public static string UserId
    {
        get { return HttpContext.Current.Session["UserId"].ToString(); }
        set { HttpContext.Current.Session["UserId"] = value; }
    }
    public static string UserName
    {
        get { return HttpContext.Current.Session["UserName"].ToString(); }
        set { HttpContext.Current.Session["UserName"] = value; }
    }
}