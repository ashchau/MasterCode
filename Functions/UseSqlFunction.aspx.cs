using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Functions_UseSqlFunction : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlcon = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(sqlcon);
        if(!IsPostBack)
        {
            //Bindgrid();
        }
    }
    public void Bindgrid()
    {
        con.Open();
        cmd = new SqlCommand("select * from Fun_EmployeeInformation()", con);
        //below two line code call a function by sp and above line directely call the function without sp.
        //cmd = new SqlCommand("Sp_Funemp", con);
        //cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
          if(dt.Rows.Count>0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    public void Bindgrid2()
    {
        con.Open();
        //cmd = new SqlCommand("select * from Fun_EmployeeInformation()", con);
        //below two line code call a function by sp and above line directely call the function without sp.
        cmd = new SqlCommand("Sp_EmployeeDe", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@serno", txtserno.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
            txtserno.Text = "";
        }
        else
        {
            //GridView1.DataSource = new DataTable();
            //GridView1.DataBind();
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }

    protected void btnsearh_Click(object sender, EventArgs e)
    {
        Bindgrid2();
    }
}