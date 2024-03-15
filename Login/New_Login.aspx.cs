using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
public partial class Login_New_Login : System.Web.UI.Page
{
    public string constr;
    public SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter sqlda;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://stackoverflow.com/questions/18202784/how-not-to-validate-html5-text-box-with-required-attribute
        //https://www.codeproject.com/Questions/793864/Calling-a-JavaScript-method-in-Csharp-button-Click
        if (!IsPostBack)
        {
            if (Request.Cookies["userid"] != null)
                loginid.Value = Request.Cookies["userid"].Value;
            if (Request.Cookies["pwd"] != null)
                pwd.Attributes.Add("value", Request.Cookies["pwd"].Value);
            if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                chkremember.Checked = true;
        }
        constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        con = new SqlConnection(constr);
       
    }

    protected void btnloin_Click(object sender, EventArgs e)
    {
        con.Open();
        sqlda = new SqlDataAdapter("SP_registration", con);
        sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlda.SelectCommand.Parameters.AddWithValue("@Ind",3);
        sqlda.SelectCommand.Parameters.AddWithValue("@loginid", loginid.Value);
        sqlda.SelectCommand.Parameters.AddWithValue("@password", pwd.Text);
        dt = new DataTable();
        sqlda.Fill(dt);
        if(dt.Rows.Count>0)
        {
            if(chkremember.Checked==true)
            {
                Response.Cookies["userid"].Value = loginid.Value;
                Response.Cookies["pwd"].Value = pwd.Text;
                Response.Cookies["userid"].Expires = DateTime.Now.AddDays(15);
                Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(15);
            }
            else
            {
                Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
            }
            Session["username"] = dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
            Response.Redirect("/login/Student_Registration.aspx");
        }
        else
        {

            lblmsg.Text = "Please Enter a valid Login id and Password";
            lblmsg.ForeColor = Color.Red;
            lblmsg.Visible = true;
            loginid.Value = "";
        }
        con.Close();
    }

    protected void btnclear_Click(object sender, EventArgs e)
    {
        loginid.Value = "";
       // pwd.Text = " ";
        pwd.Attributes["value"] = "";
        chkremember.Checked = false;
        lblmsg.Visible = false;
    }
}