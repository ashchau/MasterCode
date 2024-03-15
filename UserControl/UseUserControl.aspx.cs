using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_UseUserControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/UploadFile/0c1bb2/properties-in-Asp-Net-user-control/
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        //TextBox txt =commanpgae.FindControl("txtName") as TextBox;
        string getul = commanpgae.GetUrl;
        string city= commanpgae.name;
        string name = commanpgae.TextBoxText;
        lblcity.Text = commanpgae.name;
        lblname.Text = commanpgae.TextBoxText;
        string url = HttpContext.Current.Request.Url.AbsoluteUri;
        var p = HttpContext.Current;
        if(getul==url)
        {
            
        }
    }
}