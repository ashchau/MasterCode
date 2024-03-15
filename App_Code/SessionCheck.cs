using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SessionCheck
/// </summary>
public class SessionCheck
{
    public SessionCheck()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void CommonCheckSession()
    {
        if (HttpContext.Current.Session["Co_Code"] == null || HttpContext.Current.Session["Co_Code"] == "" || HttpContext.Current.Session["Co_Name"] == null || HttpContext.Current.Session["Co_Name"] == "" || HttpContext.Current.Session["Client_Id"] == null || HttpContext.Current.Session["Client_Id"] == "" || HttpContext.Current.Session["UserId"] == null || HttpContext.Current.Session["UserId"] == "" || HttpContext.Current.Session["UserId"].ToString() == "0" || HttpContext.Current.Session["UserName"] == null || HttpContext.Current.Session["UserName"] == "" || HttpContext.Current.Session["Level"] == null || HttpContext.Current.Session["Level"] == ""
           )
        {
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Redirect("FrmLogin.aspx");
        }

    }
}