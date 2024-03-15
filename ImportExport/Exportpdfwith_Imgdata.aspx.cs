//using DocumentFormat.OpenXml.Wordprocessing;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using iTextSharp.text.html.simpleparser;

public partial class ImportExport_Exportpdfwith_Imgdata : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Binddata();
        }
    }
    public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
    {
        //Allows for printing
    }
    public void Binddata()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);

        //create command object
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataTable dt = new DataTable();
        da.Fill(dt);

        //bind your data to gridview
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnexportpdf_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Employees.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        this.Binddata();
        GridView1.AllowPaging = false;
        //GridView1.DataSource = Binddata() as DataTable;
        //GridView1.DataBind();

        //Change the Header Row back to white color
        GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");
        //Applying stlye to gridview header cells
        for (int i = 0; i < GridView1.HeaderRow.Cells.Count; i++)
        {
            GridView1.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
        }
        GridView1.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void ExporttoPDF1()
    {
        try
        {
            Response.ClearContent();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=MyPdfFile.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter strWrite = new StringWriter();
            HtmlTextWriter htmWrite = new HtmlTextWriter(strWrite);
            HtmlForm frm = new HtmlForm();//using System.Web.UI.HtmlControls;
            GridView1.Parent.Controls.Add(frm);
            frm.Attributes["runat"] = "server";
            frm.Controls.Add(GridView1);
            frm.RenderControl(htmWrite);
            StringReader sr = new StringReader(strWrite.ToString());
            Document pdfDoc = new Document(PageSize.A4, 8f, 8f, 8f, 2f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.Flush();
            Response.End();
        }
        catch (Exception ex) { }
    }

    protected void btnpdf_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
        Response.Charset = "";
        Response.ContentType = "application/pdf";

        //To Export all pages.
        GridView1.AllowPaging = false;
        this.Binddata();

        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                GridView1.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                //HTMLWorker hTMLWorker = new HTMLWorker(pdfDoc);
                //XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                pdfDoc.Close();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(pdfDoc);
                Response.End();
            }
        }

    }

    protected void btntest_Click(object sender, EventArgs e)
    {
        ExporttoPDF1();
    }
}