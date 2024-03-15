using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Searchbox_Dynamictxtlength : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        conn = new SqlConnection(constr);
        conn.Open();
        string query = "select * from employee";
        cmd = new SqlCommand(query,conn);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
             
    }
}