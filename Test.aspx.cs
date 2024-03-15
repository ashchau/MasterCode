using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;


public partial class Test : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    DataTable dt;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {


        if(txtname.Text == "")
        {
            txtname.Focus();
            lblmsg.Visible = true;
            lblmsg.Text = "Please Enter UserName";
            return;
        }
        else
        {

        }
        if (txtaddresss.Text == "")
        {
            txtaddresss.Focus();
            lblmsg.Visible = true;
            lblmsg.Text = "Please Enter Address";
            
            return;
        }
        else
        {

        }




        string mf = "";
        if(rbmale.Checked)
        {
            mf = "Male";
        }
        else
        {
            mf = "Female";
        }

        

        string foot = "";

        if (Footbal_chk.Checked == true)
        {
            foot = "Yes";
        }
        else
        {
            foot = "No";
        }
        int no2;
        if (Crici_chk.Checked == true)
        {
            no2 = 1;
        }
        else
        {
            no2 = 0;
        }
        int no3;
        if (Chess_chk.Checked == true)
        {
            no3 = 1;
        }
        else
        {
            no3 = 0;
        }
      //  string date = txtDatePick.Text + Tm5.ToString();




        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            cmd = new SqlCommand("Sp_EntryForm", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ind", 2);
            cmd.Parameters.AddWithValue("@Name", txtname.Text);
            cmd.Parameters.AddWithValue("@Addresss", txtaddresss.Text);
            cmd.Parameters.AddWithValue("@Gender", mf);
            cmd.Parameters.AddWithValue("@Class", txtclass.Text);
            cmd.Parameters.AddWithValue("@Pincode", txtpincode.Text);
            cmd.Parameters.AddWithValue("@Age", txtage.Text);
            cmd.Parameters.AddWithValue("@Subject", txtsubt.Text);
            cmd.Parameters.AddWithValue("@Football", foot.ToString());
            cmd.Parameters.AddWithValue("@Cricket", no2);
            cmd.Parameters.AddWithValue("@Chess", no3);
            cmd.Parameters.AddWithValue("@LastDate", txtDatePicker.Text);
            cmd.Parameters.AddWithValue("@MyDate", Convert.ToDateTime(txtDatePick.Text));
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            if(ds != null && ds.Tables[0].Rows.Count > 0)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Yes!', 'Data Saved Successfulllyyy..!', 'success');", true);
            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oops!', 'Something Missing!', 'error');", true);
            }
        }
        catch
        {

        }




    }
    protected void btndelete_Click(object sender, EventArgs e)
    {

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {

    }
    protected void btnclear_Click(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static void save()
    {

    }
}