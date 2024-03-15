using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.ComponentModel;
public partial class Clientsidevalidation_ddlrdbchk : System.Web.UI.Page
{
    SqlConnection mycn;
    SqlDataAdapter myda;
    DataSet ds;
    String strConn;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/article/working-with-dropdownlist-and-listbox-controls-in-Asp-Net/
        BindCategory();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {

    }
    public void BindCategory()
    {
        strConn = "Data Source=dilshad;integrated security=sspi;Initial Catalog=chauhan";
        mycn = new SqlConnection(strConn);
        myda = new SqlDataAdapter("Select * FROM tblcategory ", mycn);
        ds = new DataSet();
        myda.Fill(ds, "Table");//"Table" is user defined name for the bind data table name , bydefault table name is Tables
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataTextField = ds.Tables[0].Columns["CategoryName"].ColumnName.ToString();
        DropDownList1.DataValueField = ds.Tables[0].Columns["CategoryId"].ColumnName.ToString();
        
        DropDownList1.DataBind();
        //DropDownList1.Items.Insert(0, new ListItem("<--Select Items-->", "0"));
        for (int i = 0; i < DropDownList1.Items.Count; i++)
        {
           // DropDownList1.Items[i].Attributes.Add("style", "color:" + ds.Tables[0].Rows[i]["CategoryColor"].ToString());//used for font color only.
            DropDownList1.Items[i].Attributes.Add("style", "background-color:" + ds.Tables[0].Rows[i]["CategoryColor"].ToString());
        }
        DropDownList1.Items.Insert(0, new ListItem("<--Select Items-->", "0"));
        DropDownList1.Items[0].Attributes.Add("style", "color:" + ds.Tables[0].Rows[0]["CategoryColor"].ToString());
    }
}