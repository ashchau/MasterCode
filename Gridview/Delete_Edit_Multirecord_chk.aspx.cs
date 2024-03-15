using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class Gridview_Delete_Edit_Multirecord_chk : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            this.BindGrid();
        //https://www.c-sharpcorner.com/UploadFile/rahul4_saxena/delete-multiple-records-in-Asp-Net-gridview-using-check-box/
        //https://www.aspsnippets.com/Articles/Implement-check-all-checkbox-functionality-in-ASPNet-GridView-control-using-JavaScript.aspx
        //above link is for the checkbox select all checkbox
    }
    private void BindGrid()
    {
        SqlConnection con = new SqlConnection();
        ds = new DataSet();
        con.ConnectionString = @"Data Source=dilshad; Initial Catalog=chauhan;integrated security=sspi;";
        SqlCommand cmd = new SqlCommand("SELECT * FROM EMPLOYEE", con);

        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridViewEmployee.DataSource = ds.Tables[0];
            GridViewEmployee.DataBind();
        }
    }

    protected void btnDeleteRecords_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[1] { new DataColumn("empname", typeof(string)) });


        foreach (GridViewRow row in GridViewEmployee.Rows)
        {
            if ((row.FindControl("chkSelect") as CheckBox).Checked)
            {
                int Emp_ID = Convert.ToInt32(GridViewEmployee.DataKeys[row.RowIndex].Value);
                using (SqlConnection con = new SqlConnection(@"Data Source=dilshad; Initial Catalog=chauhan; integrated security=sspi;"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM Employee WHERE empid=" + Emp_ID, con);
                    cmd.ExecuteNonQuery();
                    lblmsg.Visible = true;
                    lblmsg.Text = "Record deleted successfully...";
                    lblmsg.ForeColor = Color.Red;
                    msg = lblmsg.Text;
                    con.Close();
                }
            }
        }
        if(msg=="")
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Please Select at list one Record...";
            lblmsg.ForeColor = Color.Red;
        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Record deleted successfully...";
            lblmsg.ForeColor = Color.Red;
        }

        this.BindGrid();
    }

    protected void btncheckall_Click(object sender, EventArgs e)
    {
        CheckState(true);
    }
    public void CheckState(bool p)
    {
        foreach (GridViewRow row in GridViewEmployee.Rows)
        {
            CheckBox chkcheck = (CheckBox)row.FindControl("chkAll");
            chkcheck.Checked = p;
        }
    }
}