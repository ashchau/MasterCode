using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.Services;
using Newtonsoft.Json;

public partial class Clientsidevalidation_ShowDynamicImg : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlDataAdapter da;
    HtmlGenericControl htmlA;
    HtmlGenericControl htmldiv;
    HtmlGenericControl htmldiv1;
    HtmlGenericControl htmldiv2;
    HtmlGenericControl htmliTag;
    HtmlGenericControl htmlhTag;
    HtmlGenericControl htmlsubtag;
    HtmlGenericControl htmlsrc;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Getdynamicimg();
           // dynamicimgcontrol();
        }
        dynamicimgcontrol();
    }
    public DataTable Getdynamicimg()
    {
        DataTable dt = new DataTable();
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();
        string query = "select * from tbldynamicimg ";
        SqlCommand y = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(y);
        da.Fill(dt);
        if (dt.Rows.Count>0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                htmlsrc = new HtmlGenericControl("img");
                htmlA = new HtmlGenericControl("a");
                htmldiv = new HtmlGenericControl("div");
                htmldiv1 = new HtmlGenericControl("div");
                htmldiv2 = new HtmlGenericControl("div");
                htmliTag = new HtmlGenericControl("i");
                htmlhTag = new HtmlGenericControl("h4");
                htmlsubtag = new HtmlGenericControl("span");
                htmldiv2.Attributes.Add("class", "card-wrap col-md-4");
                htmlA.Attributes.Add("href", ResolveUrl(dt.Rows[i]["Linkulr"].ToString()));
                htmlA.Attributes.Add("target", "_blank");
                htmlsrc.Attributes.Add("src", dt.Rows[i]["Imgurl"].ToString());
               // htmlsrc.InnerHtml = dt.Rows[i]["Imgurl"].ToString();
                htmliTag.Attributes.Add("class", dt.Rows[i]["Icon"].ToString());
                htmlhTag.InnerText = dt.Rows[i]["Heading"].ToString();
                htmlsubtag.InnerText = dt.Rows[i]["Subheading"].ToString();
                htmlA.Controls.Add(htmlsrc);
                htmlA.Controls.Add(htmliTag);
                htmlA.Controls.Add(htmlhTag);
                htmlA.Controls.Add(htmlsubtag);
                //htmldiv1.Attributes.Add("class", "dashboard-card");
                //htmldiv1.Controls.Add(htmliTag);
                //htmldiv1.Controls.Add(htmlhTag);
                htmldiv2.Controls.Add(htmlA);
               // htmldiv2.Controls.Add(htmldiv1);
                dnyimg.Controls.Add(htmldiv2);

            }

        }
        return dt;
    }
    public void dynamicimgcontrol()
    {
        try
        {
            DataTable dt = new DataTable();
            string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
            SqlConnection con = new SqlConnection(conn_string);
            con.Open();
            string query = "select * from tbldynamicimg ";
            SqlCommand y = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(y);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    htmlsrc = new HtmlGenericControl("img");
                    htmlA = new HtmlGenericControl("a");
                    htmldiv = new HtmlGenericControl("div");
                    htmldiv1 = new HtmlGenericControl("div");
                    htmldiv2 = new HtmlGenericControl("div");
                    htmliTag = new HtmlGenericControl("i");
                    htmlhTag = new HtmlGenericControl("h4");
                    htmlsubtag = new HtmlGenericControl("span");
                    htmldiv2.Attributes.Add("class", "card-wrap col-md-4");
                    htmlA.Attributes.Add("href", ResolveUrl(dt.Rows[i]["Linkulr"].ToString()));
                    htmlA.Attributes.Add("target", "_blank");
                    htmlsrc.Attributes.Add("src", dt.Rows[i]["Imgurl"].ToString());
                    // htmlsrc.InnerHtml = dt.Rows[i]["Imgurl"].ToString();
                    htmliTag.Attributes.Add("class", dt.Rows[i]["Icon"].ToString());
                    htmlhTag.InnerText = dt.Rows[i]["Heading"].ToString();
                    htmlsubtag.InnerText = dt.Rows[i]["Subheading"].ToString();
                    htmlA.Controls.Add(htmlsrc);
                    htmlA.Controls.Add(htmliTag);
                    htmlA.Controls.Add(htmlhTag);
                    htmlA.Controls.Add(htmlsubtag);
                    //htmldiv1.Attributes.Add("class", "dashboard-card");
                    //htmldiv1.Controls.Add(htmliTag);
                    //htmldiv1.Controls.Add(htmlhTag);
                    htmldiv2.Controls.Add(htmlA);
                    // htmldiv2.Controls.Add(htmldiv1);
                    dnyimg.Controls.Add(htmldiv2);

                }

            }
        }
        catch (Exception ex)
        {

            Response.Write(ex);
        }
    }

    protected void txtsearch_TextChanged(object sender, EventArgs e)
    {
        //https://www.msdotnet.co.in/2013/12/how-to-search-related-data-from.html#.YwB1g3ZBzIU
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("Select * from tbldynamicimg where Heading like'" + txtsearch.Text + "%'", con);
        string text = ((TextBox)sender).Text;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            grdsearch.DataSource = ds.Tables[0];
            grdsearch.DataBind();
            Label2.Visible = false;

        }
        else
        {
            Label2.Visible = true;
            Label2.Text = "No Record Found";
            this.Label2.ForeColor = Color.Red;
        }
    }
    [WebMethod]
    public static List<string> GetEmployeeName(string empName)
    {
        List<string> empResult = new List<string>();
        using (SqlConnection con = new SqlConnection(@"Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Top 10 empname from employee where empname LIKE ''+@SearchEmpName+'%'";
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@SearchEmpName", empName);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    empResult.Add(dr["empname"].ToString());
                }
                con.Close();
                return empResult;
            }
        }
    }
    [WebMethod]
    public static string GetEmployeeName1(string empName)
    {
        // DataTable empResult = new DataTable();
        string _data = "";
        using (SqlConnection con = new SqlConnection(@"Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True"))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "Select * from tbldynamicimg where Heading like ''+@SearchEmpName+'%'";
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@SearchEmpName", empName);
                //SqlDataReader dr = cmd.ExecuteReader();
                //while (dr.Read())
                //{
                //    empResult.Add(dr["empname"].ToString());
                //}
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count>0)
                {
                    _data = JsonConvert.SerializeObject(dt);
                }
                con.Close();
                return _data;
            }
        }
    }
}