using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [ScriptMethod()]
    [WebMethod]
    public static void saveReminder()
    {
        
    }

    protected void lnklogout_Click(object sender, EventArgs e)
    {
        HttpContext.Current.Session.Abandon();
        HttpContext.Current.Response.Redirect("~/GlobalSessionPage/FrmLogin.aspx");
    }
}
