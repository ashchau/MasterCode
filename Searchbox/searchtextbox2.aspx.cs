using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Searchbox_searchtextbox2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/Articles/Using-jQuery-DataTables-with-GridView-in-ASPNet.aspx  // in this method Eval bind data not work
        //https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_filter_table

        //https://www.aspsnippets.com/Articles/Using-jQuery-DataTables-with-GridView-in-ASPNet.aspx
        //above link show error when add hyperlink in grid ..? then used the below link and used the class selector instead of id selector
        //https://www.aspsnippets.com/questions/200618/Solved-DataTables-warning-Non-table-node-initialisation-INPUT-in-ASPNet-GridView/
        if (!this.IsPostBack)
        {
            this.BindGrid();
        }
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM tblscheme", con))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    //below code for- when city name ="" then edit button false and show label values..
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Label str = (Label)GridView1.Rows[i].FindControl("lblmap");
                        if (str.Text == "")
                        {
                            GridView1.Rows[i].FindControl("HyperLink1").Visible = false;
                            GridView1.Rows[i].FindControl("lblstaus").Visible = true;
                        }
                    }
                }
            }
        }

        //Required for jQuery DataTables to work.
        GridView1.UseAccessibleHeader = true;
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}