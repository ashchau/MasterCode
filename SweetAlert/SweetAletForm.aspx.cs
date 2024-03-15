using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class SweetAlert_SweetAletForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //inline alert 
        //{
        //    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Yes!', 'Welcome to Master!', 'success');", true);

        //}
        //{
        //    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oops!', 'Invalid Username And Passward!', 'error');", true);
        //}
        //below error come when not add false in below code cursor go to the catch block
        //Unable to evaluate expression because the code is optimized or a native frame is on top of the call stack 
       // Response.Redirect("~/HomePage.aspx", false);
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {

    }
}