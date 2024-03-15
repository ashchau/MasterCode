using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class UI_Static_orgchart : System.Web.UI.Page
{
    DataSet ds;
    businesslogic objbl;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Organization Charts";
        Getstaticpage();
       // lblcharname.Text = "ORGANIZATION CHARTS";
    }
    private void Getstaticpage()
    {
        // source get from this --database - bk_bikanerdb  sp - GetPageContentByID table-bikaner_PageText   (Homepage-- Organization Chart)
        int pageid;
        pageid = Convert.ToInt16(Request.QueryString["Pageid"]); //this pageid come from Fileupload.aspx page.
        ds = new DataSet();
        // objbl = new businesslogic();
        // ds = objbl.GetMessage(pageid);
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM bikaner_PageText WHERE PageID = '"+pageid+"'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblcharname.Text = ds.Tables[0].Rows[0]["pagetitle"].ToString();
            imgChar.ImageUrl = "../../image/BikanerChart/" + ds.Tables[0].Rows[0]["imagefile"].ToString();
        }
    }
}