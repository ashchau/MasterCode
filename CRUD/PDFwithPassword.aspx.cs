using IronPdf.Security;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRUD_PDFwithPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //https://www.c-sharpcorner.com/UploadFile/0c1bb2/password-protected-pdf-file-using-Asp-Net-C-Sharp/
            Bindgrid();
        }
    }
    protected void Bindgrid()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();
        string query = "select * from employee";
        SqlCommand y = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(y);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void btnconvert_Click(object sender, EventArgs e)
    {
        //wordProtectedPDF();
         //pdfconv();
         wordProtectedPDF1();
    }
    private void wordProtectedPDF()
    {


        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());

        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        HTMLWorker htmlworker = new HTMLWorker(pdfDoc);

        using (MemoryStream ObjememoryStream = new MemoryStream())
        {
            PdfWriter.GetInstance(pdfDoc, ObjememoryStream);
            pdfDoc.Open();
            htmlworker.Parse(sr);
            pdfDoc.Close();
            byte[] Filebytes = ObjememoryStream.ToArray();
            ObjememoryStream.Close();
            using (MemoryStream inputData = new MemoryStream(Filebytes))
            {
                using (MemoryStream outputData = new MemoryStream())
                {
                    string PDFFileword = "ashok";//you can also generate Dynamic word  
                    PdfReader reader = new PdfReader(inputData);
                    PdfEncryptor.Encrypt(reader, outputData, true, PDFFileword, PDFFileword, PdfWriter.ALLOW_SCREENREADERS);
                    Filebytes = outputData.ToArray();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite(Filebytes);
                    Response.End();
                    GridView1.AllowPaging = true;
                    GridView1.DataBind();
                }
            }
        }
    }
    private void wordProtectedPDF1()
    {
        string pdfDoc = Server.MapPath("~/pdf/1.pdf");
        byte[] Filebytes = File.ReadAllBytes(pdfDoc);
        using (MemoryStream inputData = new MemoryStream(Filebytes))
        {
            using (MemoryStream outputData = new MemoryStream())
            {
                string PDFFileword = "ashok";//you can also generate Dynamic word  your password 
                PdfReader reader = new PdfReader(inputData);
                PdfEncryptor.Encrypt(reader, outputData, true, PDFFileword, PDFFileword, PdfWriter.ALLOW_SCREENREADERS);
                Filebytes = outputData.ToArray();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(Filebytes);
                Response.End();

                //string fileNm = "1.pdf";
                //string strURL = Server.MapPath("~/PDF/" + fileNm);
                //WebClient req = new WebClient();
                //byte[] str = req.DownloadData(strURL);
                //string txtFilePath = Convert.ToBase64String(Filebytes);
                //string all = "data:application/pdf;base64," + Filebytes;
                //txtfiledownload.HRef = all;
                //txtfiledownload.Attributes.Add("download", fileNm);
                //ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:callAnchorForDownLoadFile(); ", true);
            }

        }
        txtname.Text = "";
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    //protected void  PDFPassword()
    //{
    //    // Open an existing document. Providing an unrequired password is ignored.
    //    PdfDocument document = PdfReader.Open(filename, "some text");

    //    PdfSecuritySettings securitySettings = document.SecuritySettings;

    //    // Setting one of the passwords automatically sets the security level to 
    //    // PdfDocumentSecurityLevel.Encrypted128Bit.
    //    securitySettings.UserPassword = "user";
    //    securitySettings.OwnerPassword = "owner";

    //    // Don't use 40 bit encryption unless needed for compatibility reasons
    //    //securitySettings.DocumentSecurityLevel = PdfDocumentSecurityLevel.Encrypted40Bit;

    //    // Restrict some rights.
    //    securitySettings.PermitAccessibilityExtractContent = false;
    //    securitySettings.PermitAnnotations = false;
    //    securitySettings.PermitAssembleDocument = false;
    //    securitySettings.PermitExtractContent = false;
    //    securitySettings.PermitFormsFill = true;
    //    securitySettings.PermitFullQualityPrint = false;
    //    securitySettings.PermitModifyDocument = true;
    //    securitySettings.PermitPrint = false;

    //    // Save the document...
    //    document.Save(filename);
    //}
    public void pdfconv()
    {
        IronPdf.Logging.Logger.EnableDebugging = true;
        IronPdf.Logging.Logger.LogFilePath = "~/pdf/Default.log"; //May be set to a directory name or full file
        IronPdf.Logging.Logger.LoggingMode = IronPdf.Logging.Logger.LoggingModes.All;
        var Renderer = new IronPdf.ChromePdfRenderer();
        var content = "<h1>Sample PDF Generated</h1><p>This is a sample PDF generated by the Iron PDF from C# and it is password protected!</p>";
        //string file = Server.MapPath("~/pdf/1.pdf");
        //byte[] pdfBytes = File.ReadAllBytes(file);
        //var content = pdfBytes;
        var pdfFile = Renderer.RenderHtmlAsPdf(content);
        //Adding Watermark
        // Watermarks all pages with red "Sample Watermark" text at a custom location.
        // Also adding a link to the watermark on-click
        pdfFile.WatermarkAllPages("<h4 style='color:red'>Sample Watermark</h4>", IronPdf.Editing.WaterMarkLocation.TopCenter, 50, -15, "your website link here");
        // Adding Security Features
        pdfFile.SecuritySettings.AllowUserCopyPasteContent = false;
        pdfFile.SecuritySettings.AllowUserEdits = PdfEditSecurity.NoEdit;
        pdfFile.SecuritySettings.UserPassword = "chauhan";
        //Save the Pdf
        pdfFile.SaveAs("~/pdf/pwd.pdf");​
    }

    protected void btnEncryptPDF_Click(object sender, EventArgs e)
    {
        //wordProtectedPDF1();
        //string fileNm = "IN200481_DEMAT_" + Convert.ToDateTime(txtExportDate.Text).ToString("yyyyMMdd") + "_" + Session["hhmmss"] + ".Txt";
        string fileNm = "1.pdf";
        string strURL = Server.MapPath("~/PDF/" + fileNm);
        WebClient req = new WebClient();
        byte[] str = req.DownloadData(strURL);
        string txtFilePath = Convert.ToBase64String(str);
        //txtfiledownload.HRef = "data:application/pdf;base64," + txtFilePath;
        string all = "data:application/pdf;base64," + txtFilePath;
        txtfiledownload.HRef = all;
        //txtfiledownload.Target = "_self";
        txtfiledownload.Attributes.Add("download", fileNm);
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:callAnchorForDownLoadFile(); ", true);
        // File.WriteAllText(Path.Combine(path, fileNm.Trim()), Header + System.Environment.NewLine + detail);
        clear();
    }
    public void clear()
    {
        txtname.Text = "";
    }
}