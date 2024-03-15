using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Linkgenerate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["filelist"] != null)
        {
            ShowHyperLink();
        }
        else
        {
            Session["filelist"] = new List<string>();
        }
    }
    private void ShowHyperLink()
    {
        Panel1.Controls.Clear(); //to remove all controls
        foreach (var item in (List<string>)Session["filelist"])
        {
            HyperLink h1 = new HyperLink();
            h1.Text = item;
            h1.NavigateUrl = @"http://localhost:63913/PDF/" + item;
            Panel1.Controls.Add(h1);
        }
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUploadControl.FileName);
                List<string> filepaht = (List<string>)Session["filelist"];
                filepaht.Add(filename);
                FileUploadControl.SaveAs(Server.MapPath("~/PDF/") + filename);
                StatusLabel.Text = "Upload status: File uploaded!";
                Session["filelist"] = filepaht;
                ShowHyperLink();
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
}