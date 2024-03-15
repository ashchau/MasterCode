using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
public partial class CRUD_RegistrationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
        //lblmsg.Text = "";
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel1.Visible = false;
        lblmsg.Text = "";
        //if (FileUpload1.HasFile)
        //{
        //    FileUpload1.SaveAs(Server.MapPath("~/Resume/") + FileUpload1.FileName);
        //    Image1.ImageUrl = "~/Resume/" + FileUpload1.FileName;
        //    lblmsg.Text = "Image Uploaded Successfully !!";
        //    lblmsg.ForeColor = Color.Green;
        //    lblmsg.Visible = true;
        //}
        //else
        //{
        //    lblmsg.Text = "Select image first !!";
        //}

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
        string add=  txtaddress.Text;
       string nm= txtfname.Text;
       string st= txtstate.Text;
        string fname = txtfname.Text;
    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
         if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/Resume/") + FileUpload1.FileName);
            Image1.ImageUrl = "~/Resume/" + FileUpload1.FileName;
            img1.Src= "~/Resume/" + FileUpload1.FileName;
            lblmsg.Text = "Image Uploaded Successfully !!";
            lblmsg.ForeColor = Color.Green;
            lblmsg.Visible = true;
        }
        else
        {
            lblmsg.Text = "Select image first !!";
        }
    }
}