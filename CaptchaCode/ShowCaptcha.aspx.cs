using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowCaptcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCaptcha_Click(object sender, EventArgs e)
    {
        //imgCaptcha.ImageUrl = "~/CreateCaptcha.aspx?New=0";

        if (Session["CaptchaCode"] != null && txtCaptcha.Text == Session["CaptchaCode"].ToString())

        {

            lblMessage.ForeColor = Color.Green;

            lblMessage.Text = "Captcha code validated successfully!!";

        }

        else

        {

            lblMessage.ForeColor = Color.Red;

            lblMessage.Text = "Captcha code is wrong!!";

        }
    }
}