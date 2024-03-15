using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sessiontimer_QueryStringGetvalue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["back"] = Request.QueryString["back"].ToString();
            if (Request.QueryString["Fname"] != null && Request.QueryString["Fname"] != string.Empty)
                lblfname.Text = Request.QueryString["Fname"];

            if (Request.QueryString["Lname"] != null && Request.QueryString["Lname"] != string.Empty)
                lbllname.Text = Request.QueryString["Lname"];
        }
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        if(Session["back"].ToString()=="1")
        {
            Response.Redirect("../Sessiontimer/QueryStringSetvalue.aspx");//or also write below line
            //Response.Redirect("QueryStringSetvalue.aspx");
        }
    }
}