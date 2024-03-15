using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Popupbootstrap_PopupGrdButton : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/questions/893022/Display-GridView-row-details-in-Bootstrap-modal-popup-on-LinkButton-click-using-C-and-VBNet-in-ASPNet/
        if (!IsPostBack)
        {
            getpath();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] {
            new DataColumn("student_Id")
           ,new DataColumn("Month_Name")
           ,new DataColumn("Amount")
           ,new DataColumn("IsPaid")
           ,new DataColumn("date")
           });

            dt.Rows.Add(1, "Jan", 5200, "Yes", DateTime.Now.AddDays(-263));
            dt.Rows.Add(2, "Feb", 6500, "No", DateTime.Now.AddDays(-50));
            dt.Rows.Add(3, "Mar", 7500, "", "");
            dt.Rows.Add(4, "Apr", 6333, "No", DateTime.Now.AddDays(-63));
            dt.Rows.Add(5, "Jun", 15000, "Yes", DateTime.Now.AddDays(-93));
            GridView1.DataSource = dt;
            GridView1.DataBind();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Label mname = (Label)GridView1.Rows[i].FindControl("lblMonth_Name");
                if (Convert.ToString(mname.Text) == "Jan")
                {
                    mname.Text = "January";
                    mname.ForeColor = Color.Yellow;
                }
                else
                {
                    mname.ForeColor = Color.Blue;
                }
            }

        }
    }
    protected void Display(object sender, EventArgs e)//button click event
    {
        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];

        lblstudentid.Text = (row.FindControl("lblstudent_Id") as Label).Text;
        lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
        txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;
        ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string smt = txtAmount.Text;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++) 
        {
          
            Label paystatus = (Label)GridView1.Rows[i].FindControl("lblIsPaid");
            if (Convert.ToString(paystatus.Text) == "Yes")
            {
                paystatus.Text = "Completed...";
                paystatus.ForeColor = Color.Green;
            }
            else if(Convert.ToString(paystatus.Text) == "No")
            {
                paystatus.Text = "Pending...";
                paystatus.ForeColor = Color.Red;
            }
            Label amt = (Label)GridView1.Rows[i].FindControl("lblAmount");
            if (Convert.ToInt32(amt.Text) >=6500)
            {
                //GridView1.Rows[i].FindControl("lblAmount").Visible = false;
                amt.ForeColor = Color.Red;
                // GridView1.Rows[i].FindControl("lblstaus").Visible = true;
            }
           
        }

        //foreach (GridViewRow brow in GridView1.Rows)
        //{
        //   string s1 = ((Label)brow.FindControl("lblAmount")).Text;
        //   string  s2 = ((Button)brow.FindControl("lnkBtnEdit")).Text;
        //}
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[3].Text.ToString() == "Yes")
            {
                e.Row.Cells[3].Text = "Completed ";
                e.Row.Cells[3].ForeColor = Color.LightGreen;
                e.Row.BackColor = Color.Pink;
               // Button btn = (Button)e.Row.FindControl("btnAccept");
                LinkButton btn = (LinkButton)e.Row.FindControl("lnkBtnEdit");
                btn.Enabled = false;
                btn.Style.Add("cursor","no-drop");
                btn.CssClass +=" btn btn-danger";
            }
            else if (e.Row.Cells[3].Text.ToString() == "No")
            {
                e.Row.Cells[3].Text = "Pending ";
                e.Row.Cells[3].ForeColor = Color.Red;
            }
            else
            {
                e.Row.Cells[3].Text = "Fail";
                e.Row.Cells[3].ForeColor = Color.RoyalBlue;
            }
            //it works when bind data in databind fiels not itemtemplate
         
            //if (Convert.ToInt32(e.Row.Cells[2].Text.ToString()) > 6000)
            //{
            //    e.Row.Cells[2].ForeColor = Color.Blue;
            //}
        }
    }
    public void getpath()
    {
        //HyperLink link = (HyperLink)GridView1.Rows[i].FindControl("lnkview");
        //DirectoryInfo di = new DirectoryInfo(@"E:\Ashok chauhan\Electric bill\17-June-2023_Bill.pdf");
        //FileInfo myFile = new FileInfo(@"E:\Ashok chauhan\Electric bill\17-June-2023_Bill.pdf");
        //link.NavigateUrl =di.FullName;
        string myfile = @"E:\Ashok chauhan\Electric bill\17-June-2023_Bill.pdf";
        string copfile = @"E:\Ashok chauhan\test.pdf";
        string path1= Path.GetFullPath(myfile);
        string pathToFiles = "../PDF/1.pdf"; //Server.MapPath("../PDF/1.pdf");
        lnkshow.NavigateUrl = pathToFiles;
        if (File.Exists(copfile))
        {
            File.Delete(copfile);
        }
        File.Copy(path1, @"E:\Ashok chauhan\test.pdf");
    }
}