using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gridview_BankDepositfrm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Item"), new DataColumn("Price") });
            dt.Rows.Add("Shirt", 200);
            dt.Rows.Add("Football", 30);
            dt.Rows.Add("Bat", 22.5);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        decimal amttotal = 0;
        DataTable dt = new DataTable();
        foreach (GridViewRow row in GridView1.Rows)
        {
            if ((row.FindControl("chk") as CheckBox).Checked)
            {
                //int antid = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                TextBox amtcount = (TextBox)row.FindControl("txtcount");
                int ct = Convert.ToInt32(amtcount.Text);
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
                //lbltotal.Visible = true;
                //amttotal = amttotal + sbtotal;
                //lbltotal.Text = amttotal.ToString();
            }
        }
    }
}