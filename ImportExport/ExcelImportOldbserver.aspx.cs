using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.OleDb;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Common;

public partial class ImportExport_ExcelImportOldbserver : System.Web.UI.Page
{
    OleDbConnection Econ;
    SqlConnection con;
    SqlCommand cmd;
    //SqlDataReader DbDataReader;
    string constr, Query, sqlconn;
    protected void Page_Load(object sender, EventArgs e)
    {
        //first need to install this--> Microsoft Access database engine 2010(English) from below second link code is work 
        //https://www.c-sharpcorner.com/UploadFile/0c1bb2/inserting-excel-file-records-into-sql-server-database-using/
        //https://www.aspsnippets.com/Articles/The-MicrosoftACEOLEDB120-provider-is-not-registered-on-the-local-machine.aspx
        //https://www.c-sharpcorner.com/blogs/how-to-import-excel-data-in-sql-server-using-asp-net2
        //https://www.aspsnippets.com/Articles/Import-Excel-data-to-SQL-Server-Database-in-ASPNet-using-C-and-VBNet.aspx
        //https://www.aspsnippets.com/Articles/How-to-Import-Excel-Sheet-data-into-SQL-Server-using-ASPNet.aspx 
        //above link use for connection string on webconfigfile and used the store procedure..
        //https://www.aspdotnet-suresh.com/2013/01/c-microsoft-office-access-database.html
        //https://www.aspsnippets.com/Articles/Import-Excel-data-to-SQL-Server-Database-in-ASPNet-using-C-and-VBNet.aspx

        if (!IsPostBack)
        {
            BindGridview();
        }
    }

    protected void btnupload_Click(object sender, EventArgs e) 
    {
        if(FileUpload1.HasFile)
        {
            string CurrentFilePath = Path.GetFullPath(FileUpload1.PostedFile.FileName);
            InsertExcelRecords(CurrentFilePath);
        }
        else
        {
            lblMessage.Text = "Please choose a file";
        }
    }
    private void ExcelConn(string FilePath)
    {

        constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", FilePath);
        Econ = new OleDbConnection(constr);

    }
    private void connection()
    {
        sqlconn = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        con = new SqlConnection(sqlconn);

    }
    private void InsertExcelRecords(string FilePath)
    {
        ExcelConn(FilePath);

        Query = string.Format("Select [Name],[City],[Address],[Designation] FROM [{0}]", "Sheet1$");
        OleDbCommand Ecom = new OleDbCommand(Query, Econ);
        //Econ.Open();

        DataSet ds = new DataSet();
        OleDbDataAdapter oda = new OleDbDataAdapter(Query, Econ);
        //Econ.Close();
        oda.Fill(ds);
        DataTable Exceldt = ds.Tables[0];
        connection();
        //creating object of SqlBulkCopy    
        SqlBulkCopy objbulk = new SqlBulkCopy(con);
        //assigning Destination table name    
        objbulk.DestinationTableName = "EmployeeImEx";
        //Mapping Table column    
        objbulk.ColumnMappings.Add("Name", "Name");
        objbulk.ColumnMappings.Add("City", "City");
        objbulk.ColumnMappings.Add("Address", "Address");
        objbulk.ColumnMappings.Add("Designation", "Designation");
        //inserting Datatable Records to DataBase    
        con.Open();
        objbulk.WriteToServer(Exceldt);
        con.Close();
    }

    protected void btnupload2_Click(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/blogs/how-to-import-excel-data-in-sql-server-using-asp-net2
        if (FileUpload1.HasFile)//FileUpload1.PostedFile != null
        {
            try
            {
                string path = string.Concat(Server.MapPath("~/PDF/" + FileUpload1.FileName));
                FileUpload1.SaveAs(path);
                // Connection String to Excel Workbook  
                string excelCS = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
                using (OleDbConnection con = new OleDbConnection(excelCS))
                {
                    OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", con);
                    con.Open();
                    // Create DbDataReader to Data Worksheet  
                    DbDataReader dr = cmd.ExecuteReader();
                    // SQL Server Connection String  
                    string CS = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
                    // Bulk Copy to SQL Server   
                    SqlBulkCopy bulkInsert = new SqlBulkCopy(CS);
                    bulkInsert.DestinationTableName = "EmployeeImEx";
                    bulkInsert.WriteToServer(dr);
                    BindGridview();
                    lblMessage.Text = "Your file uploaded successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Your file not uploaded";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
    private void BindGridview()
    {
        string CS = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //SqlCommand cmd = new SqlCommand("spGetAllEmployee", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            string q = "select * from EmployeeImEx";
            cmd = new SqlCommand(q, con);
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
        }
    }

    protected void btnupload3_Click(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/Articles/Import-Excel-data-to-SQL-Server-Database-in-ASPNet-using-C-and-VBNet.aspx
        //Upload and save the file
        if(FileUpload1.HasFile)
        {
            string excelPath = Server.MapPath("~/PDF/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(excelPath);

            string conString = string.Empty;
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            switch (extension)
            {
                case ".xls": //Excel 97-03
                    conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                    break;
                case ".xlsx": //Excel 07 or higher
                    conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                    break;

            }
            conString = string.Format(conString, excelPath);
            using (OleDbConnection excel_con = new OleDbConnection(conString))
            {
                excel_con.Open();
                string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                DataTable dtExcelData = new DataTable();

                //[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
                dtExcelData.Columns.AddRange(new DataColumn[3] { new DataColumn("Id", typeof(int)),
                new DataColumn("Name", typeof(string)),
                new DataColumn("Salary", typeof(decimal)) });

                using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                {
                    oda.Fill(dtExcelData);
                }
                excel_con.Close();

                string consString = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        //Set the database table name
                        sqlBulkCopy.DestinationTableName = "dbo.tblPersons";

                        //[OPTIONAL]: Map the Excel columns with that of the database table
                        sqlBulkCopy.ColumnMappings.Add("Id", "PersonId");
                        sqlBulkCopy.ColumnMappings.Add("Name", "Name");
                        sqlBulkCopy.ColumnMappings.Add("Salary", "Salary");
                        con.Open();
                        sqlBulkCopy.WriteToServer(dtExcelData);
                        lblMessage.Text = "Your file uploaded successfully";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        con.Close();
                    }
                }
            }
        }
        else
        {
            lblMessage.Text = "Please select a valid file...";
        }
    }
}