using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Popupbootstrap_DesignRegistrarionForm : System.Web.UI.Page
{
    int totalNews;
    int totalSlid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.w3schools.com/cssref/playdemo.asp?filename=playcss_z-index
        //above link show tha all type of css classs properties
    }
    public void news()
    {
        if (totalNews > 4) if ((totalNews % 4) > 0) totalSlid = (totalNews / 4) + 1; else totalSlid = totalNews / 4; else totalSlid = 1;
    }
}