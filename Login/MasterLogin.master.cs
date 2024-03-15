using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_MasterLogin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
           if (HttpContext.Current.Session["Username"] == null || HttpContext.Current.Session["Username"].ToString() == "" || HttpContext.Current.Session["Username"].ToString() == "0")
            {
                // Response.Redirect("DecryptLogin.aspx");
                spnname.InnerText = "Default User";
            }
           else
            {
                spnname.InnerText = Session["Username"].ToString();
            }
            //if (Session["Username"] != null )
            //{
            //   spnname.InnerText= Session["Username"].ToString();
            //}
        }
    }

    
}
