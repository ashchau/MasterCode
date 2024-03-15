using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImportExport_Download : System.Web.UI.Page
{
    string Mimetype = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Download();
        }
       
    }

    protected void btndownload_Click(object sender, EventArgs e)
    {
        // Response.ContentType = "application/pdf";
        Response.ContentType = "text/plain";
        Response.AppendHeader("Content-Disposition", "attachment; filename=Txtimport.txt");

        // Write the file to the Response  
        const int bufferLength = 10000;
        byte[] buffer = new Byte[bufferLength];
        int length = 0;
        Stream download = null;
        try
        {
            download = new FileStream(Server.MapPath("~/PDF/Txtimport.txt"),FileMode.Open,FileAccess.Read);
           
            do
            {
                if (Response.IsClientConnected)
                {
                    length = download.Read(buffer, 0, bufferLength);
                    Response.OutputStream.Write(buffer, 0, length);
                    buffer = new Byte[bufferLength];
                }
                else
                {
                    length = -1;
                }
            }
            while (length > 0);
            Response.Flush();
            Response.End();
            lblmsg.Text = "File download successfully...";
        }
        finally
        {
            if (download != null)
                download.Close();
        }
    }
    protected void Download()
    {
        string fname = "Txtimport.txt";// 1.pdf
        string path = Server.MapPath("~/PDF/"+fname+"");
        //hrt.HRef = "../PDF/"+fname+"";
        //hrt.Target = "_blank";
        string extension = Path.GetExtension(path);//how to get file extention
        string mimeType =MimeMapping.GetMimeMapping(fname); //Howto get file mime type
        string filename = Path.GetFileNameWithoutExtension(path);//how to get file name without extention
        WebClient webClient = new WebClient();
        byte[] byt = webClient.DownloadData(path);
        string a = Convert.ToBase64String(byt);
        string all = "data:"+mimeType+";base64," + a;// data: image / jpg; base64,
        hrt.HRef = all;
        hrt.Attributes.Add("download", filename);

        hrt.Target = "_self";

        //WebClient webClient = new WebClient();
        //byte[] byt = webClient.DownloadData(path);
        //string a = Convert.ToBase64String(byt);
        //string all = "data:text/plain;base64," + a;// data: image / jpg; base64,
        //hrt.HRef = all;
        //hrt.Attributes.Add("download", "HELLO");
        //hrt.Target = "_self";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "clickme()", true);
    }

    protected void btndld_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/PDF/Txtimport.txt");
        WebClient webClient = new WebClient();
        byte[] byt = webClient.DownloadData(path);
        string a = Convert.ToBase64String(byt);
        string flname = "test";
        //data: application / pdf
        string all = "data:image/png;base64," + a;// data: image / jpg; base64,
        hrt.HRef = all;
        hrt.Target = "_self";
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "download("+a+","+flname+")", true);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "clickme()", true);

    }

    protected void btndwnd_Click(object sender, EventArgs e)
    {
        string fname = "Txtimport.txt";// 1.pdf
        string path = Server.MapPath("~/PDF/" + fname + "");
        //hrt.HRef = "../PDF/"+fname+"";
        //hrt.Target = "_blank";
        string extension = Path.GetExtension(path);//how to get file extention
        string mimeType = MimeMapping.GetMimeMapping(fname); //Howto get file mime type
        string filename = Path.GetFileNameWithoutExtension(path);//how to get file name without extention
        WebClient webClient = new WebClient();
        byte[] byt = webClient.DownloadData(path);
        string a = Convert.ToBase64String(byt);
        string all = "data:" + mimeType + ";base64," + a;// data: image / jpg; base64,
        hrtdwnd.HRef = all;
        hrtdwnd.Attributes.Add("download", filename);
        hrtdwnd.Target = "_self";
    }
}