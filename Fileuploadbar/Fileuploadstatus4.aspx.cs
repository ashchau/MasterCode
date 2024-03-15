using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class Fileuploadbar_Fileuploadstatus4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string fileName = Path.GetFileName(uploadfiles1.FileName);
        uploadfiles1.SaveAs(Server.MapPath("~/Fileuploadbar/uploads/") + fileName);
        lblMsg.Text = "File Uploaded Successfully";
    }
}