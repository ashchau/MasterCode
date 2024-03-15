using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UI_Dynamic_MstPdfViewer : System.Web.UI.Page
{
    string PdfName1 = "";
    Int32 pageid1 = 0;
    string str;
    string SrcView;
    bool test;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            test = true;

            SrcView = Request.UserAgent;
            if (SrcView.Contains("BlackBerry") || (SrcView.Contains("iPhone") || (SrcView.Contains("Android")))) SrcView = "Mobile"; else SrcView = "Computer";

            pageid1 = Convert.ToInt16(Convert.ToInt32(Request.QueryString["Pageid"]));
            PdfName1 = Request.QueryString["PdfName"].ToString();
            PDFViewer(pageid1, PdfName1);
        }
    }
    private void PDFViewer(int pageid1, string PdfName1)
    {
        if (pageid1 == 5)
        {

            str = "http://localhost:63913/PDF/" + PdfName1;
            lblHeader.Text = Request.QueryString["Header"];
            //str = "<embed src='" + str + "' width='100%' height='1000px'  type='application/pdf'>";
            if (SrcView == "Computer") str = "<embed src='" + str + "' width='100%' height='1000px'  type='application/pdf'>"; else Response.Redirect(str);
            lblPDFViewer.Text = str;
        }
    }
    //protected string GetOwnIpAdd()
    //{
    //    IPHostEntry host;
    //    string localIP = "?";

    //    try
    //    {
    //        host = Dns.GetHostEntry(Dns.GetHostName());
    //        foreach (IPAddress ip in host.AddressList)
    //        {
    //            if (ip.AddressFamily.ToString() == "InterNetwork")
    //            {
    //                localIP = ip.ToString();
    //            }
    //        }
    //    }
    //    catch (Exception e)
    //    {
    //        return localIP;
    //    }
    //    return localIP;
    //}
}