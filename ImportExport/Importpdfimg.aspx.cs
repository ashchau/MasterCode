using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;

public partial class ImportExport_Importpdfimg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvDetails.DataSource = BindGridviewData();
            gvDetails.DataBind();
            Binddata();
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    public void Binddata()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);

        //create command object
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataTable dt = new DataTable();
        da.Fill(dt);

        //bind your data to gridview
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected DataTable BindGridviewData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("UserId", typeof(Int32));
        dt.Columns.Add("UserName", typeof(string));
        dt.Columns.Add("Education", typeof(string));
        dt.Columns.Add("Imagepath", typeof(string));
        dt.Rows.Add(1, "Suresh Dasari", "B.Tech", "http://localhost:63913/Image/Jp_Cm.jpg");
        dt.Rows.Add(2, "Rohini Dasari", "Msc", "http://localhost:63913/Image/Jp_Cm.jpg");
        dt.Rows.Add(3, "Madhav Sai", "MS", "");
        dt.Rows.Add(4, "Praveen", "B.Tech", "");
        dt.Rows.Add(6, "Sateesh", "MD", "");
        dt.Rows.Add(7, "Mahesh Dasari", "B.Tech", "http://localhost:63913/Image/Jp_Cm.jpg");
        dt.Rows.Add(8, "Mahendra", "CA", "");
        return dt;
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Employees.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        gvDetails.AllowPaging = false;
        gvDetails.DataSource = BindGridviewData();
        gvDetails.DataBind();
        //Change the Header Row back to white color
        gvDetails.HeaderRow.Style.Add("background-color", "#FFFFFF");
        //Applying stlye to gridview header cells
        for (int i = 0; i < gvDetails.HeaderRow.Cells.Count; i++)
        {
            gvDetails.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
            gvDetails.HeaderRow.Cells[3].Style.Add("width", "200px");
        }
        gvDetails.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void showgridimg()
    {
        try
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Employees.xls"));
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            this.Binddata();
            GridView1.AllowPaging = false;
            //GridView1.DataSource = BindGridviewData();
            //gvDetails.DataBind();
            //Change the Header Row back to white color
            GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");
            //Applying stlye to gridview header cells
            for (int i = 0; i < GridView1.HeaderRow.Cells.Count; i++)
            {
                GridView1.HeaderRow.Cells[i].Style.Add("background-color", "#df5015");
            }
            GridView1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
            throw;
        }
    }

    protected void showimg_Click(object sender, EventArgs e)
    {
        showgridimg();
    }
}