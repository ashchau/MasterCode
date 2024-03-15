using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Demo1 : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter da;
    SqlCommand cmd;
    DataTable dt;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bindgrid();
        }
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
    }

   
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string gen = RadioButtonList1.SelectedItem.ToString();//how to get the value of RadioButtonList1 
        string gender = "";
        if (rb_male.Checked)
        {
            gender = "Male";
        }
        else
        {
            gender = "Female";
        }
        string hby = "";
        if (chkfootball.Checked)
        {
            hby = chkfootball.Text;
        }
        if (chkchess.Checked)
        {
            hby += "," + chkchess.Text;
        }
        if (chkcricket.Checked)
        {
            hby += "," + chkcricket.Text;
        }
        else
        {
            hby = "";
        }
        //checkboxlist
        string str = "";

        for (int i = 0; i < chklist.Items.Count; i++)
        {
            if (chklist.Items[i].Selected == true)// getting selected value from CheckBox List  
            {
                //str += chklist.Items[i].Text + " ," + "<br/>"; // add selected Item text to the String .  
                str += chklist.Items[i].Text + " ," ;
            }


        }
        if (str != "")
        {
            str = str.Substring(0, str.Length - 7); // Remove Last "," from the string . 
            lbl_subject.Visible = true;
            lbl_subject.Text = "Selected Cities are <br/>" + str; // Show selected Item List by Label.  
        }
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            cmd = new SqlCommand("Sp_Demoexist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ind", 2);
            cmd.Parameters.AddWithValue("@Name", txtname.Text);
            cmd.Parameters.AddWithValue("@Surname", txtsurname.Text);
            cmd.Parameters.AddWithValue("@Address", txtaddre.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@Pincode", txtpincode.Text);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@Hobby", hby);
            cmd.Parameters.AddWithValue("@Subject", str);
            cmd.Parameters.AddWithValue("@SubmitionDate", txtDate.Text);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            if (dt != null)
            {
                Bindgrid();
                lblmsg.Visible = true;
                lblmsg.Text = "Data Saved successful....";
                clearform();
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Yes!', 'Data Saved successful....', 'success');", true);
                }
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Failed......";
            }
        }
        catch (Exception)
        {
            throw;
        }

    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        string gender = "";
        if (rb_male.Checked)
        {
            gender = "Male";
        }
        else
        {
            gender = "Female";
        }
        string hby = "";
        
       
        if (chkfootball.Checked)
        {
            hby = chkfootball.Text;
        }
       if (chkchess.Checked)
        {
            hby += "," + chkchess.Text;
        }
       if (chkcricket.Checked)
        {
            hby += "," + chkcricket.Text;
        }
           
       
        if(hby =="")
        {
            hby = Session["hobby"].ToString();
        }
        //checkboxlist
        string str = "";

        for (int i = 0; i < chklist.Items.Count; i++)
        {
            if (chklist.Items[i].Selected == true)// getting selected value from CheckBox List  
            {
                //str += chklist.Items[i].Text + " ," + "<br/>"; // add selected Item text to the String .  
                str += chklist.Items[i].Text + " ,";
            }
           

        }
        if (str != "")
        {
            str = str.Substring(0, str.Length - 7); // Remove Last "," from the string . 
            lbl_subject.Visible = true;
            lbl_subject.Text = "Selected Cities are <br/>" + str; // Show selected Item List by Label.  
        }
        else
        {
            str = Session["subject"].ToString();
        }
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("Sp_Demoexist", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ind", 3);
            cmd.Parameters.AddWithValue("@id", txtid.Text);
            cmd.Parameters.AddWithValue("@Name", txtname.Text);
            cmd.Parameters.AddWithValue("@Surname", txtsurname.Text);
            cmd.Parameters.AddWithValue("@Address", txtaddre.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@Pincode", txtpincode.Text);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@Hobby", hby);
            cmd.Parameters.AddWithValue("@Subject", str);
            cmd.Parameters.AddWithValue("@SubmitionDate", txtDate.Text);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            cmd.ExecuteNonQuery();
            if (dt != null)
            {
                Bindgrid();
                lblmsg.Visible = true;
                lblmsg.Text = "Data Saved successful....";
                clearform();
            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Failed......";
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        cmd = new SqlCommand("Sp_Demoexist", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", 4);
        cmd.Parameters.AddWithValue("@id", txtid.Text);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        if(ds.Tables[0].Rows.Count>0)//OR   if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            lblmsg.Text = "Data Deleted Sucessfully.....";
            lblmsg.Visible = true;
            Bindgrid();
            clearform();
        }
        else
        {
            lblmsg.Text = "Data Deletion Failed....";
            lblmsg.Visible = true;
        }

    }

    protected void btnclear_Click(object sender, EventArgs e)
    {
        divid.Attributes.Add("Class", "alert alert-success");
        clearform();
    }
    protected void Bindgrid()
    {

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        cmd = new SqlCommand("Sp_Demoexist", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", 1);
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();
    }
    public void clearform()
    {
        txtname.Text = "";
        txtsurname.Text = "";
        txtaddre.Text = "";
        txtmobile.Text = "";
        txtpincode.Text = "";
        txtDate.Text = "";
        txtid.Text = "";
        rb_female.Checked = false;
        rb_male.Checked = false;
        // chklist.SelectedItem.Text = "";
        for (int items = 0; items < chklist.Items.Count; items++)
        {
            chklist.ClearSelection();
        }
        chkchess.Checked = false;
        chkcricket.Checked = false;
        chkfootball.Checked = false;
      
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bindgrid();
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
        lbl_subj.Visible = true; ;
        lbl_hobby.Visible = true;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        con.Open();
        cmd = new SqlCommand("Sp_Demoexist", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind",5);
        cmd.Parameters.AddWithValue("@Id", txtid.Text);
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        dt = new DataTable();
        da.Fill(dt);
        if (dt !=null)
        {
            txtname.Text = dt.Rows[0]["name"].ToString();
            txtsurname.Text = dt.Rows[0]["surname"].ToString(); 
            txtaddre.Text = dt.Rows[0]["Address"].ToString();
            txtmobile.Text = dt.Rows[0]["Mobile"].ToString();
            txtpincode.Text = dt.Rows[0]["Pincode"].ToString();
            string gender = dt.Rows[0]["Gender"].ToString();
            if (gender == "Male")
            {
                rb_male.Checked = true;
            }
            else
            {
                rb_female.Checked = true;
            }
            lbl_hobby.Text = dt.Rows[0]["Hobby"].ToString();
            lbl_hobby.Visible = true;
            Session["hobby"] = lbl_hobby.Text;
            lbl_subj.Text = dt.Rows[0]["Subject"].ToString();
            lbl_subj.Visible = true;
            Session["subject"] = lbl_subj.Text;
            txtDate.Text = dt.Rows[0]["SubmitionDate"].ToString();
          

            //lblmsg.Visible = true;
            //lblmsg.Text = "Data Saved successful....";

        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Failed......";
        }


        con.Close();

    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        string[] validFileTypes = {"pdf", "bmp", "gif", "png", "jpg", "jpeg", "docx", "xls" };
        string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
        bool isValidFile = false;
        for (int i = 0; i < validFileTypes.Length; i++)
        {
            if (ext == "." + validFileTypes[i])
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Invalid File. Please upload a File with extension " + string.Join(",", validFileTypes);
        }
        else
        {
            int fileSize = FileUpload1.PostedFile.ContentLength;
            if (fileSize > 2097152)
            {
                Label1.Text = "Maximum size 2(MB) exceeded ";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                FileUpload1.SaveAs(Server.MapPath("~/Resume/" + FileUpload1.FileName));
                Label1.Text = "File Uploaded successfully";
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            //Label1.ForeColor = System.Drawing.Color.Green;
            //Label1.Text = "File uploaded successfully."; 
        }
    }
}