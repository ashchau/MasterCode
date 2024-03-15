using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
public partial class Searchbox_AutoCompleteSearchTextboxValue : System.Web.UI.Page
{
    static string consString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
    SqlConnection con = new SqlConnection(consString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindlist();
            bindddl();
        }
    }
    public void bindlist()
    {
        //https://stackoverflow.com/questions/16206993/binding-3-values-to-dropdown-list
        //SELECT CONVERT(varchar, prod_id) +' | '+ CONVERT(varchar, fruitid )as ValField, prod_name as DispField FROM prod order by ValField
        con.Open();
        string query = "SELECT stname +' | '+ stcity as ValField, stid as DispField FROM student order by ValField ";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        combobox.DataSource = ds;
        combobox.DataTextField = "ValField";
        combobox.DataValueField = "DispField";
        combobox.DataBind();
        combobox.Items.Insert(0, new ListItem("--Select Name--", "0"));//last zero is important for protectin error .
        con.Close();
    }
    public void bindddl()
    {
        //https://www.c-sharpcorner.com/blogs/bind-multiple-values-from-database-dropdownlist1
        con.Open();
       string str = "select * from employeede";
        cmd = new SqlCommand(str, con);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds, "employee");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DropDownList1.Items.Add(ds.Tables[0].Rows[i]["Name"] + "-" + ds.Tables[0].Rows[i]["Address"].ToString());
        }
        DropDownList1.Items.Insert(0, new ListItem("--Select Name--", "0"));
        con.Close();
    }
    [WebMethod]
    public static List<string> SearchCustomers(string prefixText, int count)
    {
        //https://www.aspsnippets.com/Articles/AutoComplete-DropDownList-using-AJAX-in-ASPNet-with-C-and-VBNet.aspx
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Name from Customers where Name like @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["Name"].ToString());
                    }
                }
                conn.Close();

                return customers;
            }
        }
    }

    protected void btnsavelistitems_Click(object sender, EventArgs e)
    {
        //string[] values = combobox.SelectedValue.Split('|');
        if(combobox.SelectedIndex==0)
        {

        }
        else
        {
            string[] values = combobox.SelectedItem.Text.Split('|');
            string name = values[0];
            string state = values[1];
        }
        
        string[] val = DropDownList1.SelectedItem.Text.Split('-');
        string empname = val[0];
        string Address = val[1];
        //Response.Write(values[0]);
        //Response.Write(values[1]);
    }
}