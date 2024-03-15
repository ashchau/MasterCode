using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sessiontimer_QueryStringSetvalue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnset_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Sessiontimer/QueryStringGetvalue.aspx?Fname=" + txtfname.Text.Trim() + "&Lname=" + txtlname.Text.Trim() + "&back=1");
        //Server.Transfer("/Sessiontimer/QueryStringGetvalue.aspx?Fname=" + txtfname.Text.Trim() + "&Lname=" + txtlname.Text.Trim() + "&back=1");
        
    }
} 