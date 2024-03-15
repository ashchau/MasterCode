using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;
using System.Threading;
public partial class Gridview_Griddatarefreshauto : System.Web.UI.Page
{
    static string consString = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;  
    SqlConnection con = new SqlConnection(consString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    DataSet ds;
    private System.Timers.Timer timer1;
    private System.Timers.Timer timer2;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.codeproject.com/Questions/401904/How-to-refresh-an-ASP-NET-GridView-automatically
        //https://www.aspsnippets.com/Articles/Refresh-Reload-GridView-periodically-at-regular-intervals-using-AJAX-Timer-in-ASPNet-using-C-and-VBNet.aspx
        //https://stackoverflow.com/questions/36705846/c-sharp-multiple-timers-in-windows-service?answertab=trending#tab-top
        //NEWID()
        //http://www.sql-server-helper.com/tips/tip-of-the-day.aspx?tkey=92c158ad-b13a-4a3b-a14e-b493e599bbfb&tkw=uses-of-the-newid-function#:~:text=The%20NEWID()%20function%20in,random%20rows%20from%20a%20table.
        //https://database.guide/use-newid-to-create-a-unique-value-in-sql-server/
        if (!IsPostBack)
        {
            showdata();
        }
        Label1.Text = "Last Refreshed: " + DateTime.Now.ToString();
        Label2.Text = "Last Refreshed: " + DateTime.Now.ToString();
    }
    public void showdata()
    {
        da = new SqlDataAdapter("insertstudent", con);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@Ind", 2);
        dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            grdshow.DataSource = dt;
            grdshow.DataBind();
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblTime.Text = "Last Panel Refreshed: " + DateTime.Now.ToString();
        showdata();
        GridView1.Visible = false;
        grdshow.Visible = true;

    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        lbltimer.Text = "Last panel Refreshed: " + DateTime.Now.ToString();
        GridView1.Visible = true;
        grdshow.Visible = false;
        GridView1.DataBind();
    }
   
}