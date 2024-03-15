using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Bulkrowinsert3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/Customers.xml"));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }

    protected void Bulk_Insert(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id", typeof(int)),
                        new DataColumn("Name", typeof(string)),
                        new DataColumn("Country",typeof(string)) });
        foreach (GridViewRow row in GridView1.Rows)
        {
            if ((row.FindControl("CheckBox1") as CheckBox).Checked)
            {
                int id = int.Parse(row.Cells[1].Text);
                string name = row.Cells[2].Text;
                string country = row.Cells[3].Text;
                dt.Rows.Add(id, name, country);
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
                    sqlBulkCopy.ColumnMappings.Add("Id", "CustomerId");
                    sqlBulkCopy.ColumnMappings.Add("Name", "Name");
                    sqlBulkCopy.ColumnMappings.Add("Country", "Country");
                    con.Open();
                    sqlBulkCopy.WriteToServer(dt);
                    con.Close();
                }
            }
        }
    }
}