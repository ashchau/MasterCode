using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Gridview_Automaticaddrow : System.Web.UI.Page
{
    public string constr;
    public SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/Articles/Add-new-Row-to-GridView-on-Button-Click-in-ASPNet.aspx
        constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        con = new SqlConnection(constr);
        if (!IsPostBack)//if (!Page.IsPostBack)

        {

            SetInitialRow();

        }
    }
    private void SetInitialRow()

    {

        DataTable dt = new DataTable();

        DataRow dr = null;

        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));

        dt.Columns.Add(new DataColumn("Column1", typeof(string)));

        dt.Columns.Add(new DataColumn("Column2", typeof(string)));

        dt.Columns.Add(new DataColumn("Column3", typeof(string)));

        dr = dt.NewRow();

        dr["RowNumber"] = 1;

        dr["Column1"] = string.Empty;

        dr["Column2"] = string.Empty;

        dr["Column3"] = string.Empty;

        dt.Rows.Add(dr);

        //dr = dt.NewRow();



        //Store the DataTable in ViewState

        ViewState["CurrentTable"] = dt;



        Gridview1.DataSource = dt;

        Gridview1.DataBind();

    }
    private void AddNewRowToGrid()

    {

        int rowIndex = 0;



        if (ViewState["CurrentTable"] != null)

        {

            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];

            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)

            {

                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)

                {

                    //extract the TextBox values

                    TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");

                    TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");

                    TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");

                   

                    drCurrentRow = dtCurrentTable.NewRow();

                    drCurrentRow["RowNumber"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Column1"] = box1.Text;

                    dtCurrentTable.Rows[i - 1]["Column2"] = box2.Text;

                    dtCurrentTable.Rows[i - 1]["Column3"] = box3.Text;
                    
                    rowIndex++;
                    
                }
                dtCurrentTable.Rows.Add(drCurrentRow);
             
                ViewState["CurrentTable"] = dtCurrentTable;

               

                Gridview1.DataSource = dtCurrentTable;

                Gridview1.DataBind();

            }

        }

        else

        {

            Response.Write("ViewState is null");

        }



        //Set Previous Data on Postbacks

        SetPreviousData();

    }
    private void SetPreviousData()

    {

        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)

        {

            DataTable dt = (DataTable)ViewState["CurrentTable"];

            if (dt.Rows.Count > 0)

            {

                for (int i = 0; i < dt.Rows.Count; i++)

                {

                    TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");

                    TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");

                    TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");

                    box1.Focus(); //focus on current cell TextBox1

                    box1.Text = dt.Rows[i]["Column1"].ToString();

                    box2.Text = dt.Rows[i]["Column2"].ToString();

                    box3.Text = dt.Rows[i]["Column3"].ToString();



                    rowIndex++;

                }

            }

        }

    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        AddNewRowToGrid();
        //Gridview1.SelectedRow.Focus();
        //Gridview1.Rows[0].Cells[1].Controls[0].Focus();
    }



    protected void btnsearch_Click(object sender, EventArgs e)
    {
        //select ProductName from ProdcutsSold where " + "ProductName like @Search + '%'";
        //select ProductName from ProdcutsSold where ProductName like 'p' + '%';
        //select ProductName from ProdcutsSold where ProductName like @Search +'%' //@Search may be use when work with store procedure
        con.Open();
        //string query = "select ProductName from ProdcutsSold where ProductName like '"+txtsearch.Text+"' + '%'";
        string query = "select * from ProdcutsSold where ProductName like '" + txtsearch.Text + "' + '%'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //da.SelectCommand.Parameters.AddWithValue("@serch", txtsearch.Text);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
    }
}