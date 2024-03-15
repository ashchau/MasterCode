using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Bulkrowinsert2 : System.Web.UI.Page
{
    public string constr;
    public SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AddDefaultFirstRecord();
        }
        //https://www.c-sharpcorner.com/UploadFile/0c1bb2/insert-bulk-records-into-database-using-Asp-Net-C-Sharp/
        //https://www.codeproject.com/Questions/793864/Calling-a-JavaScript-method-in-Csharp-button-Click
    }
    public void connection()
    {
        //Stoting connection string   
        constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        con = new SqlConnection(constr);
        con.Open();

    }
    protected void AddProduct_Click(object sender, EventArgs e)
    {
        AddNewRecordRowToGrid();
        TextBox1.Text = ""; TextBox2.Text = ""; TextBox3.Text = ""; TextBox4.Text = "";
    }
    private void AddDefaultFirstRecord()
    {
        //creating DataTable  
        DataTable dt = new DataTable();
        DataRow dr;
        dt.TableName = "ProductsSold";
        //creating columns for DataTable  
        dt.Columns.Add(new DataColumn("ProductName", typeof(string)));
        dt.Columns.Add(new DataColumn("BrandName", typeof(string)));
        dt.Columns.Add(new DataColumn("Warrenty", typeof(int)));
        dt.Columns.Add(new DataColumn("Price", typeof(double)));
        dr = dt.NewRow();
        dt.Rows.Add(dr);

        ViewState["ProductsSold"] = dt;
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    private void AddNewRecordRowToGrid()
    {
        if (ViewState["ProductsSold"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["ProductsSold"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {

                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {

                    //Creating new row and assigning values  
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["ProductName"] = TextBox1.Text;
                    drCurrentRow["BrandName"] = TextBox2.Text;
                    drCurrentRow["Warrenty"] = Convert.ToInt32(TextBox3.Text);
                    drCurrentRow["Price"] = Convert.ToDouble(TextBox4.Text);

                }
                //Removing initial blank row  
                if (dtCurrentTable.Rows[0][0].ToString() == "")
                {
                    dtCurrentTable.Rows[0].Delete();
                    dtCurrentTable.AcceptChanges();

                }

                //Added New Record to the DataTable  
                dtCurrentTable.Rows.Add(drCurrentRow);
                //storing DataTable to ViewState  
                ViewState["ProductsSold"] = dtCurrentTable               ;
                //binding Gridview with New Row  
                GridView1.DataSource = dtCurrentTable;
                GridView1.DataBind();
            }
        }
    }
    protected void btnsubmitProducts_Click(object sender, EventArgs e)
    {
        
        BulkInsertToDataBase();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "a", "<script>alert('Save data successfully')</script>");
        AddDefaultFirstRecord();//for empty the gridview1 after save the records.
    }
    private void BulkInsertToDataBase()
    {
        DataTable dtProductSold = (DataTable)ViewState["ProductsSold"];
        connection();
        //creating object of SqlBulkCopy  
        SqlBulkCopy objbulk = new SqlBulkCopy(con);
        //assigning Destination table name  
        objbulk.DestinationTableName = "ProdcutsSold";
        //Mapping Table column  
        objbulk.ColumnMappings.Add("ProductName", "ProductName");
        objbulk.ColumnMappings.Add("BrandName", "BrandName");
        objbulk.ColumnMappings.Add("Warrenty", "Warrenty");
        objbulk.ColumnMappings.Add("Price", "Price");
        //inserting bulk Records into DataBase   
        objbulk.WriteToServer(dtProductSold);
    }
}