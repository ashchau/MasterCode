using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Searchbox_DropdownwithCheckbox : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    List<lst> list = new List<lst>();
    businesslogic objBLogic;
    protected void Page_Load(object sender, EventArgs e)
    {
        //http://www.codingfusion.com/Post/Dropdownlist-with-checkboxes-in-asp-net
        //https://www.c-sharpcorner.com/blogs/multiselect-dropdownlist-with-checkboxes-in-asp-net-with-c-sharp-and-vb-net-using-jquery-plugin
        //https://www.aspsnippets.com/Articles/DropDownCheckBoxes-ASPNet-DropDownList-CheckBoxList-Server-control.aspx
        if(!IsPostBack)
        {
            BindFruits();
            ddlbind();
        }
    }

    protected void save_Click(object sender, EventArgs e)
    {
        string message = "";
        foreach (ListItem item in lstFruits.Items)
        {
            if (item.Selected)
            {
                //message += item.Text + " " + item.Value + "\\n";
                string name= item.Text;
                int id =Convert.ToInt32( item.Value);
                add(id, name);
            }
        }
       // ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    }
    public void add(int id,string name)
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(constr);
        con.Open();
        cmd = new SqlCommand("insert into FruitsItems values(@FruitsId,@FruitsName)", con);
        cmd.Parameters.AddWithValue("@FruitsId", id);
        cmd.Parameters.AddWithValue("@FruitsName", name);
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public void BindFruits()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(constr);
       // string query = "select * from prod";
        string query = "select prod_id, prod_name+SPACE(2)+ cast(prod_id as varchar(100)) as prod_name from prod";
        cmd = new SqlCommand(query,con);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            lstFruits.DataSource = dt;
            lstFruits.DataTextField = "prod_name";
            lstFruits.DataValueField = "prod_id";
            lstFruits.DataBind();

            ddlchoosen.DataSource = dt;
            ddlchoosen.DataTextField = "prod_name";
            ddlchoosen.DataValueField = "prod_id";
            ddlchoosen.DataBind();
            ddlchoosen.Items.Insert(0, new ListItem("Use Chosen Select", "0"));
        }
    }
    public void bulksave()
    {
        //https://www.tutorialsteacher.com/csharp/csharp-list
        https://www.c-sharpcorner.com/article/c-sharp-list/

        foreach (ListItem item in lstFruits.Items)
        {
            lst obj = new lst();
            if (item.Selected)
            {
                //message += item.Text + " " + item.Value + "\\n";
                string name = item.Text;
                int id = Convert.ToInt32(item.Value);
                obj.empid = Convert.ToInt32(item.Value);
                obj.empname = item.Text;
                list.Add( obj);
            }
        }
        //Below both loop are work properly
        //for(int i=0;i<list.Count;i++)
        //{
        //    int id = list[i].empid;
        //    string name = list[i].empname;
        //    string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        //    con = new SqlConnection(constr);
        //    con.Open();
        //    cmd = new SqlCommand("insert into FruitsItems values(@FruitsId,@FruitsName)", con);
        //    cmd.Parameters.AddWithValue("@FruitsId", id);
        //    cmd.Parameters.AddWithValue("@FruitsName", name);
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //}
        foreach (var item in list)
        {
            int id = item.empid;
            string name = item.empname;
            string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
            con = new SqlConnection(constr);
            con.Open();
            cmd = new SqlCommand("insert into FruitsItems values(@FruitsId,@FruitsName)", con);
            cmd.Parameters.AddWithValue("@FruitsId", id);
            cmd.Parameters.AddWithValue("@FruitsName", name);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    public class lst
    {
        public int empid { get; set; }
        public string empname { get; set; }
    }

    protected void btnbulksave_Click(object sender, EventArgs e)
    {
        bulksave();
    }
    public void ddlbind()
    {
        List<int> age = new List<int>();
        for(int i=18;i<100;i++)
        {
            age.Add(i);
        }
        DropDownList1.DataSource = age;
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("Select Age", "0"));
       // DropDownList1.Items.Clear(); user for clear dropdown vlaue
    }
    protected void GetList()
    {
        string selectedValues = string.Empty;
        string selectedText = string.Empty;
        foreach (ListItem li in lstFruits.Items)
        {
            if (li.Selected == true)
            {
                selectedText += "'"+ li.Text + "',";
                selectedValues += "'" + li.Value + "',";
                
            }
        }

        //char[] rmv = { ','};//char[] remove = { 'a', 'p', 'm' }; you can remove this keyword also
        // selectedText = selectedText.TrimEnd(rmv);
        //selectedText = selectedText.Remove(selectedText.Length - 1, 1); //its also work
        selectedText = selectedText.TrimEnd(',');
        lblmsg.Text = selectedValues;
        objBLogic = new businesslogic();
        dt = new DataTable();
        dt = objBLogic.Bindgrid(4,"sp_fruit", selectedText);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void btnsavestring_Click(object sender, EventArgs e)
    {
        GetList();
        //https://freefrontend.com/bootstrap-forms/
        //https://bbbootstrap.com/snippets/request-demo-form-validation-12274818
    }

}