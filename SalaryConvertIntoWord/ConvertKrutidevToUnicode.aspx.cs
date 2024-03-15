using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class SalaryConvertIntoWord_ConvertKrutidevToUnicode : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string constr;
    protected void Page_Load(object sender, EventArgs e)
    {
        constr = ConfigurationManager.ConnectionStrings["bkcon"].ToString();
        con = new SqlConnection(constr);
        if(!IsPostBack)
        {
            lblmsg.Text = "Hello this is ashok chauhan from Indore";
        }
    }

    protected void btnconvertunic_Click(object sender, EventArgs e)
    {
        //how to copy a text box or div ,p tag etc values on button click write on html page(.aspx)
    }


    protected void btnnews_Click(object sender, EventArgs e)
    {
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "Sp_News_Add";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@status", txtnewstatus.Text);
        cmd.Parameters.AddWithValue("@NewsSubj", txtnewssub.Text);
        cmd.Parameters.AddWithValue("@pdfname", txtnewspdf.Text);
        cmd.Parameters.AddWithValue("@lang", txtlag.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        msg.Text = "Data Insert successfully...";


    }
}