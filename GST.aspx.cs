using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class GST : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Item"), new DataColumn("Price") });
        dt.Rows.Add("Shirt", 200);
        dt.Rows.Add("Football", 30);
        dt.Rows.Add("Bat", 22.5);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}