using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gridview_DropdownUnderGridview : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/Articles/How-to-bind-data-to-DropDownList-in-GridView-in-ASPNet.aspx
        //https://www.c-sharpcorner.com/UploadFile/009464/use-dropdownlist-in-gridview-in-Asp-Net-using-C-Sharp/
        //https://www.aspdotnet-suresh.com/2012/05/bind-data-to-dropdownlist-in-gridview.html
        if (!IsPostBack)
        {
            bindgrd1();
            GridView2.DataSource = GetData("select * from EmployeeDe");
            GridView2.DataBind();
        }
        lblmsg.Text = sum1(20).ToString();
    }


    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrd1();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrd1();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DropDownList editdrop = null;
        DropDownList footerdrop = null;
        string nm = "Select Visibiltiy--";
        if (GridView1.EditIndex == e.Row.RowIndex) //GET THE ROW TO BE EDITED
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                editdrop = (DropDownList)e.Row.Cells[3].FindControl("cmbChargE");
                Label lblname = (Label)e.Row.Cells[1].FindControl("Label1");
                BindPartTypes(editdrop,lblname.Text);
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                footerdrop = (DropDownList)e.Row.Cells[3].FindControl("cmbChargF");
                //Label lblname = (Label)e.Row.Cells[1].FindControl("Label1");
                //BindPartTypes(footerdrop, lblname.Text);
            }

        }
    }
    public void bindgrd1()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
      
    }
    #region bind dropdownlins under the gridview
    private void BindPartTypes(DropDownList _list,string lblname)
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (_list != null) 
            {
                _list.DataSource = ds.Tables[0];
                _list.DataTextField = "prod_name";
                _list.DataValueField = "prod_name";
                _list.SelectedValue = lblname;
                _list.DataBind();
                _list.Items.Insert(0, new ListItem("Select Visibiltiy--"));
            }

        }
        else
        {
            _list.Items.Add("NONE");

        }

    }
    #endregion

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            DropDownList ddlCountries = (e.Row.FindControl("ddlCountries") as DropDownList);
            ddlCountries.DataSource = GetData("SELECT DISTINCT Address,Id from EmployeeDe");
            ddlCountries.DataTextField = "Address";
            ddlCountries.DataValueField = "Id";
            ddlCountries.DataBind();
            //Add Default Item in the DropDownList
            ddlCountries.Items.Insert(0, new ListItem("Please select"));
            //Select the Country of Customer in DropDownList
            string country = (e.Row.FindControl("lblCountry") as Label).Text;
            // ddlCountries.Items.FindByValue(country).Selected = true;    //if DataValueField = "Address"; then used it
            ddlCountries.Items.FindByText(country).Selected = true; //if DataValueField = "Id"; then used it
        }
    }
    private DataSet GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds);
                    return ds;
                }
            }
        }
    }
}
public partial class Gridview_DropdownUnderGridview
{
    //partial class example
    public int sum1(int x)
    {
        return x;
    }
}
public partial class Gridview_DropdownUnderGridview
{
    //partial class example
    public int sum2(int x)
    {
        return x;
    }
}