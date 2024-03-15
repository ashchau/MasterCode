using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_CreateWebUserControl : System.Web.UI.UserControl
{
    string url = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/UploadFile/0c1bb2/properties-in-Asp-Net-user-control/
          url = HttpContext.Current.Request.Url.AbsoluteUri;
        //http://localhost:1302/TESTERS/Default6.aspx
        string path = HttpContext.Current.Request.Url.AbsolutePath;
        // /TESTERS/Default6.aspx
        string host = HttpContext.Current.Request.Url.Host;
        // localhost
    }

    protected void txtSave_Click(object sender, EventArgs e)
    {
        Label1.Text = "Your Name is " + txtName.Text + "  and you are  from  " + txtcity.Text;
    }
    public string GetUrl
    {
        get { return url; }
        set { url = value; }
    }
    public string TextBoxText
    {
        get
        {
            return txtName.Text;
        }
        set
        {
            txtName.Text = value;
        }
    }
    public string name
    {
        get { return txtcity.Text; }
        set { txtcity.Text = value;}
    }
}