<%@ WebHandler Language="C#" Class="Uploader" %>

using System;
using System.Web;

public class Uploader : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        HttpFileCollection files = context.Request.Files;
        foreach (string key in files)
        {
            HttpPostedFile file = files[key];
            string fileName = context.Server.MapPath("~/Fileuploadbar/Files/" + key);
            file.SaveAs(fileName);
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("File(s) uploaded successfully!");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}