using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Demo : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter da;
    SqlCommand cmd;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Bindgrid();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {

        string gende = "";
        if(rb_male.Checked)
        {
            gende = "Male";
        }
        else
        {
            gende = "Female";
        }

        string foot = "";
        if(chkfootball.Checked == true)
        {
            foot = "Football";
        }
        else
        {
            foot = "Not Intrested";
        }

        string ches = "";
        if (chkchess.Checked == true)
        {
            ches = "Chess";
        }
        else
        {
            ches = "Not Intrested";
        }

        string crick = "";
        if (chkchess.Checked == true)
        {
            crick = "Cricket";
        }
        else
        {
            crick = "Not Intrested";
        }

        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            cmd = new SqlCommand("Sp_Demo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ind", 2);
            cmd.Parameters.AddWithValue("@Name", txtname.Text);
            cmd.Parameters.AddWithValue("@Surname", txtsurname.Text);
            cmd.Parameters.AddWithValue("@Address", txtaddre.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@Pincode", txtpincode.Text);
            cmd.Parameters.AddWithValue("@Gender", gende);
            cmd.Parameters.AddWithValue("@Football", foot);
            cmd.Parameters.AddWithValue("@Chess", ches);
            cmd.Parameters.AddWithValue("@Cricket", crick);
            cmd.Parameters.AddWithValue("@SubmitionDate", txtDate.Text);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            if (dt != null)
            {
                Bindgrid();
                lblmsg.Visible = true;
                lblmsg.Text = "Data Saved successful....";
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Failed......";
            }
        }
        catch (Exception)
        {            
            throw;
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {

    }
    protected void btndelete_Click(object sender, EventArgs e)
    {

    }
    protected void btnclear_Click(object sender, EventArgs e)
    {

    }
    protected void Bindgrid()
    {
        
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        cmd = new SqlCommand("Sp_Demo", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind",1);
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();
    }
}