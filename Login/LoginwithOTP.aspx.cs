using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_LoginwithOTP : System.Web.UI.Page
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnotp_Click(object sender, EventArgs e)
    {
        Label1.Text = "180";
        lblMsg.Text = "";
        lblMsg.CssClass = "";
        if (txtusername.Text.Length != 10)
        {
            ShowMessageOTP("Enter Correct mobile No", false);
            return;
        }

        else
        {
            dt = new DataTable();
            string MobileNo = txtusername.Text;

            dt = new DataTable();
            dt = CommonCallApi.CallApiGetDt("Login/Login?MobileNo=" + MobileNo);
            if (dt.Rows.Count > 0)
            {
                dt = CommonCallApi.CallApiGetDt("Login/SendOTP?MobileNo=" + MobileNo);

                if (dt.Rows.Count > 0)
                {
                    PnlPassword.Visible = true;
                    btnlogin.Visible = true;
                    btnotp.Visible = false;
                    Timer1_Tick(sender, e);
                    Timer1.Enabled = true;
                    //   btnCancel.Visible = true;
                    Label1.Text = "180";
                }
                else
                {
                    PnlPassword.Visible = false;
                    btnlogin.Visible = false;
                    btnotp.Visible = true;
                    btnCancel.Visible = false;
                    Label1.Text = "0";
                    pnltime.Visible = false;
                    ShowMessageOTP("Internal Server Error...", false);
                }
            }
            else
            {
                ShowMessageOTP("Invalid Registration", false);
                btnotp.Visible = true;
                Label1.Text = "0";
                btnCancel.Visible = false;
                pnltime.Visible = false;
                Timer1.Enabled = false;

            }

        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        //Label1.Text = "0";
        //Timer1.Enabled = false;
        lblMsg.Text = "";
        lblMsg.CssClass = "";
        // pnltime.Visible = false;
        dt = new DataTable();

        if (txtusername.Text.Length != 10)
        {
            ShowMessageOTP("Enter Correct mobile No", false);
            return;
        }
        if (txtpassword.Text == "")
        {
            ShowMessageOTP("Enter OTP", false);
            return;
        }
        if (txtpassword.Text.Length != 6)
        {
            ShowMessageOTP("Enter Correct OTP", false);
            return;
        }
        string MobileNo = txtusername.Text;
        string OTP = txtpassword.Text;
        dt = CommonCallApi.CallApiGetDt("Login/CheckOTP?MobileNo=" + MobileNo + "&Password=" + OTP);

        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["Id"].ToString() == "1")
            {
                dt = new DataTable();
                dt = CommonCallApi.CallApiGetDt("Login/Login?MobileNo=" + MobileNo);
                if (dt.Rows.Count > 0)
                {
                    Session["UserCode"] = dt.Rows[0]["UserId"].ToString(); ;
                    // Session["UserCode"] = ds.Tables[0].Rows[0]["UserCode"].ToString();
                    Session["UserName"] = dt.Rows[0]["Name"].ToString();
                    Session["MobileNo"] = dt.Rows[0]["MobileNo"].ToString();
                    Session["Address"] = dt.Rows[0]["Address"].ToString();
                    Session["Category"] = dt.Rows[0]["Category"].ToString();
                    Session["Gender"] = dt.Rows[0]["Gender"].ToString();
                    Session["AutoId"] = dt.Rows[0]["AutoId"].ToString();
                    Response.Redirect("~/CRUD/RegistrationForm.aspx");
                }
                else
                {
                    ShowMessageOTP("Invalid Registration", false);
                    PnlPassword.Visible = false;
                    btnlogin.Visible = false;
                    btnotp.Visible = true;
                    Label1.Text = "0";
                    btnCancel.Visible = false;
                    pnltime.Visible = false;
                    Timer1.Enabled = false;

                }
            }
            else
            {

                //PnlPassword.Visible = false;
                //btnLogin.Visible = false;
                //btnSendOTP.Visible = true;
                //Label1.Text = "0";
                //Timer1.Enabled = false;
                //pnltime.Visible = false;
                //ShowMessageOTP("Invalid Mobile No or OTP", false);

                ShowMessageOTP("Incorrect OTP", false);
                PnlPassword.Visible = true;
                //btnLogin.Visible = false;
                // btnSendOTP.Visible = true;
                ///Label1.Text = "0";
                btnCancel.Visible = true;
                pnltime.Visible = true;
                // Timer1.Enabled = false;


                return;
            }


        }
        else
        {
            btnlogin.Visible = false;
            Label1.Text = "0";
            Timer1.Enabled = false;
            pnltime.Visible = false;
            PnlPassword.Visible = false;
            ShowMessageOTP("Invalid Mobile No or OTP", false);
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        int seconds = int.Parse(Label1.Text);
        if (seconds > 0)
        {
            Timer1.Interval = 1000;
            pnltime.Visible = true;
            Label1.Text = (seconds - 1).ToString();
        }

        else
        {
            btnCancel.Visible = false;
            Timer1.Enabled = false;
            btnotp.Visible = true;
            btnlogin.Visible = false;
            lblMsg.Text = "";
            lblMsg.CssClass = "";
            PnlPassword.Visible = false;
            pnltime.Visible = false;
           // ScriptManager.RegisterStartupScript(this, GetType(), "AnyValue", "showAlert();", true);
            //ClientScript.RegisterStartupScript(GetType(), Guid.NewGuid().ToString(), "loadJSFunction();", true);
            //Response.Redirect("~/Login/LoginwithOTP.aspx");
        }
    }
    void ShowMessageOTP(string Message, bool type)
    {
        lblMsg.Text = (type ? "" : "") + Message;
        lblMsg.CssClass = type ? "alert alert-success" : "alert alert-danger";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Timer1.Enabled = false;
        Label1.Text = "0";
        btnCancel.Visible = false;
        btnlogin.Visible = false;
        btnotp.Visible = true;
        PnlPassword.Visible = false;
        pnltime.Visible = false;
        Response.Redirect("~/Login/LoginwithOTP.aspx");
    }
}