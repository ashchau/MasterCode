using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GlobalSessionPage_FrmLogin : System.Web.UI.Page
{
    PlLogin plLogin;
    CommonCallApi CallApi;
    APIResponse res;
    businesslogic objbusinesslogic;
    DataSet ds;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text == "")
        {
            showmessage("Please Enter User Name", false);
            txtuserid.Focus();
            return;
        }
        if (txtpwd.Text == "")
        {
            showmessage("Please Enter Password", false);
            txtpwd.Focus();
            return;
        }
        plLogin = new PlLogin();
        plLogin.Ind = 1;
        plLogin.Level = ddllevel.SelectedValue == "" ? 0 : Convert.ToInt32(ddllevel.SelectedValue);
        plLogin.UserId = txtuserid.Text.Trim();
        plLogin.Password = txtpwd.Text.Trim();
        CallApi = new CommonCallApi();
        res = new APIResponse();
        //  res = CallApi.CallPostApi("Login/LoginUser", plLogin);//it also work
        res = CallApi.CallPostApires("Login/LoginUser1", plLogin);
        if (res != null && res.successcode == "1")
        {

            //string msg = res.msg;
            // string JsonData = JsonConvert.SerializeObject(res.data);
            //List<PlLogin> user = JsonConvert.DeserializeObject<List<PlLogin>>(res.data.ToString());


            //ds = new DataSet();
            //ds = JsonConvert.DeserializeObject<DataSet>(res.data.ToString());
            //GlobalSession.Level = ds.Tables[0].Rows[0]["Level"].ToString();
            //GlobalSession.Co_Code = ds.Tables[0].Rows[0]["Co_Code"].ToString();
            //GlobalSession.Co_Name = ds.Tables[0].Rows[0]["Co_Name"].ToString();
            //GlobalSession.Client_Id = ds.Tables[0].Rows[0]["Client_Id"].ToString();
            //GlobalSession.UserId = ds.Tables[0].Rows[0]["UserId"].ToString();
            //GlobalSession.UserName = ds.Tables[0].Rows[0]["UserName"].ToString();


            //second method
            PlLogin pl_Login = new PlLogin();
            pl_Login = JsonConvert.DeserializeObject<PlLogin>(res.data.ToString());
            GlobalSession.Level = pl_Login.Level.ToString();
            GlobalSession.Co_Code = pl_Login.Co_Code.ToString();
            GlobalSession.Co_Name = pl_Login.Co_Name.ToString();
            GlobalSession.Client_Id = pl_Login.Client_Id.ToString();
            GlobalSession.UserId = pl_Login.UserId.ToString();
            GlobalSession.UserName = pl_Login.UserName.ToString();
            if (GlobalSession.Level == "1" || GlobalSession.Level == "2")
            {
                Response.Redirect("Registration.aspx", false);
            }
            else
            {
                Response.Redirect("FrmLogin.aspx", false);
            }
        }
        else
        {

            string msg = res.msg.ToString();
        }




        // objbusinesslogic = new businesslogic();
        // ds = new DataSet();
        //ds= objbusinesslogic.Login("SpMst_Company", plLogin);
        // if(ds.Tables[0].Rows.Count>0)
        // {

        //     GlobalSession.Level = ds.Tables[0].Rows[0]["Level"].ToString();
        //     GlobalSession.Co_Code = ds.Tables[0].Rows[0]["Co_Code"].ToString();
        //     GlobalSession.Co_Name = ds.Tables[0].Rows[0]["Co_Name"].ToString();
        //     GlobalSession.Client_Id = ds.Tables[0].Rows[0]["Client_Id"].ToString();
        //     GlobalSession.UserId = ds.Tables[0].Rows[0]["UserId"].ToString();
        //     GlobalSession.UserName = ds.Tables[0].Rows[0]["UserName"].ToString();
        //     if(GlobalSession.Level=="1" || GlobalSession.Level=="2")
        //     {
        //     Response.Redirect("Registration.aspx", false);
        //     }
        //     else
        //     {
        //         Response.Redirect("FrmLogin.aspx", false);
        //     }

        // }
        // else
        // {
        //     showmessage("Record Not Found...", false);
        // }


    }
    public void showmessage(string Message, bool succfail)
    {
        lblmsg.Text = Message;
        error_div.CssClass = succfail ? "alert alert-success mb0 smlPadding100" : "alert alert-danger mb0 smlPadding100";
        error_div.Visible = true;
    }
    public void clearmsg()
    {
        lblmsg.Text = "";
        error_div.CssClass = "alert alert-danger mb0 smlPadding100";
        error_div.Visible = false;
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text == "")
        {
            showmessage("Please Enter User Name", false);
            txtuserid.Focus();
            return;
        }
        if (txtpwd.Text == "")
        {
            showmessage("Please Enter Password", false);
            txtpwd.Focus();
            return;
        }
        plLogin = new PlLogin();
        plLogin.Ind = 1;
        plLogin.Level = ddllevel.SelectedValue == "" ? 0 : Convert.ToInt32(ddllevel.SelectedValue);
        plLogin.UserId = txtuserid.Text.Trim();
        plLogin.Password = txtpwd.Text.Trim();
        CallApi = new CommonCallApi();
        dt = new DataTable();
        dt = CallApi.CallPostApiDt("Login/LoginUserdt", plLogin);
        if (dt.Rows.Count > 0)
        {
            GlobalSession.Level = dt.Rows[0]["Level"].ToString();
            GlobalSession.Co_Code = dt.Rows[0]["Co_Code"].ToString();
            GlobalSession.Co_Name = dt.Rows[0]["Co_Name"].ToString();
            GlobalSession.Client_Id = dt.Rows[0]["Client_Id"].ToString();
            GlobalSession.UserId = dt.Rows[0]["UserId"].ToString();
            GlobalSession.UserName = dt.Rows[0]["UserName"].ToString();
            Response.Redirect("Registration.aspx", false);
        }
        else
        {
            lblmsg.Text = "User  not Found";
        }

    }

    protected void btnloginnew_Click(object sender, EventArgs e)
    {
        plLogin = new PlLogin();
        plLogin.Ind = 1;
        plLogin.Level = ddllevel.SelectedValue == "" ? 0 : Convert.ToInt32(ddllevel.SelectedValue);
        plLogin.UserId = txtuserid.Text.Trim();
        plLogin.Password = txtpwd.Text.Trim();
        CallApi = new CommonCallApi();
        res = new APIResponse();
        //  res = CallApi.CallPostApi("Login/LoginUser", plLogin);//it also work
        res = CallApi.CallPostApires("Login/LoginUser2", plLogin);
        if (res != null && res.successcode == "1")
        {
            dt = new DataTable();
            dt = JsonConvert.DeserializeObject<DataTable>(res.data.ToString());
            if (dt.Rows.Count > 0)
            {
                GlobalSession.Level = dt.Rows[0]["Level"].ToString();
                GlobalSession.Co_Code = dt.Rows[0]["Co_Code"].ToString();
                GlobalSession.Co_Name = dt.Rows[0]["Co_Name"].ToString();
                GlobalSession.Client_Id = dt.Rows[0]["Client_Id"].ToString();
                GlobalSession.UserId = dt.Rows[0]["UserId"].ToString();
                GlobalSession.UserName = dt.Rows[0]["UserName"].ToString();
                if (GlobalSession.Level == "1" || GlobalSession.Level == "2")
                {
                    Response.Redirect("Registration.aspx", false);
                }
                else
                {
                    Response.Redirect("FrmLogin.aspx", false);
                }
            }
        }
    }
}