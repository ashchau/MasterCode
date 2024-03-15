using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Gridview_GridOnRowcommand : System.Web.UI.Page
{
   static string consString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
    SqlConnection con = new SqlConnection(consString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            gridshow();
        }

    }
    public  void gridshow()
    {
        con.Open();
        string query = "select * from Customers";
        da = new SqlDataAdapter(query, con);
        dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    public void clear()
    {
        txtCountry.Text = "";
        txtName.Text = "";
        ViewState["pp"] = " ";
        

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if(btnsave.Text=="Save")
        {
            //
            con.Open();
            cmd = new SqlCommand("Customers_CRUD", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "INSERT");
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            clear();
            gridshow();
            Response.Write("<script>alert('Data INSERT Successfully ....')</script>");
        }
        else if(btnsave.Text=="Update")
        {
            con.Open();
            cmd = new SqlCommand("Customers_CRUD", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "UPDATE");
            cmd.Parameters.AddWithValue("@CustomerId", ViewState["pp"]);
            cmd.Parameters.AddWithValue("@Name", txtName.Text); 
            cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            btnsave.Text = "Save";
            clear();
            gridshow();
            Response.Write("<script>alert('Data INSERT Successfully ....')</script>");
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
        btnsave.Text = "Save";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName=="D")
        {
            con.Open();
            //Label SrNo = (Label)grd1.Rows[e.RowIndex].FindControl("SrNo");
            cmd = new SqlCommand("Customers_CRUD", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "DELETE");
            cmd.Parameters.AddWithValue("@CustomerId", e.CommandArgument); 
            cmd.ExecuteNonQuery();

            con.Close();
            gridshow();
        }
        else if (e.CommandName=="E")
        {
            con.Open();
            cmd = new SqlCommand("Customers_CRUD", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "EDIT");
            cmd.Parameters.AddWithValue("@CustomerId", e.CommandArgument);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            txtName.Text = dt.Rows[0]["Name"].ToString();
            txtCountry.Text = dt.Rows[0]["Country"].ToString();
            btnsave.Text = "Update";
            ViewState["pp"] = e.CommandArgument;
            con.Close();
        }
        else
        {
            clear();
            btnsave.Text = "Save";
        }
    }
}