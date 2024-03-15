using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRUD_MessageDynamic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void ShowMessage(string msg,bool msgtype)
    { 
        lblmsg.Text = (msgtype ? "" : " ") + msg;
        lblmsg.CssClass = msgtype ? "alert alert-success" : "alert alert-danger";
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (txtname.Text == "")
        {
            ShowMessage("Please Enter name", false);
            txtname.Focus();
            return;
        }
        if (txtname.Text !=null)
        {
            ShowMessage(txtname.Text, true);
            txtname.Focus();
            return;
        }
    }
}