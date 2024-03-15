using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
public partial class Sessiontimer_sessiontimer2 : System.Web.UI.Page
{
    //https://www.aspsnippets.com/Articles/Detect-Session-Timeout-and-redirect-to-Login-Page-in-ASPNet-using-C-and-VBNet.aspx
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (!this.IsPostBack)
        {
            Session["Reset"] = true;
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/Web.Config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            //int timeout = (int)section.Timeout.TotalMinutes * 1000 * 60; //for 20 minute (20*1000*60=1200000),1200000/1000=1200 second=20 minute
            int timeout = (int)section.Timeout.TotalMinutes * 100 * 60;//for 2 minute(20*100*60=120000),120000/1000=120 seconds=2 minute
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);
        }
    }
}