using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Fileuploaddatashow : System.Web.UI.Page
{
    //this page link to Fileupload.aspx page.
    protected void Page_Load(object sender, EventArgs e)
    {

        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);

        //create command object
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from tblpdf where id ='"+ Request.QueryString["id"].ToString() + "'";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataTable dt = new DataTable();
        da.Fill(dt);

        //bind your data to gridview
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}