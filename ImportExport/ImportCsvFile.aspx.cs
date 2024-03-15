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

public partial class ImportExport_ImportCsvFile : System.Web.UI.Page
{
    SqlConnection con;

    string sqlconn;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/UploadFile/0c1bb2/inserting-csv-file-records-into-sql-server-database-using-as/
    }
    private void connection()
    {
        sqlconn = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        con = new SqlConnection(sqlconn);
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        //Creating object of datatable  
        DataTable tblcsv = new DataTable();
        //creating columns  
        tblcsv.Columns.Add("Name");
        tblcsv.Columns.Add("City");
        tblcsv.Columns.Add("Address");
        tblcsv.Columns.Add("Designation");
        //getting full file path of Uploaded file  
        //string CSVFilePath = Path.GetFullPath(FileUpload1.PostedFile.FileName);//if we used this line and below one line in place of my code then need to first paste file in C:\Program Files (x86)\IIS Express then import the file 
        //Reading All text  
        //string ReadCSV = File.ReadAllText(CSVFilePath);
        //mycode start
        string path = string.Concat(Server.MapPath("~/PDF/" + FileUpload1.FileName));
        FileUpload1.SaveAs(path);
        string ReadCSV = File.ReadAllText(path);
        //mycode end
        //spliting row after new line  
        foreach (string csvRow in ReadCSV.Split('\n'))
        {
            if (!string.IsNullOrEmpty(csvRow))
            {
                //Adding each row into datatable  
                tblcsv.Rows.Add();
                int count = 0;
                foreach (string FileRec in csvRow.Split(','))
                {
                    tblcsv.Rows[tblcsv.Rows.Count - 1][count] = FileRec;
                    count++;
                }
            }
        }
        //Calling insert Functions  
        InsertCSVRecords(tblcsv);
    }
    //Function to Insert Records  
    private void InsertCSVRecords(DataTable csvdt)
    {

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
        objbulk.WriteToServer(csvdt);
        con.Close();
    }
}