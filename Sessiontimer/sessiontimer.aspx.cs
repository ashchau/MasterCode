using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sessiontimer_sessiontimer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsessiontimeout_Click(object sender, EventArgs e)
    {
        //create session and set timeout = 2 minutes
        Session["name"] = txtname.Text;
        Session.Timeout = 2;
    }

    protected void btndisplay_Click(object sender, EventArgs e)
    {
        lblstime.Text = Session["name"].ToString();
    }
}