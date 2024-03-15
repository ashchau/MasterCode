using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Clientsidevalidation_myprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/article/textbox-validation-client-side-and-server-side-in-asp-net-webform/
        //https://www.geeksforgeeks.org/javascript-focus/
        //https://www.geeksforgeeks.org/how-to-display-error-without-alert-box-using-javascript/
        //how to get only number from a alphanumeric string
        string str = "112fd20";
        int input = Convert.ToInt32(Regex.Replace(str, "[^0-9]+", string.Empty));

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string MsgText = "";
        Int32 rsltcount = 0;


        //Age Validation    
        bool ageValStatus = VerifyNumericValue(txtAge.Text);
        if (ageValStatus == false)
        {
            rsltcount += 1;
            MsgText += "Invalid age or age required.</br>";
        }
        if (ageValStatus == true)
        {
            if (Convert.ToDecimal(txtAge.Text) > 100)
            {
                rsltcount += 1;
                MsgText += " Check your entered age.</br>";
            }
        }

        //Mobile Validation    
        bool mobileValStatus = VerifyNumericValue(txtMobile.Text);
        if (mobileValStatus == false)
        {
            rsltcount += 1;
            MsgText += "Invalid mobile number.....</br>";
        }
        if (mobileValStatus == true)
        {
            if (txtMobile.Text.Length != 10)
            {
                rsltcount += 1;
                MsgText += "Check your entered mobile number.</br>";
            }
        }

        //Email ID Validation    
        bool emailidValStatus = VerifyEmailID(txtEmailID.Text);
        if (emailidValStatus == false)
        {
            rsltcount += 1;
            MsgText += "Invalid email id or email id required.</br>";
        }

        lblResultMessage.Text = MsgText;
        lblResultMessage.Font.Bold = false;
        lblResultMessage.Font.Size = 14;
        lblResultMessage.ForeColor = System.Drawing.Color.Red;

    }
    public bool VerifyNumericValue(string ValueToCheck)
    {
        Int64 numval;
        bool rslt = false;

        rslt = Int64.TryParse(ValueToCheck, out numval);

        return rslt;
    }

    public static bool VerifyEmailID(string email)
    {
        string expresion;
        expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
        if (Regex.IsMatch(email, expresion))
        {
            if (Regex.Replace(email, expresion, string.Empty).Length == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    protected void btntest_Click(object sender, EventArgs e)
    {
      string getvalue = TextBox1.Text;
    }
}