using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
public partial class Popupbootstrap_Popupstatic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://tutorialdeep.com/knowhow/prevent-closing-bootstrap-modal/
        //https://www.aspdotnet-suresh.com/2015/05/insert-data-into-database-using-jquery-ajax-method-in-aspnet-csharp-vbnet.html
        if(!IsPostBack)
        {
            bindname();
        }
    }
    [WebMethod]
    public static string InsertData(string username, string subj, string desc)
    {
        string msg = string.Empty;
        using (SqlConnection con = new SqlConnection("Data Source=dilshad;Integrated Security=true;Initial Catalog=chauhan"))
        {
            using (SqlCommand cmd = new SqlCommand("insert into sampleinfo(name,subject,description) VALUES(@name,@subject,@desc)", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@name", username);
                cmd.Parameters.AddWithValue("@subject", subj);
                cmd.Parameters.AddWithValue("@desc", desc);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    msg = "true";
                }
                else
                {
                    msg = "false";
                }
            }
        }
        return msg;
    }
    public void bindname()
    {
        //https://meeraacademy.com/dropdownlist-control-in-asp-net/
        SqlConnection con = new SqlConnection("Data Source=dilshad;Integrated Security=true;Initial Catalog=chauhan");
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from sampleinfo",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DropDownList1.DataSource = dt;
        DropDownList1.DataBind();
        DropDownList1.DataTextField = "name";
        DropDownList1.DataValueField = "subjectid";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("<--Select Name-->", "0"));

        con.Close();
    }

    protected void btnaspsave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection("Data Source=dilshad;Integrated Security=true;Initial Catalog=chauhan"))
        {
            using (SqlCommand cmd = new SqlCommand("insert into sampleinfo(name,subject,description) VALUES(@name,@subject,@desc)", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@name", txtname.Value);
                cmd.Parameters.AddWithValue("@subject", txtsubject.Value);
                cmd.Parameters.AddWithValue("@desc", txtbody.Value);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i >=1)
                {
                    //lblmsg.InnerText = "Details Submitted Successfully...";
                    txtname.Value = "";
                    txtsubject.Value = "";
                    txtbody.Value = "";
                    Response.Write("<script> alert('Data save successfully')</script>");
                }
                else
                {
                    //lblmsg.InnerText = "Details not save";
                    Response.Write("<script> alert('Error')</script>");
                }
            }
        }
    }
}