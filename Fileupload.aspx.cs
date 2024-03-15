using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Threading.Tasks;
using System.Configuration;

public partial class Fileupload : System.Web.UI.Page
{
    int id = 1;
    SqlConnection con;
    SqlCommand cmd;
    string fpath = "";
    businesslogic objbl;
    DataSet ds;
    decimal imgsize;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            showimgage();
            Getnews();
            bindlist();
            bindgrd1();
            BindddlwithSqlreader();
        }
        //lblusername.Text = Session["username"].ToString();
    }
    #region Image upload and PDF link download tables and links
    //create table prod(prod_id int primary key identity(1,1), prod_name varchar(100),prod_price int, prod_imgpath varchar(100))
    //https://tutorial.techaltum.com/how-to-upload-image-in-asp.net.html
    //create table tblpdf(id int identity(1,1) primary key, name varchar(50),salary decimal (18,0),city varchar(50),pdfname varchar(100))
    //https://stackoverflow.com/questions/21243070/how-to-add-hyperlink-to-boundfield-in-gridview-c-sharp-asp-net
    //Login form model
    //https://www.w3schools.com/howto/howto_css_login_form.asp
    #endregion
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/Resume/") + FileUpload1.FileName);
            Image1.ImageUrl = "~/Resume/" + FileUpload1.FileName;
            lblmsg.Text = "Image Uploaded Successfully !!";
            lblmsg.ForeColor = Color.Green;
            lblmsg.Visible = true;
        }
        else
        {
            lblmsg.Text = "Select image first !!";
        }
    }
    protected void ValidateFileSize(object sender, ServerValidateEventArgs e)
    {
        // How to get image size 
        //https://www.aspsnippets.com/Articles/Validate-Check-File-Size-in-KB-Dimensions-Height-and-Width-of-an-Image-using-CustomValidator-in-ASPNet-using-C-and-VBNet.aspx
        //https://www.aspdotnet-suresh.com/2010/12/how-to-restrict-size-of-upload-file-in.html
        System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
        int height = img.Height;
        int width = img.Width;


        imgsize = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);
        if (imgsize<=1024)
        {
           
            lblsize.Text = imgsize + " KB";
        }
        else
        {
            imgsize = Math.Round(((decimal)imgsize / (decimal)1024), 2);
            lblsize.Text = imgsize + " MB";
        }
        if (imgsize > 100)
        {
           // CustomValidator1.ErrorMessage = "File size must not exceed 100 KB.";
            e.IsValid = false;
        }
        if (height > 100 || width > 100)
        {
            //CustomValidator1.ErrorMessage = "Height and Width must not exceed 100px.";
            e.IsValid = false;
        }
    }
    protected void btnimgupload_Click(object sender, EventArgs e)//change EventArgs to ServerValidateEventArgs for size vali
    {
        string pr_name = txtproname.Text;
        int pr_price = Convert.ToInt32(txtprice.Text);

        //how to get the image height with and size ******start******
        //System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload2.PostedFile.InputStream);
        //int height = img.Height;
        //int width = img.Width;
        //decimal size = Math.Round(((decimal)FileUpload2.PostedFile.ContentLength / (decimal)1024), 2);
        //if (size > 100)
        //{
        //    CustomValidator1.ErrorMessage = "File size must not exceed 100 KB.";
        //   e.IsValid = false;
        //}
        //if (height > 100 || width > 100)
        //{
        //    CustomValidator1.ErrorMessage = "Height and Width must not exceed 100px.";
        //    e.IsValid = false;
        //}

        // get image size end *******

        //take virtual path to store in the database
        //string path = "~/Image/" + FileUpload2.FileName; //for showing image on image click then use the string path = "/Image/" + FileUpload2.FileName;eg. (remove ~)
        string path = "/Image/" + FileUpload2.FileName;

        //create insert query to store data
        string query = "insert into prod values('" + pr_name + "', " + pr_price + ",'" + path + "')";

        //store image in folder image. to get the absolute path we use Server.MapPath

        FileUpload2.SaveAs(Server.MapPath("Image") + "/" + FileUpload2.FileName);
        //Create connection. kindly change the conn_strig according to your system

        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();

        //create command object
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = query;
        int x = cmd.ExecuteNonQuery();
        con.Close();
        if (x > 0)
        {

            Response.Write("Item inserted Successfully");

        }
        else
        {
            Response.Write("Try Again");

        }
    }

    protected void btnshowimg_Click(object sender, EventArgs e)
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);

        //create command object
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataTable dt = new DataTable();
        da.Fill(dt);

        //bind your data to gridview
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
    #region bind dropdownlins under the gridview
    private void BindPartTypes(DropDownList _list)
    {
        //dataAccess.DbAccess objAccess = new dataAccess.DbAccess();
        //DataSet ds = new DataSet();
        //ds = objAccess.ExecDataSet("Select Charges  from ExtraCharges ", CommandType.Text, "ConStr");
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (_list != null)
            {
                _list.DataSource = ds.Tables[0];
                _list.DataTextField = "prod_name";
                _list.DataValueField = "prod_name";
                _list.DataBind();
                _list.Items.Insert(0, new ListItem("Select Visibiltiy--"));
            }

        }
        else
        {
            _list.Items.Add("NONE");

        }

    }
    #endregion

    protected void btnshow_Click(object sender, EventArgs e)
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod where prod_id='"+txtid.Text+"'";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            txtproname.Text = dt.Rows[0]["prod_name"].ToString();
            txtprice.Text = dt.Rows[0]["prod_price"].ToString();
            Image2.ImageUrl = dt.Rows[0]["prod_imgpath"].ToString();
            con.Close();
        }
    }
    public void showimgage()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod where prod_id='" +id+ "'";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lblfruitename.Text = dt.Rows[0]["prod_name"].ToString();
           // txtprice.Text = dt.Rows[0]["prod_price"].ToString();
            imgfruite.ImageUrl = dt.Rows[0]["prod_imgpath"].ToString();
            con.Close();
        }
    }

    protected void btnupdateimg_Click(object sender, EventArgs e)
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        con = new SqlConnection(conn_string);
        cmd = new SqlCommand();
        string pr_name = txtproname.Text;
        int pr_price = Convert.ToInt32(txtprice.Text);

        if(FileUpload2.FileName=="" || FileUpload2.FileName==null)
        {
           

            //pass connection and query to your command object
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "Select * from Prod where prod_id='" + txtid.Text + "'";

            //create adaptor to fill data from database
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //create datatable which holds the data
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                
                fpath = dt.Rows[0]["prod_imgpath"].ToString();
                con.Close();
            }
        }
        else
        {
            fpath = "~/Image/" + FileUpload2.FileName;
            FileUpload2.SaveAs(Server.MapPath("Image") + "/" + FileUpload2.FileName);
        }
        //create insert query to store data
        
        string query = "update prod set prod_name='" + pr_name + "', prod_price= " + pr_price + ", prod_imgpath='" +fpath+ "' where prod_id='" + txtid.Text + "' ";

        
        con.Open();

        //create command object
         cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = query;
        int x = cmd.ExecuteNonQuery();
        con.Close();
        if (x > 0)
        {

            Response.Write("Update Successfully");
            con.Close();
        }
        else
        {
            Response.Write("Try Again");

        }
    }

    protected void btnpdf_Click(object sender, EventArgs e)
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);

        //create command object
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from tblpdf";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataTable dt = new DataTable();
        da.Fill(dt);
      
        //bind your data to gridview
        GridView2.DataSource = dt;
        GridView2.DataBind();
        //below code for- when city name ="" then edit button false and show label values..
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Label str = (Label)GridView2.Rows[i].FindControl("lcity");
            if (str.Text == "")
            {
                GridView2.Rows[i].FindControl("btnedit").Visible = false;
                GridView2.Rows[i].FindControl("lblstaus").Visible = true;
            }
        }

    }

    protected void btnimgedit_Click(object sender, ImageClickEventArgs e)
    {
        //https://stackoverflow.com/questions/19620703/how-to-access-a-textbox-text-from-gridview-to-a-button-onclick-event

        GridViewRow row = (GridViewRow)((ImageButton)sender).NamingContainer;
      
        Label id = row.FindControl("lid") as Label;
        Label name = row.FindControl("lname") as Label;
        Label salary = row.FindControl("lsalary") as Label;
        Label city = row.FindControl("lcity") as Label;
        Label pdfname = row.FindControl("lpdfname") as Label;

            //Label id1 = (Label)row.FindControl("lid");
            //Label id = (Label)GridView2.Rows[0].Cells[0].FindControl("lid");
            //Label name = (Label)GridView2.Rows[0].Cells[1].FindControl("lname");
            //Label salary = (Label)GridView2.Rows[0].Cells[2].FindControl("lsalary");
            //Label city = (Label)GridView2.Rows[0].Cells[3].FindControl("lcity");
            //Label pdfname = (Label)GridView2.Rows[0].Cells[4].FindControl("lpdfname");
            txt_id.Text = id.Text;
            txt_name.Text = name.Text;
            txtsalary.Text = salary.Text;
            txtcity.Text = city.Text;
            txtpdfname.Text = pdfname.Text;
        
    }

    protected void btnimgdelete_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow row = (GridViewRow)((ImageButton)sender).NamingContainer;
        Label id = row.FindControl("lid") as Label;
        Label pdfname = row.FindControl("lpdfname") as Label;
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        string query = "delete from tblpdf where id='"+id.Text+"'";
        con.Open();
        SqlCommand cmd = new SqlCommand(query,con);
        cmd.ExecuteNonQuery();
        //below line is used for delete the pdf file from the pdf folder
        string PdfName = pdfname.Text;
        string path = Server.MapPath("~/PDF/" + PdfName);
        File.Delete(path);
        con.Close();
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
        //https://www.aspforums.net/Threads/187105/Find-TextBox-value-inside-GridView-on-Button-click-using-C-in-ASPNet/
        Button btnMessage = sender as Button;
        string id = (btnMessage.NamingContainer.FindControl("lid") as Label).Text.Trim();
        string name = (btnMessage.NamingContainer.FindControl("lname") as Label).Text.Trim();
        string salary = (btnMessage.NamingContainer.FindControl("lsalary") as Label).Text.Trim();
        string city = (btnMessage.NamingContainer.FindControl("lcity") as Label).Text.Trim();
        string pdfname = (btnMessage.NamingContainer.FindControl("lpdfname") as Label).Text.Trim();
        txt_id.Text = id;
        txt_name.Text = name;
        txtsalary.Text = salary;
        txtcity.Text = city;
        txtpdfname.Text = pdfname;
    }

    protected void btnerror_Click(object sender, EventArgs e)
    {
        Response.Redirect("contact.aspx");
    }
    public void Getnews()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from tblpdf";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count>0)
        {
            NewsData.DataSource = ds.Tables[0];
            NewsData.DataBind();
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        //all method are work last methos ba
        objbl = new businesslogic();
        //objbl.update("chauhan", "getupdate", Convert.ToInt32(txt_id.Text), txt_name.Text, Convert.ToDecimal(txtsalary.Text), txtcity.Text, txtpdfname.Text);
        //objbl.updatenew("chauhan", Convert.ToInt32(txt_id.Text), txt_name.Text, Convert.ToDecimal(txtsalary.Text), txtcity.Text, txtpdfname.Text);
       ds= objbl.Updateset("chauhan", Convert.ToInt32(txt_id.Text), txt_name.Text, Convert.ToDecimal(txtsalary.Text), txtcity.Text, txtpdfname.Text);
        Response.Write("Record updated");
    }
    public void bindlist()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);

        //create command object
        string query = "select * from tblpdf order by name ";
        SqlCommand cmd = new SqlCommand(query,con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DropDownList1.DataSource = ds;
        DropDownList1.DataTextField = "name";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("--Select Name--","0"));//last zero is important for protectin error .
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);

        //create command object
        string query = "select * from tblpdf where id='"+DropDownList1.SelectedValue.ToString()+"' ";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if(ds.Tables[0].Rows.Count > 0)
        {
            txt_id.Text =  ds.Tables[0].Rows[0]["id"].ToString();
            txt_name.Text = ds.Tables[0].Rows[0]["name"].ToString();
            txtsalary.Text= ds.Tables[0].Rows[0]["salary"].ToString();
            txtcity.Text= ds.Tables[0].Rows[0]["city"].ToString();
            txtpdfname.Text= ds.Tables[0].Rows[0]["pdfname"].ToString();
        }
        else
        {
            txt_id.Text = " ";
            txt_name.Text = " ";
            txtsalary.Text = " ";
            txtcity.Text = " ";
            txtpdfname.Text= " ";
            Response.Write("<script>alert('Data Not found ....')</script>");

        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DropDownList editdrop = null;
        DropDownList footerdrop = null;
        if (GridView1.EditIndex == e.Row.RowIndex) //GET THE ROW TO BE EDITED
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                editdrop = (DropDownList)e.Row.Cells[3].FindControl("cmbChargE");
                BindPartTypes(editdrop);



            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                footerdrop = (DropDownList)e.Row.Cells[3].FindControl("cmbChargF");
                BindPartTypes(footerdrop);


            }

        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrd1();
    }
    public void bindgrd1()
    {
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);

        //create command object
        SqlCommand cmd = new SqlCommand();

        //pass connection and query to your command object
        cmd.Connection = con;
        cmd.CommandText = "Select * from Prod";

        //create adaptor to fill data from database
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        //create datatable which holds the data
        DataTable dt = new DataTable();
        da.Fill(dt);

        //bind your data to gridview
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrd1();
    }
   public void BindddlwithSqlreader()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblpdf"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                ddlreader.DataSource = cmd.ExecuteReader();
                ddlreader.DataTextField = "name";
                ddlreader.DataValueField = "id";
                ddlreader.DataBind();
                con.Close();
            }
        }
        ddlreader.Items.Insert(0, new ListItem("--Select Customer--", "0"));
    }
}