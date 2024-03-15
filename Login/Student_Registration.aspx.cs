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
public partial class Login_Student_Registration : System.Web.UI.Page
{
    public string constr;
    public SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter sqlda;
    DataTable dt;
    string msg;
    string exist = "Student Already Exists...";
    string fail = "Student Registration Fail...";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            lblusername.Text = Session["username"].ToString();
        }
        else
        {
            Response.Redirect("/login/Dashbord.aspx");
        }
        constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        con = new SqlConnection(constr);
        bind();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        dt = new DataTable();
        sqlda = new SqlDataAdapter("SP_registration", con);
        sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlda.SelectCommand.Parameters.AddWithValue("@Ind", 5);//1
        sqlda.SelectCommand.Parameters.AddWithValue("@fname", fsname.Value);
        sqlda.SelectCommand.Parameters.AddWithValue("@lname", lsname.Value);
        sqlda.SelectCommand.Parameters.AddWithValue("@frname", fathername.Value);
        sqlda.SelectCommand.Parameters.AddWithValue("@mobileno", mobileno.Value);
        sqlda.SelectCommand.Parameters.AddWithValue("@emailid", emailid.Value);
        sqlda.SelectCommand.Parameters.AddWithValue("@loginid", loginid.Value);
        sqlda.SelectCommand.Parameters.AddWithValue("@password", pws.Value);
        sqlda.SelectCommand.Parameters.AddWithValue("@entrydate", entyrdate.Value);
        sqlda.Fill(dt);
        msg = dt.Rows[0][0].ToString();
        if(msg==exist)
        {
            lblmsg.Text = msg;
            lblmsg.ForeColor = Color.Red;
            return;
        }
        else if(msg==fail)
        {
            lblmsg.Text = msg;
            lblmsg.ForeColor = Color.Red;
            return;
        }
        else
        {
            if(dt.Rows.Count>0)
            {
                lblmsg.Text = "Record Inserted Succesfully into the Database";
                lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                bind();
            }
            else
            {
                lblmsg.Text = "Registration fail...";
                lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                bind();
            }
        }
        //int k = cmd.ExecuteNonQuery();
        //if (k != 0)
        //{
        //    lblmsg.Text = "Record Inserted Succesfully into the Database";
        //    lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
        //}
        con.Close();
    }
    public void bind()
    {
        constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        con = new SqlConnection(constr);
        con.Open();
        cmd = new SqlCommand("SP_registration", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Ind", 2);
        sqlda = new SqlDataAdapter(cmd);
        dt = new DataTable();
        sqlda.Fill(dt);
        if(dt.Rows.Count>0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
       
        con.Close();
    }

    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("/login/Student_Registration.aspx");
    }
}