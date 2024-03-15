using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;

public partial class GenerateTable : System.Web.UI.Page
{
    DataSet details;
    SqlDataAdapter sqlda;
    DataSet ds;
    SqlCommand cmd;
    SqlConnection con;
    string tblemp = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //ShowTable();
          
        }
        if (Request["__EVENTTARGET"] == TextBox1.Text && Request["__EVENTARGUMENT"] == "change")
        {
            Response.Redirect("DateTimePicker.aspx");
            //call textbox on change event here
        }
    }
    public DataSet GetEmpDetail()
    {

        string sqlcon = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(sqlcon);
        con.Open();
        ds = new DataSet();
        sqlda = new SqlDataAdapter("Sp_ApiCrud", con);
        sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlda.SelectCommand.Parameters.AddWithValue("@Ind", 2);
        sqlda.SelectCommand.Parameters.AddWithValue("@empid", txtid.Text);
        sqlda.Fill(ds);
        sqlda.SelectCommand.ExecuteReader();
        con.Close();
        return ds;

    }
    public void ShowTable()
    {
        details = GetEmpDetail();
        if(details.Tables[0].Rows.Count>0)
        {
            string GnrTable = "";
            decimal sal =Convert.ToDecimal( details.Tables[0].Rows[0]["salary"]);
            GnrTable = "<Table border='1' cellpadding='0' cellspacing='0' bordercolor='Red'>" +
                "<tr>" +
                "<th>Emp Id</th>" +
                "<th>Name </th>" +
                "<th>Salary</th>" +
                "<th>Mobile</th>" +
                "</tr>" +
                "<tr class='textcolor'>" +
                "<td>" + details.Tables[0].Rows[0]["empid"].ToString() + "</td>" +
                "<td width='100px' class='tabletext1'  valign='Center'>" + details.Tables[0].Rows[0]["empname"].ToString() + " </td>" +
                "<td>" + details.Tables[0].Rows[0]["salary"].ToString() + "</td>" +
                "<td>" + details.Tables[0].Rows[0]["mobile"].ToString() + "</td>" +
                "</tr>"+
                "<tr>" +
                //"<td></td>" +
                "<td colspan='2' align='left'>Total :</td>" +
                "<td colspan=''>"+sal+"</td>" +
                "</tr>"
                + " </ table >";
            lbltable.Text = GnrTable.ToString();
        }
        else
        {
            lbltable.Text = "No Record Found";
            lbltable.BackColor = System.Drawing.Color.Red;
        }
    }
    public DataSet GetLedger()
    {

        string sqlcon = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(sqlcon);
        con.Open();
        ds = new DataSet();
        sqlda = new SqlDataAdapter("Sp_ApiCrud", con);
        sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlda.SelectCommand.Parameters.AddWithValue("@Ind", 6);
        sqlda.SelectCommand.Parameters.AddWithValue("@empid", txtledger.Text);
        sqlda.Fill(ds);
        sqlda.SelectCommand.ExecuteReader();
        con.Close();
        return ds;

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        //if you want to write the tag in new line the used the + operator and every tag under the string tag "" see above example..
        ShowTable();
      
    }

    protected void btnledger_Click(object sender, EventArgs e)
    {
        GetLedger();
        //ds = new DataSet();
        if(ds.Tables[0].Rows.Count>1)
        {
            divledger.Visible = true; //divledger this is the div id 
            tblemp = "<table class='table table-bordered'>";
            tblemp +="<tr><th>Serno</th><th>Date</th><th>Year</th><th>Particular</th><th>Debit</th><th>Credit</th><th>Amount</th></tr>" + "</br>";
        }
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            //https://stackoverflow.com/questions/14978054/how-to-convert-a-date-string-dd-mm-yyyy-format-into-mm-dd-yyyy-in-asp-net-c/14978405#:~:text=string%20d%20%3D%2225%2F02%2F2012%22%3B%20DateTime,MM%2Fdd%2Fyyyy%22)%3B
            // string idate = DateTime.Parse(clinvoicedate.SelectedDate.ToString()).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            //string idate = DateTime.Parse(ds.Tables[0].Rows[i]["Vrdt"].ToString()).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture); //this is also working
            //string date =System.DateTime.Now.Date.ToString();//28/01/2022
            //string s= date = date.Substring(6, 4) + "/" + date.Substring(3, 2) + "/" + date.Substring(0, 2);
            //string s1 = date = date.Substring(0, 2) + "/" + date.Substring(3, 2) + "/" + date.Substring(6, 4);
            DateTime vdt = Convert.ToDateTime( ds.Tables[0].Rows[i]["Vrdt"]);
            string d=  string.Format("{0:dd/MM/yyyy}", vdt);
            tblemp += "<tr>";
            tblemp += "<td>" + ds.Tables[0].Rows[i]["serno"].ToString() + " </td><td>" + d.ToString()+ "</td> <td>" + ds.Tables[0].Rows[i]["MMYY"] + " </td><td>Bill</td>";
            tblemp += "<td>" + ds.Tables[0].Rows[i]["Dr"]+ "</td><td>" + ds.Tables[0].Rows[i]["Cr"]+ "</td><td>" + ds.Tables[0].Rows[i]["Amt"]+"</td>";
            tblemp += "</tr>";

            //tblemp += "<tr><td>" + ds.Tables[0].Rows[i]["serno"].ToString() + " </td><td><td> <td>" + ds.Tables[i].Rows[0]["MMYY"] + "</td><td>Bill</td><td>" + ds.Tables[0].Rows[i]["Dr"] + "</td>" + "<td>" + ds.Tables[0].Rows[i]["Cr"] + "</td><td>" + ds.Tables[0].Rows[i]["Amt"] + "</td></tr>";

            //tblemp += "</table>";
            //lblemp.Text = tblemp.ToString();
        }
        tblemp += "</table>";
        lblemp.Text=tblemp;
    }

    protected void txtFourC_TextChanged(object sender, EventArgs e)
    {
        if (txtFourC.Text.Length == 4)
        {
            //Response.Write("<script>alert('Data Not found ....')</script>");
            Response.Redirect("DateTimePicker.aspx");

        }
    }
}