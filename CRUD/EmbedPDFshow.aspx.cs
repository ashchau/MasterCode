using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRUD_EmbedPDFshow : System.Web.UI.Page
{
    string SrcView;
    bool test;
    string str;
    string PdfName1 = "";
    int pageid1 = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            test = true;

            SrcView = Request.UserAgent;
            if (SrcView.Contains("BlackBerry") || (SrcView.Contains("iPhone") || (SrcView.Contains("Android")))) SrcView = "Mobile"; else SrcView = "Computer";

            pageid1 = 1;
            PdfName1 = "1.pdf";
            PDFViewer(pageid1, PdfName1);
        }
    }
    private void PDFViewer(int pageid1, string PdfName1)
    {
        if (pageid1 == 1)
        {
            test = Request.Browser.IsMobileDevice;
           // str = "http://jaipurmc.org/PDF/NEWS/" + PdfName1;
            str = "/PDF/" + PdfName1;
            //lblHeader.Text = Request.QueryString["Header"];
            lblHeader.Text = "Demo Embed PDF File";
            if (SrcView == "Computer") str = "<embed src='" + str + "' width='500px' height='300px'  type='application/pdf'>"; else Response.Redirect(str);
            lblPDFViewer.Text = str;
        }
    }

        protected void lnkView_Click(object sender, EventArgs e)
    {
        string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"500px\" height=\"300px\">";
        embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
        embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
        embed += "</object>";
        ltEmbed.Text = string.Format(embed, ResolveUrl("~/PDF/1.pdf"));
    }

    protected void btnpdf_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("/PDF/Kota_North.pdf");
        WebClient client = new WebClient();
        Byte[] buffer = client.DownloadData(path);
        if (buffer != null)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", buffer.Length.ToString());
            Response.BinaryWrite(buffer);
        }
    }
}