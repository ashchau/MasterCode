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
public partial class Login_Dashbord : System.Web.UI.Page
{
    public string constr;
    public SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter sqlda;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.codeproject.com/Questions/793864/Calling-a-JavaScript-method-in-Csharp-button-Click
        constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        con = new SqlConnection(constr);
    }

   

    protected void btnloin_Click(object sender, EventArgs e)
    {
        con.Open();
        sqlda = new SqlDataAdapter("SP_registration", con);
        sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlda.SelectCommand.Parameters.AddWithValue("@Ind", 3);
        sqlda.SelectCommand.Parameters.AddWithValue("@loginid", loginid.Text);
        sqlda.SelectCommand.Parameters.AddWithValue("@password", pwd.Text);
        dt = new DataTable();
        sqlda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            
            Session["username"] = dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
            Response.Redirect("/login/Student_Registration.aspx");
        }
        else
        {

            lblmsg.Text = "Please Enter a valid Login id and Password";
            lblmsg.ForeColor = Color.Red;
            lblmsg.Visible = true;
            loginid.Text= "";
        }
        con.Close();
    }

    protected void btnclear_Click(object sender, EventArgs e)
    {
        loginid.Text = "";
        // pwd.Text = " ";
        pwd.Attributes["value"] = "";
        chkremember.Checked = false;
        lblmsg.Visible = false;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("/login/Dashbord.aspx");
    }
}