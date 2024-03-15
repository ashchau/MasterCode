using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
//using Microsoft.Office.Interop.Excel;
using ClosedXML.Excel;
//using DocumentFormat.OpenXml.Wordprocessing;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Web.UI.HtmlControls;
using System.Text;


public partial class ImportExport_ImportExceldata : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://stackoverflow.com/questions/24281255/how-do-you-import-excel-data-to-sql-server-using-asp-net-c-sharp-where-the-table
        //https://www.c-sharpcorner.com/article/user-defined-table-types-and-table-valued-parameters/
        //https://www.c-sharpcorner.com/article/user-defined-table-types-and-table-valued-parameters/  //this link for /////type table
        //https://www.c-sharpcorner.com/article/using-table-type-parameter-in-net-core/ //THIS LINK FOR TYPE TABLE IN MVC.ASP.NET
        if (!IsPostBack)
        {
            bindgrid();
            Binddata();
            PopulateFileList();
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
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
        GridView4.DataSource = dt;
        GridView4.DataBind();
    }
    public void bindgrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        SqlConnection con2 = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand("sp_import", con2);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Ind", 1);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Session["Data"] = dt;
        }
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
    //    if (fileUpload.HasFile)
    //    {
    //        string path = string.Concat(Server.MapPath("~/File/" + fileUpload.FileName));
    //        fileUpload.SaveAs(path);

    //        Microsoft.Office.Interop.Excel.Application appExcel;
    //        Microsoft.Office.Interop.Excel.Workbook workbook;
    //        Microsoft.Office.Interop.Excel.Range range;
    //        Microsoft.Office.Interop.Excel._Worksheet worksheet;

    //        appExcel = new Microsoft.Office.Interop.Excel.Application();
    //        workbook = appExcel.Workbooks.Open(path, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
    //        worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.Sheets[1];
    //        range = worksheet.UsedRange;

    //        int rowCount = range.Rows.Count;
    //        int colCount = range.Columns.Count;

    //        System.Data.DataTable dt = new System.Data.DataTable();
    //        dt.Columns.Add("npm");
    //        dt.Columns.Add("prodi");
    //        dt.Columns.Add("grade");

    //        for (int Rnum = 3; Rnum <= rowCount; Rnum++)
    //        {
    //            DataRow dr = dt.NewRow();
    //            //Reading Each Column value From sheet to datatable Colunms                  
    //            for (int Cnum = 1; Cnum <= colCount; Cnum++)
    //            {
    //                dr[Cnum - 1] = (range.Cells[Rnum, Cnum]).ToString();
    //            }
    //            dt.Rows.Add(dr); // adding Row into DataTable
    //            dt.AcceptChanges();
    //        }

    //        workbook.Close(true);
    //        appExcel.Quit();

    //        try
    //        {
    //            string connSql = @"Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True;";

    //            SqlBulkCopy bulkcopy = new SqlBulkCopy(connSql);

    //            SqlBulkCopyColumnMapping mapNPM = new SqlBulkCopyColumnMapping("npm", "npm");
    //            bulkcopy.ColumnMappings.Add(mapNPM);
    //            SqlBulkCopyColumnMapping mapProdi = new SqlBulkCopyColumnMapping("prodi", "prodi");
    //            bulkcopy.ColumnMappings.Add(mapProdi);
    //            SqlBulkCopyColumnMapping mapGrade = new SqlBulkCopyColumnMapping("grade", "grade");
    //            bulkcopy.ColumnMappings.Add(mapGrade);

    //            bulkcopy.DestinationTableName = "testUpload";
    //            bulkcopy.WriteToServer(dt);

    //            msg.Text = "success";
    //        }
    //        catch (Exception ex)
    //        {
    //            msg.Text = ex.Message.ToString();
    //        }


    //    }
    }

    protected void btnimport_Click(object sender, EventArgs e)
    {

        if (FileUpload1.FileName.EndsWith(".xlsx"))
        {
            if (FileUpload1 != null)
            {
                string path = Server.MapPath("~/Uploads/");
                string a1, b;
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                a1 = Path.GetFileName(FileUpload1.FileName);
                b = Path.Combine(Server.MapPath("~/Uploads/"), a1);
                // b = postedFile.FileName;
                FileUpload1.SaveAs(b);



                using (XLWorkbook workBook = new XLWorkbook(b))
                {
                    IXLWorksheet workSheet = workBook.Worksheet(1);
                    DataTable dt = new DataTable();
                    bool firstRow = true;

                    foreach (IXLRow row in workSheet.Rows())
                    {
                        if (firstRow)
                        {
                            foreach (IXLCell cell in row.Cells())
                            {
                                dt.Columns.Add(cell.Value.ToString());
                            }
                            firstRow = false;

                        }
                        else
                        {
                            dt.Rows.Add();
                            int i = 0;
                            foreach (IXLCell cell in row.Cells())
                            {
                                //string BirthDayDate = Convert.ToString(dt.Rows[i]["BirthDayDate"]);


                                dt.Rows[dt.Rows.Count - 1][i] = cell.Value.ToString();
                                i++;
                            }
                        }
                    }
                    //bind exel data into gridview2
                    GridView2.DataSource = dt;
                    GridView2.DataBind();


                    DataTable dt1 = new DataTable();

                   // dt1.Columns.Add("Id", typeof(int));
                    dt1.Columns.Add("Name", typeof(string));
                    dt1.Columns.Add("Address", typeof(string));
                    dt1.Columns.Add("MobileNo", typeof(string));
                    dt1.Columns.Add("DOB", typeof(string));
                    //dt1.Columns.Add("EntryDate", typeof(DateTime));
                    dt1.Columns.Add("Age", typeof(string));
                    dt1.Columns.Add("Salary", typeof(decimal));
                    dt1.Columns.Add("Organization", typeof(int));
                  

                    DataRow r = dt1.NewRow();
                    r = dt1.NewRow();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        r = dt1.NewRow();
                        //r["Id"] = (dt.Rows[i]["EmpCode"]); //ashok
                        r["Name"] = dt.Rows[i]["Name"];
                        r["Address"] = dt.Rows[i]["Address"];
                        r["MobileNo"] = dt.Rows[i]["MobileNo"];
                        r["DOB"] = dt.Rows[i]["DOB"].ToString();
                        //r["EntryDate"] = dt.Rows[i]["EntryDate"];
                        r["Age"] = dt.Rows[i]["Age"];
                        r["Salary"] = dt.Rows[i]["Salary"];
                        r["Organization"] = Convert.ToInt32(ddlOrg.SelectedValue);
                        //string AniDt = string.Empty;
                        //if (dt.Rows[i]["AnniversaryDate"] == "31/12/1899")
                        //{
                        //    AniDt = "01/01/1900";
                        //}
                        //else
                        //{
                        //    AniDt = (dt.Rows[i]["AnniversaryDate"]).ToString();
                        //}
                        //r["AnniversaryDate"] = (dt.Rows[i]["AnniversaryDate"]);//ashok
                        //r["ActiveID"] = dt.Rows[i]["ActiveID"];
                        //r["City"] = dt.Rows[i]["City"];
                        // r["OrgCode"] = Convert.ToInt32(ddlOrg.SelectedValue);
                        //r["EmpAddress"] = dt.Rows[i]["EmpAddress"];
                        dt1.Rows.Add(r);
                    }
                    using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Con"].ToString()))
                    {
                        SqlCommand cmd = new SqlCommand("sp_import", con2);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Ind", 3);
                        cmd.Parameters.AddWithValue("@TypMasterData", dt1);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt3 = new DataTable();
                        da.Fill(dt3);
                        if (dt3.Rows[0]["res"].ToString() == "success")
                        {
                            lblsuccess.Text = "Imported Successfully";
                            lblsuccess.Visible = true;
                            lblerror.Text = "";
                            lblerror.Visible = false;
                            //ddlOrg.ClearSelection();
                        }
                        else
                        {
                            lblerror.Text = "Record Not Imported";
                            lblerror.Visible = true;
                            lblsuccess.Text = "";
                            lblsuccess.Visible = false;
                        }
                    }
                }

            }
        }
        else
        {
            lblerror.Text = "Please Select .xlsx File";
            lblerror.Visible = true;
            lblsuccess.Text = "";
            lblsuccess.Visible = false;
        }

    }
    protected void ExportToPDF( )
    {
        //we need to download or add through Manage Nuget package manager  ITextSharp.ddl file in project then add below reference.
        //using iTextSharp.text;
        //using iTextSharp.text.pdf;
        //using iTextSharp.text.html.simpleparser;
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                //To Export all pages
                GridView1.AllowPaging = false;
                this.bindgrid();

                GridView1.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(pdfDoc);
                Response.End();
            }
        }
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
    protected void ExporttoPDF2()
    {//https://www.c-sharpcorner.com/blogs/export-data-from-datatable-to-excel
        try
        {
            string Err = string.Empty;
            DataTable dt = (DataTable)Session["Data"];
            Document pdfDocument = new Document();
            StringBuilder sb = new StringBuilder();//using System.Text;
            //pdfDocument Content in HTml Format  
            if (dt.Rows.Count > 0)
            {
                sb.Append("<html>< head ><title></title></head><body>");
                string strActualRecords = string.Empty;
                strActualRecords = "<table style=\"width:100%;font-size: 9pt; font-family: verdana; \" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">";
                strActualRecords += "<tr><td style=\"width: 5%;white-space: nowrap;\">Id</td><td style=\"width: 5%;\">Name</td><td style=\"width: 5%;\">Address</td>" + "<td style=\"width: 5%;\">MobileNo</td>" + "<td style=\"width: 5%;\">DOB</td>" + "< td style =\"width: 5%;\">Age</td></tr>";
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    strActualRecords += "<tr>";
                    strActualRecords += "<td style=\"width: 5%;\">" + dt.Rows[i]["Id"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["Name"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["Address"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["MobileNo"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["DOB"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["Age"].ToString() + "</td>";
                    strActualRecords += "</tr>";
                }
                strActualRecords += "</table>";
                sb.Append(strActualRecords);
                sb.Append("</body></html>");
            }
            string pdffilename = DateTime.Now.Ticks.ToString() + ".pdf";
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDocument, HttpContext.Current.Response.OutputStream);
            pdfDocument.Open();
            String htmlText = sb.ToString();
            StringReader str = new StringReader(htmlText);
            HTMLWorker htmlworker = new HTMLWorker(pdfDocument);
            htmlworker.Parse(str);
            pdfWriter.CloseStream = false;
            pdfDocument.Close();
            //Download Pdf  
            Response.Buffer = true;
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + pdffilename);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void ExporttoPDF3()
    {
        try
        {
            Binddata();
            Response.ClearContent();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=MyPdfFile.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter strWrite = new StringWriter();
            HtmlTextWriter htmWrite = new HtmlTextWriter(strWrite);
            HtmlForm frm = new HtmlForm();//using System.Web.UI.HtmlControls;
            GridView4.Parent.Controls.Add(frm);
            frm.Attributes["runat"] = "server";
            frm.Controls.Add(GridView4);
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
        catch (Exception ex) {
            Response.Write(ex);
        }
    }
    protected void btnexportpdf_Click(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/UploadFile/0c1bb2/export-gridview-to-pdf/
        //https://www.c-sharpcorner.com/article/how-to-export-gridview-data-in-word-excel-and-pdf-format-using-asp-net/
        // ExportToPDF();
          // ExporttoPDF1();
        //ExporttoPDF2();
          ExporttoPDF3();
    }
    private void ExportGridToExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Vithal" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GridView1.GridLines = GridLines.Both;
        GridView1.HeaderStyle.Font.Bold = true;
        GridView1.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }
    protected void btnexportexcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }
    
    protected void ExcelBind()
    {
        if (ddlpdf.SelectedValue.EndsWith(".xlsx"))
        {
            if (ddlpdf.SelectedIndex != 0)
            {
                string path = Server.MapPath("~/PDF/");
                string a1, b;
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                a1 = ddlpdf.SelectedValue;
                b = Path.Combine(Server.MapPath("~/PDF/"), a1);
                using (XLWorkbook workBook = new XLWorkbook(b))
                {
                    IXLWorksheet workSheet = workBook.Worksheet(1);
                    DataTable dt = new DataTable();
                    bool firstRow = true;

                    foreach (IXLRow row in workSheet.Rows())
                    {
                        if (firstRow)
                        {
                            foreach (IXLCell cell in row.Cells())
                            {
                                dt.Columns.Add(cell.Value.ToString());
                            }
                            firstRow = false;

                        }
                        else
                        {
                            dt.Rows.Add();
                            int i = 0;
                            foreach (IXLCell cell in row.Cells())
                            {
                                //string BirthDayDate = Convert.ToString(dt.Rows[i]["BirthDayDate"]);


                                dt.Rows[dt.Rows.Count - 1][i] = cell.Value.ToString();
                                i++;
                            }
                        }
                    }
                    //bind exel data into gridview2
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }

            }
        }
        else
        {
            lblerror.Text = "Please Select .xlsx File";
            lblerror.Visible = true;
            lblsuccess.Text = "";
            lblsuccess.Visible = false;
            GridView2.DataSource = null;
            GridView2.DataBind();
        }
    }
    private void PopulateFileList()
    {
        DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/PDF/"));
       // FileInfo[] fis = di.GetFiles(); //this is used to bind the all type of files
        FileInfo[] fis = di.GetFiles("*.xlsx");
        ddlpdf.DataSource = fis;
        ddlpdf.DataTextField = "Name";
        ddlpdf.DataValueField = "Name";
        ddlpdf.DataBind();
        ddlpdf.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select files", "0"));
    }

    protected void ddlpdf_SelectedIndexChanged(object sender, EventArgs e)
    {
        ExcelBind();
    }
}

