using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Timepicker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
        }
        
    }

    protected void btngettime_Click(object sender, EventArgs e)
    {
        string st = datetimepicker2.Text;
        string timepicker = FromDate.Value.ToString().Replace("T"," ");
        
    }
}