<%@ WebHandler Language="C#" Class="fileuploadhandler" %>

using System;
using System.Web;
using System.IO;
public class fileuploadhandler : IHttpHandler {

       public void ProcessRequest (HttpContext context) {
        HttpPostedFile file = context.Request.Files[0];
        string fname = context.Server.MapPath("uploads/" + file.FileName);
        file.SaveAs(fname);
        context.Response.ContentType = "text/plain";
        context.Response.Write("File Uploaded Successfully!");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}