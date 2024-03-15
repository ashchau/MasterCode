using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GlobalSessionPage_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SessionCheck.CommonCheckSession();
    }
    public void showdetails()
    {
        lblCo_Code.Text = GlobalSession.Co_Code;
        lblCo_Name.Text = GlobalSession.Co_Name;
        lblClient_Id.Text = GlobalSession.Client_Id;
        lblLevel.Text = GlobalSession.Level;
        lblUserId.Text = GlobalSession.UserId;
        lblUserName.Text = GlobalSession.UserName;
    }

    protected void btnDetails_Click(object sender, EventArgs e)
    {
        showdetails();
    }
}