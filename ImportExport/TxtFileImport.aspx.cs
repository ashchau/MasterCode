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

public partial class ImportExport_TxtFileImport : System.Web.UI.Page
{
    businesslogic objblogic;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/questions/493136/Import-Date-from-Text-txt-File-into-Database-using-C-and-VBNet-in-ASPNet/
        //https://www.aspsnippets.com/questions/187105/Find-TextBox-value-inside-GridView-on-Button-click-using-C-in-ASPNet/
        //https://www.c-sharpcorner.com/blogs/reading-text-file-with-multiple-headings-in-c-sharp1
    }
    protected void ReadDat(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[] {
        new DataColumn("EmployeeCode",typeof(int)),
        new DataColumn("Date",typeof(DateTime)),
        new DataColumn("Time",typeof(TimeSpan)),
        new DataColumn("Status",typeof(string)),
        new DataColumn("MId",typeof(int)) });
        //string TxtFilePath = Path.GetFullPath(FileUpload1.PostedFile.FileName);
        //string[] lines = File.ReadAllLines(TxtFilePath);                          ////string[] lines = File.ReadAllLines(FileUpload1.PostedFile.FileName);
        //my code start
        //if use above 2 line then need to first paste the uploaded file to C:\Program Files (x86)\IIS Express this location the import the excel....
        string Textfilepath = Server.MapPath("~/PDF/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
        FileUpload1.SaveAs(Textfilepath);
        string[] lines = File.ReadAllLines(Textfilepath);
        //my code end
        for (int i = 0; i < lines.Length; i++)
        {
            for (int j = 0; j < lines[i].Split(' ').Length; j++)
            {
                string dateValue = lines[i].Split(' ')[j].Substring(0, 8);
                DateTime Dates = new DateTime(Convert.ToInt32(dateValue.Substring(0, 4)), Convert.ToInt32(dateValue.Substring(4, 2)), Convert.ToInt32(dateValue.Substring(6, 2)));
                string time = lines[i].Split(' ')[j].Substring(8, 4);
                TimeSpan Times = new TimeSpan(Convert.ToInt32(time.Substring(0, 2)), Convert.ToInt32(time.Substring(2, 2)), 0);
                string INOUT = lines[i].Split(' ')[j].Substring(12, 4);
                //Int32 INOUT =Convert.ToInt32( lines[i].Split(' ')[j].Substring(12, 4));
                Int32 empcode = Convert.ToInt32(lines[i].Split(' ')[j].Substring(16, 7));
                int MID = Convert.ToInt32(lines[i].Split(' ')[j].Substring(23, 2));
                dt.Rows.Add(empcode, Dates, Times, INOUT, MID);
                Insert(empcode, Dates, Times, INOUT, MID);
            }
        }
        gvEmployees.DataSource = dt;
        gvEmployees.DataBind();
    }
    public void Insert(int empcode, DateTime date, TimeSpan TIme, string INOUT, int MID)
    {
        string str = ConfigurationManager.ConnectionStrings["Con"].ToString();
        using (SqlConnection con = new SqlConnection(str))
        {
            string query = "INSERT INTO HR VALUES(" + empcode + ",'" + date + "','" + TIme + "','" + INOUT + "'," + MID + ")";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
    #region Second method for txt file upload
    protected void gridbind()
    {
        DataTable dt = new DataTable();
        string path = Server.MapPath("~/PDF/Importtxt.txt");
        if (!string.IsNullOrEmpty(path))
        {
            string[] readText = File.ReadAllLines(path);

            List<string> rows = readText.ToList<string>();

            DataColumn dc;
            string[] headers = rows[0].Split(new string[] { "|" }, StringSplitOptions.None);//\
            foreach (string s in headers)
            {
                dc = new DataColumn(s, typeof(System.String));

                dt.Columns.Add(dc);
            }
            rows.RemoveAt(0);
            rows.RemoveAll(u => !u.Contains("|")); //"\""
            //rows.RemoveAll(u => u.Contains("Totals"));.


            DataRow dr;
            foreach (string s in rows)
            {
                string[] values = s.Split(new string[] { "|" }, StringSplitOptions.None);  //"\""
                dr = dt.NewRow();
                for (int i = 0; i < headers.Count(); i++)
                {
                    dr[i] = values[i].Replace("|", "");  //","

                }
                dt.Rows.Add(dr);
            }
        }
        grdimport.DataSource = dt;
        grdimport.DataBind();
    }
    #endregion
    protected void ImportTxtfile()
    {
        DataTable dt = new DataTable();
        string path = Server.MapPath("~/PDF/Importtxt.txt");
        if (!string.IsNullOrEmpty(path))
        {
            string[] readText = File.ReadAllLines(path);

            List<string> rows = readText.ToList<string>();

            DataColumn dc;
            string[] headers = rows[0].Split(new string[] { "|" }, StringSplitOptions.None);//\
            foreach (string s in headers)
            {
                dc = new DataColumn(s, typeof(System.String));

                dt.Columns.Add(dc);
            }
            rows.RemoveAt(0);
            rows.RemoveAll(u => !u.Contains("|")); //"\""
            //rows.RemoveAll(u => u.Contains("Totals"));.


            DataRow dr;
            foreach (string s in rows)
            {
                string[] values = s.Split(new string[] { "|" }, StringSplitOptions.None);  //"\""
                dr = dt.NewRow();
                for (int i = 0; i < headers.Count(); i++)
                {
                    dr[i] = values[i].Replace("|", "");  //","

                }
                dt.Rows.Add(dr);
            }
        }

        string filename = "Importtxt";
        string tableDDL = "";
        tableDDL += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = ";
        tableDDL += "OBJECT_ID(N'[dbo].[" + filename.Replace(" ", "_") + "]') AND type in (N'U'))";
        tableDDL += "begin \n drop table " + filename.Replace(" ", "_") + " \n end \n ";

        tableDDL += "IF Not EXISTS (SELECT * FROM sys.objects WHERE object_id = ";
        tableDDL += "OBJECT_ID(N'[dbo].[" + filename.Replace(" ", "_") + "]') AND type in (N'U'))";
        tableDDL += "Create table [" + filename.Replace(" ", "_") + "]";
        tableDDL += "(";

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            string ColName = dt.Columns[i].ToString();
            if (i != dt.Columns.Count - 1)
                tableDDL += "[" + (ColName.Trim()).Replace(" ", "_").Replace("-", "").Replace("/", "_").Replace("#", "").Replace("&", "").Replace("(", "_").Replace(")", "").Replace("+", "_").Replace("%", "_Per") + "] " + "NVarchar(max)" + ",";
            else
                tableDDL += "[" + (ColName.Trim()).Replace(" ", "_").Replace("-", "").Replace("/", "_").Replace("#", "").Replace("&", "").Replace("(", "_").Replace(")", "").Replace("+", "_").Replace("%", "_Per") + "] " + "NVarchar(max)";
        }

        tableDDL += ")";
        //string sqlConnectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection SQLConnection = new SqlConnection();
        DBConnection dBConnection = new DBConnection();
        SQLConnection = DBConnection.SqlConn_JaipurMcDB();
       // SQLConnection.Open();
        SqlCommand myCommand = new SqlCommand(tableDDL, SQLConnection);
        myCommand.ExecuteNonQuery();


        SqlBulkCopy bulkInsert = new SqlBulkCopy(SQLConnection);
        bulkInsert.DestinationTableName = filename.Replace(" ", "_");
        //bulkInsert.WriteToServer(dr);
        bulkInsert.WriteToServer(dt);
       // SQLConnection.Close();





        grdimport.DataSource = dt;
        grdimport.DataBind();
    }

    protected void btnimport_Click(object sender, EventArgs e)
    {
        //gridbind();
        ImportTxtfile();
    }
}