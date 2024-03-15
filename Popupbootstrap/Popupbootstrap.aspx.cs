using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Popupbootstrap_Popupbootstrap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://getbootstrap.com/docs/5.0/components/modal/
        //https://www.w3schools.com/bootstrap4/bootstrap_modal.asp
        // Add this property on popup button when you want to popup close only button click -data-backdrop="static" data-keyboard="false"
        //https://tutorialdeep.com/knowhow/prevent-closing-bootstrap-modal/     // static popup model site link
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string UserName = "";
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();
        string query = "select * from tbllogin where loginid= '" + txtuser.Text + "' and password='" + txtpsw.Text + "'";

        SqlCommand y = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(y);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            UserName = dt.Rows[0]["username"].ToString();
            Session["name"] = UserName;
            Response.Redirect("~/Fileupload.aspx");
            Session.RemoveAll();

        }
        else
        {
            Response.Redirect("Errorpage.aspx");
        }
        Response.Redirect("~/popup.aspx");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string UserName = "";
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();
        string query = "select * from tbllogin where loginid= '" + txtname.Text + "' and password='" + txtpassword.Text + "'";

        SqlCommand y = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(y);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            UserName = dt.Rows[0]["username"].ToString();
            Session["name"] = UserName;
            Response.Redirect("~/Fileupload.aspx");
            Session.RemoveAll();

        }
        else
        {
            Response.Redirect("Errorpage.aspx");
        }
        Response.Redirect("~/popup.aspx");
    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("../popup.aspx");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();
        string query = "insert into Customers values(@name,@country)";
        SqlCommand y = new SqlCommand(query, con);
        y.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = txtename.Text;
        y.Parameters.Add("@country", SqlDbType.VarChar, 50).Value = txtcountry.Text;
        y.ExecuteNonQuery();
        lblmsg.Text = "data save successfuly...";
        lblmsg.ForeColor = System.Drawing.Color.Green;
        lblmsg.Visible = true;
        con.Close();
       
    }
    public void submitdata()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();
        string query = "insert into Customers values(@name,@country)";
        SqlCommand y = new SqlCommand(query, con);
        y.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = txtename.Text;
        y.Parameters.Add("@country", SqlDbType.VarChar, 50).Value = txtcountry.Text;
        y.ExecuteNonQuery();
        lblmsg.Text = "data save successfuly...";
        lblmsg.ForeColor = System.Drawing.Color.Green;
        lblmsg.Visible = true;
        con.Close();
    }
}