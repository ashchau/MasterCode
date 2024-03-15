using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImportExport_Uploadandshowimg : System.Web.UI.Page
{
    static string consString = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;  //scheme  Conn_JaipurMcDB
    SqlConnection con = new SqlConnection(consString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            imgiframe.Src = null;
            BindGrid();
        }
        imgiframe.Src = null;
    }

    protected void btnuploadimg_Click(object sender, EventArgs e)
    {
       
    }

    protected void btnshowimg_Click(object sender, EventArgs e)
    {
        imgiframe.Src = "../images/Ashok.png";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="U")
        {
            int rowind = Convert.ToInt32(e.CommandArgument.ToString());
            FileUpload file = (FileUpload)GridView1.Rows[rowind].FindControl("FileUpload2");
            Label lblid = (Label)GridView1.Rows[rowind].FindControl("lblserno");
        }
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;  
        using (SqlConnection con = new SqlConnection(constr))
        {
            cmd = new SqlCommand("sp_SchemeAllotment", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ind", 1);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            // using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM tblscheme", con))//loccal database table
            //using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM SchemeAllotment", con))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                   
                }
            }
        }

        //Required for jQuery DataTables to work.
        GridView1.UseAccessibleHeader = true;
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    private void BindGrid1()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            cmd = new SqlCommand("sp_SchemeAllotment", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ind", 1);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        Label str = (Label)GridView1.Rows[i].FindControl("lblmap");
                        dt.Rows[i]["workdetail"] = dt.Rows[i]["workdetail"].ToString().Substring(0, 20);
                        if (str.Text == "AllotmentList.pdf")
                        {
                            GridView1.Rows[i].FindControl("HyperLink2").Visible = false;
                            GridView1.Rows[i].FindControl("lblstaus").Visible = true;
                        }
                    }
                }
            }
        }

       
    }
}