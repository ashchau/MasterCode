using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Ionic.Zip;
public partial class ImportExport_frmmakeZipfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //https://www.c-sharpcorner.com/UploadFile/dbeniwal321/how-to-move-a-file-in-C-Sharp/
            //CreateZip();
            //Unzip();
            //MoveFile();
            GetfileExt();
        }
    }
    public void CreateZip()
    {
        //https://www.tutorialsteacher.com/csharp/csharp-file
        //https://www.c-sharpcorner.com/UploadFile/5089e0/how-to-create-zip-in-Asp-Net-using-C-Sharp/
        try
        {
            string pathname = Server.MapPath("~/Resume/");//Location for inside Test Folder  
            string[] filename = Directory.GetFiles(pathname);
            using (ZipFile zip = new ZipFile())
            {
                zip.AddFiles(filename, "Myzip");//Zip file inside filename
                //zip.AddFiles(filename);
                //zip.Save(Server.MapPath("~/Resume.zip"));
                zip.Save(@"E:/zip/Resume.zip");//location and name for creating zip file
                lbltxt.Text = "Zip File Created";
            }
        }
        catch (Exception ex)
        {
            lbltxt.Text = ex.Message;
        }
    }
    public void Unzip()
    {
        try
        {
            //string startPath = @"E:\zip\start"; 
            string zipPath = @"E:\zip\start\Resume.zip";
            string extractPath = @"E:\zip\extract";
            //var folderName = Path.GetFileNameWithoutExtension(delextractPath);
            #region Delete folder Myzip
            string folderName = @"E:\zip\extract\Myzip";
            if (Directory.Exists(folderName))
            {
                Directory.Delete(folderName, true);
            }
            #endregion
            #region use this code for delete all file and folder name if uncoment the dir.delete(true) line.
            //DirectoryInfo di = new DirectoryInfo(@"E:\zip\extract");
            //foreach (DirectoryInfo dir in di.GetDirectories())
            //{
            //    foreach (FileInfo file in dir.GetFiles())
            //    {
            //        file.Delete();
            //    }
            //    //dir.Delete(true); //it's delete the folder after delete all the file from that folder  eg.myzip
            //}
            #endregion
            //System.IO.Compression.ZipFile.CreateFromDirectory(startPath, zipPath);
            System.IO.Compression.ZipFile.ExtractToDirectory(zipPath, extractPath);
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
       
    }
    public void MoveFile()
    {
      
        try
        {

            string directoryPath = @"E:\zip\start\Myzip\";
            string newDirectoryPath = @"E:\zip\extract";
            if (Directory.Exists(directoryPath))
            {
                foreach (var file in new DirectoryInfo(directoryPath).GetFiles())
                {
                    //file.MoveTo(newDirectoryPath + "/" + file.Name); //it is also work
                    File.Move(directoryPath + "\\" + file.Name, newDirectoryPath + "\\" + file.Name);
                }
            }
        }
        catch (Exception ex)
        {

            Response.Write(ex.Message);
        }
    }
    public void GetfileExt()
    {
        try
        {
            string directoryPath1 = @"E:\zip\start\Myzip\";
            string newDirectoryPath1 = @"E:\zip\extract";
            if (Directory.Exists(directoryPath1))
            {
                foreach (var file1 in new DirectoryInfo(directoryPath1).GetFiles())
                {
                    if(file1.Extension==".zip")
                    {
                        System.IO.Compression.ZipFile.ExtractToDirectory(directoryPath1+"\\"+file1.Name, newDirectoryPath1);
                    }
                    else
                    {
                        file1.MoveTo(newDirectoryPath1 + "/" + file1.Name); 
                    }
                }
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
}