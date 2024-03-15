using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Gridview_Binddatawtdatabase : System.Web.UI.Page
{
    public static string recExist;
    public static string recExist1;
    public static int SrNo, hdnfSrNo = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            //DataTable dt = new DataTable();
            //dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Name"), new DataColumn("Country") });
            //showgridheader();
            addColumn();
            //addColumn1();
            //Session["rec"] = null;
            //ViewState["Customers"] = dt;
            SrNo = 0;
            this.BindGrid();
            
        }
        //SrNo = 0;
       
    }
    public DataTable addColumn()//this is used for maintan viewstate session and show the grid view header
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("SrNo");
        dt.Columns.Add("Name");
        dt.Columns.Add("Country");
        ViewState["Customers"] = dt;
        return dt;
    }
    public DataTable addColumn1()//this is used for maintan viewstate session and show the grid view header
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("SrNo");
        dt.Columns.Add("Name");
        dt.Columns.Add("Country");
        //ViewState["Customers"] = dt;
        //Session["rec"] = dt;
        return dt;
    }
    public void showgridheader()//this is use for show gridviw header
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("SrNo");
        dt.Columns.Add("Name");
        dt.Columns.Add("Country");
        DataRow dr = dt.NewRow();
        dt.Rows.Add(dr);
        //Session["rr"] =  dt;
        GridView1.DataSource = dt;
        GridView1.DataBind();


    }

    protected void Insert(object sender, EventArgs e)
    {
        if(txtName.Text=="" || txtCountry.Text=="")
        {
            Response.Write("<script>alert('Please fill name and country....')</script>");
            return;
        }
        else
        { 
        //DataTable dt = new DataTable();
        DataTable dt = (DataTable)ViewState["Customers"];
            //dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Name"), new DataColumn("Country") });

            DataRow dr = dt.NewRow();
            dr["SrNo"] = SrNo++;
            dr["Name"] = txtName.Text;
            dr["Country"] = txtCountry.Text;
            dt.Rows.Add(dr);


           // dt.Rows.Add(txtName.Text.Trim(), txtCountry.Text.Trim());
        ViewState["Customers"] = dt;
        this.BindGrid();
        txtName.Text = string.Empty;
        txtCountry.Text = string.Empty;
        }
    }
    protected void BindGrid()
    {
        GridView1.DataSource = (DataTable)ViewState["Customers"];
        GridView1.DataBind();
    }
    


    protected void btnedit_Click(object sender, EventArgs e)
    {
        Button btnMessage = sender as Button;
        string id = (btnMessage.NamingContainer.FindControl("lserno") as Label).Text.Trim();
        string name = (btnMessage.NamingContainer.FindControl("lname") as Label).Text.Trim();
        string country = (btnMessage.NamingContainer.FindControl("lcontry") as Label).Text.Trim();
        recExist = id;
        txtName.Text = name;
        txtCountry.Text = country;
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
       
        GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
        DataTable dt = ViewState["Customers"] as DataTable;
        dt.Rows.RemoveAt(row.RowIndex);
        ViewState["Customers"] = dt;
        BindGrid();
    }
    protected void OnCancel(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
    }

    protected void OnDelete(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/UploadFile/15208c/how-to-insert-edit-update-and-delete-records-in-gridview-wit/
        //https://www.c-sharpcorner.com/article/crud-operation-without-database-in-asp-net/
        GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
        DataTable dt = ViewState["Customers"] as DataTable;
        dt.Rows.RemoveAt(row.RowIndex);
        ViewState["Customers"] = dt;
        BindGrid();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGrid();

    }

    protected void OnUpdate(object sender, EventArgs e)
    {
        GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
        LinkButton btnMessage = sender as LinkButton;
        string name = (btnMessage.NamingContainer.FindControl("txt_name") as TextBox).Text.Trim();
        string country = (btnMessage.NamingContainer.FindControl("txt_country") as TextBox).Text.Trim();
        DataTable dt = ViewState["Customers"] as DataTable;
        dt.Rows[row.RowIndex]["Name"] = name;
        dt.Rows[row.RowIndex]["Country"] = country;

        ViewState["Customers"] = dt;
        GridView1.EditIndex = -1;
        BindGrid();
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
        Button btnMessage = sender as Button;
        string name = (btnMessage.NamingContainer.FindControl("txt_name") as TextBox).Text.Trim();
        string country = (btnMessage.NamingContainer.FindControl("txt_country") as TextBox).Text.Trim();
        DataTable dt = ViewState["Customers"] as DataTable;
        dt.Rows[row.RowIndex]["Name"] = name;
        dt.Rows[row.RowIndex]["Country"] = country;

        ViewState["Customers"] = dt;
        GridView1.EditIndex = -1;
        BindGrid();
    }

    protected void btnsaveall_Click(object sender, EventArgs e)
    {
        
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[2] {
                        new DataColumn("Name", typeof(string)),
                        new DataColumn("Country",typeof(string)) });
        //addColumn();
        foreach (GridViewRow row in GridView1.Rows)
        {
            if ((row.FindControl("CheckBox1") as CheckBox).Checked)
            {

                //int id = int.Parse(row.Cells[1].Text);
                //string name = row.Cells[1].Text;
                //string country = row.Cells[2].Text;
               // Label srno =(Label) row.FindControl("lserno");
                Label name = (Label)row.FindControl("lname");
                Label country = (Label)row.FindControl("lcontry");
                dt.Rows.Add(name.Text, country.Text);
            }
        }
        if (dt.Rows.Count > 0)
        {
            string consString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.Customers";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table
                    //sqlBulkCopy.ColumnMappings.Add("Id", "CustomerId");
                    sqlBulkCopy.ColumnMappings.Add("Name", "Name");
                    sqlBulkCopy.ColumnMappings.Add("Country", "Country");
                    con.Open();
                    sqlBulkCopy.WriteToServer(dt);
                    //below code used for clear he gridview data
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                   
                    //Session["rec"] = addColumn();
                    ViewState["Customers"] = addColumn();
                    showgridheader();//this is use for show header
                    //BindGrid();
                    SrNo = 0;
                    // Response.Redirect(Request.RawUrl);
                    con.Close();
                }
            }
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label SrNo = (Label)GridView1.Rows[e.RowIndex].FindControl("lname");
        //GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
        //DataTable dt = ViewState["Customers"] as DataTable;
        //dt.Rows.RemoveAt(row.RowIndex);
        //ViewState["Customers"] = dt;
        BindGrid();
    }

    protected void btnupdate_Click1(object sender, EventArgs e)
    {
        
        DataTable  dt = (DataTable)ViewState["Customers"];
        
        foreach (DataRow dr1 in dt.Rows)
        {
            
            if (dr1["Srno"].ToString() == recExist)
            {
                dr1["Name"] = txtName.Text;
                dr1["Country"] = txtCountry.Text;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                recExist ="hi";
               
            }
                
        }
    }
    public void clear()
    {

        txtName.Text = "";
        txtCountry.Text = "";
    }
        protected void btninsert_Click(object sender, EventArgs e)
    {
        DataTable dt = addColumn1();
        if (dt.Rows.Count == 0 && Session.Count == 0) //if (dt.Rows.Count == 0 && Session.Count == 0)
        {
            DataRow dr = dt.NewRow();
            dr["SrNo"] = SrNo++;
            dr["Name"] = txtName.Text;
            dr["Country"] = txtCountry.Text;
            dt.Rows.Add(dr);
            Session["rec"] = dt;
            GridView2.DataSource = dt;
            GridView2.DataBind();

            clear();
        }
        else
        {


            dt = (DataTable)Session["rec"];
            if (recExist == null)
            {
                DataRow dr = dt.NewRow();
                dr["SrNo"] = SrNo++;

                dr["Name"] = txtName.Text;
                dr["Country"] = txtCountry.Text;
              
                dt.Rows.Add(dr);
                GridView2.DataSource = dt;
                GridView2.DataBind();

                clear();

            }

            else
            {
                foreach (DataRow dr1 in dt.Rows)
                {
                    if (dr1["SrNo"].ToString() == recExist)
                    {
                        string sss = "find" + SrNo;
                        dr1["SrNo"] = recExist;
                        dr1["Name"] = txtName.Text;
                        dr1["Father_Name"] = txtCountry.Text;

                        //dt.Rows.Add(dr1);
                        GridView2.DataSource = dt;
                        GridView2.DataBind();

                        recExist = null;
                        clear();
                    }
                }
            }
        }
    }
}