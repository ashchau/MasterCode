using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gridview_GridviewCrud : System.Web.UI.Page
{
    businesslogic GetBusinesslogic;
    DataTable dt;
    Pl_Customers pl_Customers;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gridshow();
        }
    }
    public void gridshow()
    {
        GetBusinesslogic = new businesslogic();
       
        dt = new DataTable();
        dt = GetBusinesslogic.Bindgridview("SELECT", "Customers_CRUD");
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
            lblmsg.Text ="Total Record : "+ Convert.ToString(dt.Rows.Count);
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowindex = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "E")
        {
            Label SrNo = (Label)GridView1.Rows[rowindex].FindControl("SrNo");
            //Label Cname = (Label)GridView1.Rows[rowindex].FindControl("lname");
            //Label Country = (Label)GridView1.Rows[rowindex].FindControl("lcontry");

            txtid.Text = ((Label)GridView1.Rows[rowindex].FindControl("SrNo")).Text.ToString();
            txtname.Text = ((Label)GridView1.Rows[rowindex].FindControl("lname")).Text.ToString();
            txtcountry.Text = ((Label)GridView1.Rows[rowindex].FindControl("lcontry")).Text.ToString();
            ViewState["Customerid"] = SrNo.Text.Trim();
            btnsave.Text = "Update";
            btnsave.CssClass = "btn btn-info";
        }
        else if (e.CommandName=="D")
        {
            Label Customerid = (Label)GridView1.Rows[rowindex].FindControl("SrNo");
            dt = new DataTable();
            GetBusinesslogic = new businesslogic();
            dt = GetBusinesslogic.GridviewDelete("DELETE", "Customers_CRUD", Convert.ToInt32(Customerid.Text));
            if (dt.Rows.Count > 0)
            {
                gridshow();
                Response.Write("<script>alert('Data Deleted Successfully ....')</script>");
            }
            else
            {
                Response.Write("<script>alert('Data Not Deleted....')</script>");
            }

        }
        else if (e.CommandName == "C")
        {
            Cleartxt();
            btnsave.Text = "Save";
            btnsave.CssClass = "btn btn-primary";
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        pl_Customers = new Pl_Customers();
        GetBusinesslogic = new businesslogic();
        dt = new DataTable();
        if (btnsave.Text == "Save")
        {
            pl_Customers.Name = txtname.Text;
            pl_Customers.Country = txtcountry.Text;
            dt = GetBusinesslogic.GridviewInsert("INSERT", "Customers_CRUD", pl_Customers);
            if (dt.Rows.Count > 0)
            {
                gridshow();
                Cleartxt();
                Response.Write("<script>alert('Data Inserted Successfully ....')</script>");
            }
            else
            {
                Response.Write("<script>alert('Data Insertion Failed....')</script>");
            }
        }
        else
        {
           
            pl_Customers.CustomerId =Convert.ToInt32( ViewState["Customerid"]);
            pl_Customers.Name = txtname.Text;
            pl_Customers.Country = txtcountry.Text;
            dt = GetBusinesslogic.GridviewUpdate("UPDATE", "Customers_CRUD", pl_Customers);
            if (dt.Rows.Count > 0)
            {
                gridshow();
                Cleartxt();
                btnsave.Text = "Save";
                btnsave.CssClass = "btn btn-primary";
                Response.Write("<script>alert('Data Updated Successfully ....')</script>");
            }
            else
            {
                Response.Write("<script>alert('Data Updation Fail....')</script>");
            }
        }
    }
    public void Cleartxt()
    {
        txtid.Text = txtname.Text = txtcountry.Text = "";
    }

    protected void btnclear_Click(object sender, EventArgs e)
    {
        Cleartxt();
        btnsave.Text = "Save";
        btnsave.CssClass = "btn btn-primary";
    }
}