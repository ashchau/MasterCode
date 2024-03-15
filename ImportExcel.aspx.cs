using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class ImportExcel : System.Web.UI.Page
{
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);     
        //string path = fileuploadExcel.PostedFile.FileName;
        string path = string.Concat(Server.MapPath("~/PDF/" + fileuploadExcel.FileName));
        fileuploadExcel.SaveAs(path);
        string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;Persist Security Info=False";
        using (OleDbConnection excelConnection = new OleDbConnection(excelConnectionString))
        {
            //excelConnection.Open();
            // OleDbCommand cmd = new OleDbCommand("Select [ID],[Name],[Designation] from [Sheet1$]", excelConnection);
            OleDbCommand cmd = new OleDbCommand("Select * from [Sheet1$]", excelConnection);

            OleDbDataReader dReader;
            dReader = cmd.ExecuteReader();
            SqlBulkCopy sqlBulk = new SqlBulkCopy(con);
            sqlBulk.DestinationTableName = "NeweSBMDash";
            sqlBulk.WriteToServer(dReader);
            //excelConnection.Close();
        }
          
    }
}