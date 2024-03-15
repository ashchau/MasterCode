using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CaptchaCode_ShowCaptcha2 : System.Web.UI.Page
{
    //http://www.codedigest.com/CodeDigest/88-A-Simple-CAPTCHA-Image-Verification-in-C--and-ASP-Net.aspx
    protected void Page_Load(object sender, EventArgs e)
    {
        //ImageVerification

        if (!IsPostBack)

        {

            SetVerificationText();

        }

    }
   // public void SetVerificationText()
    private string SetVerificationText()
    {

        //Random ran = new Random();

        //int no = ran.Next();

        //Session["Captcha"] = no.ToString();
        StringBuilder randomText = new StringBuilder();

        string alphabets = "012345679ACEFGHKLMNPRSWXZabcdefghijkhlmnopqrstuvwxyz";

        Random r = new Random();

        for (int j = 0; j <= 5; j++)

        { randomText.Append(alphabets[r.Next(alphabets.Length)]); }

        Session["Captcha"] = randomText.ToString();

        return Session["Captcha"] as String;

    }
    protected void CAPTCHAValidate(object source, ServerValidateEventArgs args)

    {

        if (Session["Captcha"] != null)

        {

            if (txtVerify.Text != Session["Captcha"].ToString())

            {

                SetVerificationText();

                args.IsValid = false;

                return;

            }

        }

        else

        {

            SetVerificationText();

            args.IsValid = false;

            return;

        }



    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)

        {

            return;

        }

        //Save the content

        Response.Write("You are not a SPAMMER!!!");

        // SetVerificationText();
        //txtVerify.Text = "";
    }
}
