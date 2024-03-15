using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gridview_BankDepositform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindAmt();
        }
    }
    public void BindAmt()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select * from mstamountlist"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count>0)
                {
                    grdamt.DataSource = dt;
                    grdamt.DataBind();
                }
                con.Close();
            }
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        decimal amttotal = 0;
        DataTable dt = new DataTable();
        foreach (GridViewRow row in grdamt.Rows)
        {
            if ((row.FindControl("chkcheck") as CheckBox).Checked)
            {
                int antid = Convert.ToInt32(grdamt.DataKeys[row.RowIndex].Value);
                TextBox amtcount = (TextBox)row.FindControl("txtcount");
                int ct =Convert.ToInt32(amtcount.Text);
                TextBox subtotal = (TextBox)row.FindControl("txtsubtotal");
                int sbtotal = Convert.ToInt32(subtotal.Text);

                // Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
                CheckBox chkcheck = (CheckBox)row.FindControl("chkcheck");
                using (SqlConnection con = new SqlConnection(@"Data Source=dilshad; Initial Catalog=chauhan; integrated security=sspi;"))
                {
                    con.Open();
                   // SqlCommand cmd = new SqlCommand("DELETE FROM Employee WHERE empid", con);
                    //cmd.ExecuteNonQuery();
                    //lblmsg.Visible = true;
                    //lblmsg.Text = "Record deleted successfully...";
                    //lblmsg.ForeColor = Color.Red;
                    //msg = lblmsg.Text;
                    con.Close();
                }
                lbltotal.Visible = true;
                amttotal = amttotal + sbtotal;
                lbltotal.Text = amttotal.ToString();
            }
        }
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    GridView gridView = (GridView)FindControl("GridView1");
    //    if (gridView != null)
    //    {
    //        foreach (GridViewRow row in gridView.Rows)
    //        {
    //            // Retrieve values from the cells in the current row
    //            string value1 = row.Cells[0].Text;
    //            string value2 = row.Cells[1].Text;
    //            // Do something with the values, such as displaying them to the user
    //            Response.Write(value1 + " - " + value2 + "<br>");
    //        }
    //    }
    //}

}

