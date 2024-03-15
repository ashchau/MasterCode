using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CrudOperation : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    void BindGrid()
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        cmd = new SqlCommand("sp_datatentry", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", 1);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        if (dt != null && dt.Rows.Count > 0)
        {
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }
        else
        {
            Gridview1.DataSource = null;
            Gridview1.DataBind();
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        cmd = new SqlCommand("sp_datatentry", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", 2);
        cmd.Parameters.AddWithValue("@id", txtid.Text);
        cmd.Parameters.AddWithValue("@name", txtname.Text);
        cmd.Parameters.AddWithValue("@surname", txtsurname.Text);
        cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@pincore", txtpincode.Text);
        cmd.Parameters.AddWithValue("@Todaydate", Convert.ToDateTime(TxtDatepicler.Text.ToString()));
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            lblmsg.Text = "Data Saved Sucessfully.....";
            lblmsg.Visible = true;
            BindGrid();
            Clear();
        }
        else
        {
            lblmsg.Text = "Data Insertion Failed....";
            lblmsg.Visible = true;
        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        cmd = new SqlCommand("sp_datatentry", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", 3);
        cmd.Parameters.AddWithValue("@id", txtid.Text);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            lblmsg.Text = "Data Deleted Sucessfully.....";
            lblmsg.Visible = true;
            BindGrid();
            Clear();
        }
        else
        {
            lblmsg.Text = "Data Deletion Failed....";
            lblmsg.Visible = true;
        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        
    }

    void Clear()
    {
        txtid.Text = "";
        txtname.Text = "";
        txtsurname.Text = "";
        txtmobile.Text = "";
        txtAddress.Text = "";
        txtpincode.Text = "";
        TxtDatepicler.Text = "";
    }

    protected void btnclear_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void Gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void Gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void Gridview1_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}