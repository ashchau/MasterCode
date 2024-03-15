using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImportExport_GetAllFolderFiles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            GetAllFiles();
            //getfile();
            getallfile();
        }
    }
    public void GetAllFiles()
    {
        DirectoryInfo objDirectoryInfo = new DirectoryInfo(@"D:\Ashok\");
        FileInfo[] allFiles = objDirectoryInfo.GetFiles("*.*", SearchOption.AllDirectories); //AllDirectories Get all file from folder and subfolder
        //FileInfo[] allFiles = objDirectoryInfo.GetFiles("*.*", SearchOption.TopDirectoryOnly); //TopDirectoryOnly Get all file from only ashok folder
        FileInfo[] javascriptFiles = objDirectoryInfo.GetFiles("*.js", SearchOption.AllDirectories);

        foreach (var file in allFiles)
        {
            //Response.Write("File: " + file.Name + ", Full Path: " + file.FullName);
            Response.Write("File: " + file.Name + ", Full Path:" + "<ul><li><a href='"+ file.FullName + "' target='_blank'>" + file.FullName + "</a></li></ul>");
            Response.Write("<br/>");
        }
    }
    protected void btnGetFiles_Click(object sender, EventArgs e)
    {
        //https://www.aspdotnet-suresh.com/2013/08/c-get-all-files-from-folder-and.html
        BindGridview();
    }
    protected void BindGridview()
    {
        string strpath = @"E:\Pinkcity\";
        string[] folders = Directory.GetFiles(strpath, "*", SearchOption.AllDirectories);
        gvDetails.DataSource = folders;
        gvDetails.DataBind();
    }
    public void getfile()
    {
    
        string folderPath = Server.MapPath("~/PDF/NEWS/");
        //string folderPath = Server.MapPath(@"E:\myfile");
        //string[] folderFiles = Directory.GetFiles(folderPath);
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        string query = "select * from MstNews";
        SqlCommand cmd1 = new SqlCommand(query, con);
        con.Open();
        List<string> excludes = new List<string>();
        using (SqlDataReader reader = cmd1.ExecuteReader())
        {
            while (reader.Read())
            {
                excludes.Add (reader["PdfName"].ToString());
            }
        }
        var files = System.IO.Directory.GetFiles(folderPath).Where(x => !excludes.Contains(System.IO.Path.GetFileName(x)));
        foreach (var file in files)
        {
            System.IO.File.Delete(file);
        }
        //DeleteFilesExcept(folderPath, excludes);
    }
    //Actual method
    public void DeleteFilesExcept(string directory, List<string> excludes)
    {
        var files = System.IO.Directory.GetFiles(directory).Where(x => !excludes.Contains(System.IO.Path.GetFileName(x)));
        foreach (var file in files)
        {
            System.IO.File.Delete(file);
        }
    }
    public void getallfile()//how to copy files from one folder to another folder
    {
        string folderPath = Server.MapPath("~/PDF/NEWS/");
        string destFilePath = @"E:\myfile\";
        string []fldfile = Directory.GetFiles(destFilePath);
        string[] folderFiles = Directory.GetFiles(folderPath);
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        string query = "select * from MstNews";
        SqlCommand cmd1 = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd1);
        dt = new DataTable();
        da.Fill(dt);
        //folderFiles = folderFiles.Where(filePath => !dt.AsEnumerable().Any(row => string.Equals(row.Field<string>("PdfName"), Path.GetFileName(filePath), StringComparison.OrdinalIgnoreCase))).ToArray();
        fldfile = fldfile.Where(filePath => dt.AsEnumerable().Any(row => string.Equals(row.Field<string>("PdfName"), Path.GetFileName(filePath), StringComparison.OrdinalIgnoreCase))).ToArray();
        foreach (var file in fldfile)
        {
            //string filePath = file; // Replace with your file path
            // Get the file name from the file path
            string fileName = Path.GetFileName(file);
            string DesfoldPath = Server.MapPath("~/PDF/NEWS/"+ fileName);
            copyfile(file, DesfoldPath);
            //System.IO.File.Delete(file);
        }
    }
    public void copyfile(string sourceFilePath,string destinationFilePath)
    {
        if (File.Exists(sourceFilePath))
        {
            try
            {
                // Copy the file to the destination directory
                File.Copy(sourceFilePath, destinationFilePath);
                //Console.WriteLine("File copied successfully!");
            }
            catch (IOException ex)
            {

            }
        }
        else
        {
            //Console.WriteLine("Source file does not exist.");
        }
    }
    public DataTable getEmployeeDetails()
    {
        DataTable dt=new DataTable ();
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        string query = "select * from MstNews";

        SqlCommand cmd1 = new SqlCommand(query, con);
        con.Open();
      
        using (SqlDataReader reader = cmd1.ExecuteReader())
        {
            while (reader.Read())
            {
                string fileNameFromDB = reader["PdfName"].ToString();

                // Specify the folder path
                string folderPath = Server.MapPath("~/PDF/NEWS/");

                // List files in the folder
                string[] folderFiles = Directory.GetFiles(folderPath);
                List<string> excludes = new List<string>();
                excludes.Add("news1.pdf");
                excludes.Add("news2.pdf");

                var files = System.IO.Directory.GetFiles(folderPath).Where(x => !excludes.Contains(System.IO.Path.GetFileName(x)));
                foreach (var file in files)
                {
                    System.IO.File.Delete(file);
                }




                // Compare database records with folder contents
                if (!Array.Exists(folderFiles, file => Path.GetFileName(file) == fileNameFromDB))
                {
                    // Delete unmatched files
                    string filePathToDelete = Path.Combine(folderPath, fileNameFromDB);
                    File.Delete(filePathToDelete);
                }
            }
        }




        //    using (SqlConnection conn = new SqlConnection(constr))
        //{
        //    string sql = "select * from MstNews";
        //    using (SqlCommand cmd = new SqlCommand(sql, conn))
        //    {
        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        da.Fill(dt);
        //        conn.Close();
        //    }
        //}


        //string strpath = Server.MapPath("~/PDF/NEWS/");
        //string[] folders = Directory.GetFiles(strpath, "*", SearchOption.AllDirectories);
        //foreach (var item in folders)
        //{
        //    string f = item;
        //    for (int i = 0; i < dt.Rows.Count; i++)
        //    {
        //        string targetDirectory = Server.MapPath("~/PDF/NEWS/");
        //        string fname = dt.Rows[0]["PdfName"].ToString();
        //        string fpath = targetDirectory + fname;
        //        if (fpath == f)
        //        {

        //        }
        //        else
        //        {
        //            File.Delete(f);
        //        }
        //    }
        //}
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    string targetDirectory = Server.MapPath("~/PDF/NEWS/");
        //    string searchPattern = string.Format("*{0}*", dt.Rows[0]["PdfName"]);
        //    string fname = dt.Rows[0]["PdfName"].ToString();
        //    string fpath = targetDirectory + fname;
        //    var filesToDelete = Directory.EnumerateFiles(targetDirectory, searchPattern);
        //    foreach (var fileToDelete in filesToDelete)
        //    {
        //        try
        //        {
        //            if(fpath == fileToDelete)
        //            {

        //            }
        //            else
        //            {
        //             File.Delete(fileToDelete);
        //            }
        //        }
        //        catch (Exception ex)
        //        {
                   
        //        }
        //    }
        //}
       

        //if (dt != null && dt.Rows.Count > 0)
        //{
        //    string path1 = Server.MapPath("~/PDF/");
        //    DirectoryInfo folderInfo = new DirectoryInfo(path1);

        //    foreach (FileInfo FolderFile in folderInfo.GetFiles())
        //    {
        //        foreach (DataRow dr in dt.Rows)
        //        {
        //            var FFils = FolderFile.ToString();
        //            var DBFile = dr["FilePath"].ToString();
        //            if (DBFile == FFils)
        //            {
        //                Server.MapPath("~/Images/" + DBFile);
        //            }
        //            else
        //            {
        //                FolderFile.Delete();
        //            }
        //        }
        //    }
        //}
        return dt;
    }
   //public void uselinq()//work in C#7 version
   // {
   //     var numbers = new List<int>()
   //     {
   //         1,2,3
   //     };
   //     var letters = new List<char>()
   //     {
   //         'a','b','c'
   //     };
   //     var result = numbers.Zip(letters, (num, letters => $"{num}-{letters}"));
   // }
}