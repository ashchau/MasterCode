using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
public partial class SQLParameter_SQLPrameterpass : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    string strcon = "";
    businesslogic businesslogic;
    PlEmployee plEmployee;
    string msgsuccess = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/UploadFile/718fc8/working-with-sqlparameter-class-in-ado-net/
        //https://flexiple.com/javascript/disable-button-javascript/
        strcon = ConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString();
        con = new SqlConnection(strcon);
        if (!IsPostBack)
        {
            Bindgrd();
            BindName();
            Callsqlparameter();
        }
        //https://www.c-sharpcorner.com/UploadFile/rohatash/get-out-parameter-from-a-stored-procedure-in-Asp-Net/
        //https://www.c-sharpcorner.com/article/out-parameter-in-c-sharp-7/
    }

    protected void ddlbindname_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlbindname.SelectedValue == "0")
        {
            Bindgrd();
            //return;
        }
        else
        {
            SqlParameter param = new SqlParameter("@empid", ddlbindname.SelectedValue);
            dt = new DataTable();
            dt =GetData("Sp_Employee", param, 2);
            if (dt.Rows.Count>0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
    protected void Bindgrd()
    {
        dt = new DataTable();
        SqlParameter sqlParameter = new SqlParameter("@empid",0);
        dt = GetData("Sp_Employee", sqlParameter, 1);
        if(dt.Rows.Count>0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected void BindName()
    {
        dt = new DataTable();
        SqlParameter sqlParameter = new SqlParameter("@empid", 0);
        dt = GetData("Sp_Employee", sqlParameter, 1);
        if (dt.Rows.Count > 0)
        {
            ddlbindname.DataSource = dt;
            ddlbindname.DataTextField = "empname";
            ddlbindname.DataValueField = "empid";
            ddlbindname.DataBind();
            ddlbindname.Items.Insert(0, new ListItem("--select Name--", "0"));
        }
    }
    #region Common method for bind data with sql parameter
    public DataTable GetData(string SP_Name, SqlParameter param, int Ind)
    {
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(SP_Name,con);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@Ind", Ind);
        if (param != null)
        {
            da.SelectCommand.Parameters.Add(param);
        }
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
       // con.Dispose();
        return dt;

    }
    #endregion

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        BindGridview();
    }
    protected void BindGridview()
    { 
        //https://www.c-sharpcorner.com/blogs/executereader-executenonquery-and-executescalar-in-adonet
        using (SqlConnection conn = new SqlConnection(strcon))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from emp", conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            //while (sdr.Read())
            //{
            //    lblmsg.Text= sdr.GetValue(1).ToString();
            //    string email = sdr["email"].ToString();
                
            //}
            GridView1.DataSource = sdr;
            GridView1.DataBind();
            conn.Close();
        }
    }


    protected void btnsave_Click(object sender, EventArgs e)
    {
        businesslogic = new businesslogic();
        plEmployee = new PlEmployee();
        plEmployee.Ind = 1;
        plEmployee.empname = txtname.Text;
        plEmployee.salary = Convert.ToDecimal(txtsalary.Text);
        plEmployee.mobile = txtmobile.Text;
        msgsuccess=businesslogic.InsertwithSqlparam("Sp_SqlOutParameter", plEmployee);
        if (msgsuccess == "Success")
        {
            lblmsg.Visible = true;
            lblmsg.ForeColor = Color.Green;
            lblmsg.Text = msgsuccess;
        }

        else
        {
            lblmsg.Visible = true;
            lblmsg.ForeColor = Color.Red;
            lblmsg.Text = msgsuccess;
        }
        
    }
    public void Callsqlparameter()
    {
        using (SqlConnection conn = new SqlConnection(strcon))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Sp_SqlOutParameter", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ind", 2);
            SqlDataReader sdr = cmd.ExecuteReader();
            GridView2.DataSource = sdr;
            GridView2.DataBind();
            conn.Close();
        }
    }
}