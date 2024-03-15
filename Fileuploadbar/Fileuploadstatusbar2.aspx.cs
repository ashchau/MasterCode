using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Fileuploadbar_Fileuploadstatusbar2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.aspforums.net/Threads/661533/Display-File-Upload-Progress-with-jQuery-UI-Progressbar-using-C-VBNet-and-Generic-Handler-in-ASPNet/
    }

    protected void Save(object sender, EventArgs e)
    {
        string folderPath = Server.MapPath("~/Fileuploadbar/Videos/"); //Please enter your folder Name here.
        string ImagefolderPath = Server.MapPath("~/Fileuploadbar/UserImage/"); //Please enter your folder Name here.
        string strname = "";
        string extension = "";
        if (FileUploadpost.HasFile)
        {
            strname = FileUploadpost.FileName;
            extension = System.IO.Path.GetExtension(strname);

            if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".gif" || extension.ToLower() == ".jpeg")
            {
                FileUploadpost.SaveAs(ImagefolderPath + strname); //save file from fileUpload to folder here.
            }
            // Video extension.
            else if (extension.ToLower() == ".mp4" || extension.ToLower() == ".wmv" || extension.ToLower() == ".flv" || extension.ToLower() == ".vob" || extension.ToLower() == ".dat")
            {
                FileUploadpost.SaveAs(folderPath + strname); //save file from fileUpload to folder here.
            }
        }
    }
}