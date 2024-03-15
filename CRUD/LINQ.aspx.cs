using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRUD_LINQ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Linqmethod();
    }
    public void Linqmethod()
    {
        string mynumber = string.Empty;
        int[] numbers = { 5, 4, 1, 3, 9, 8 };
        var numsPlusOne = from n in numbers where n<4 select n;
        foreach (var i in numsPlusOne)
        {
            Console.WriteLine(i.ToString());
            mynumber +=","+ i.ToString();
        }
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type = 'text/javascript'>alert('Order Placed Successfully....')</script>");
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script type = 'text/javascript'>window.onload=function(){alert('Order Placed Successfully.')};</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+ mynumber + "')", true);

        //string message = "Order Placed Successfully.";
        //System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //sb.Append("<script type = 'text/javascript'>");
        //sb.Append("window.onload=function(){");
        //sb.Append("alert('");
        //sb.Append(message);
        //sb.Append("')};");
        //sb.Append("</script>");
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
    }
}