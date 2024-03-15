using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Admin_Change_PDF_changepdffile : System.Web.UI.Page
{
    businesslogic objbl;
    DataSet ds;
    string username, updatetype, filenames;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Getallpagename();
           
        }
    }

    protected void ddlPage_SelectedIndexChanged(object sender, EventArgs e)
    {  
        if (ddlPage.SelectedIndex == 0)
        {
            grdpdf.DataSource = "";
            grdpdf.DataBind();
        }
        else
        {
            fillgridforPdf();
        }
        lblError.Text = "";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        lblError.Visible = false;
        uploadPDFfile();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {

    }
 

    protected void grdpdf_ItemCreated(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem)
        {
            e.Item.Attributes.Add("OnMouseOver", "this.style.backgroundColor = '#f5f5f5';");
            e.Item.Attributes.Add("OnMouseOut", "this.style.backgroundColor = 'white';");
        }
        else if (e.Item.ItemType == ListItemType.Item)
        {
            e.Item.Attributes.Add("OnMouseOver", "this.style.backgroundColor = '#f5f5f5';");
            e.Item.Attributes.Add("OnMouseOut", "this.style.backgroundColor = 'white';");
        }
    }

    protected void grdpdf_PreRender(object sender, EventArgs e)
    {
        if (ddlPage.SelectedIndex != 0)
        {
            if (grdpdf.Items.Count > 0)
            {
                for (int i = 0; i < grdpdf.Items.Count; i++)
                {
                    if (grdpdf.Items[i].Cells[6].Text.Trim() == "2")
                    {
                        grdpdf.Items[i].Cells[1].Font.Name = "Kruti Dev 010";
                        grdpdf.Items[i].Cells[1].Font.Size = FontUnit.Larger;
                    }
                    else
                    {
                        grdpdf.Items[i].Cells[1].CssClass = "tabletextE";
                    }

                }
            }
        }
    }
    private void Getallpagename()
    {
        objbl = new businesslogic();
        ds = new DataSet();
        try
        {
            ds = objbl.GetAllpagename("bk_bikanerdb", "Bikaner_MastPdf");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlPage.DataSource = ds;
                ddlPage.DataTextField = "pagetitle";
                ddlPage.DataValueField = "pageid";
                ddlPage.DataBind();
                ddlPage.Items.Insert(0, "---Select page name---");
            }
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
    }
    private void fillgridforPdf()
    {
        objbl = new businesslogic();
        ds = new DataSet();

        try
        {

            ds = objbl.FillGridforPDF("bk_bikanerdb", "GetALLPDFfile", int.Parse(ddlPage.SelectedValue));
            if (ds.Tables[0].Rows.Count > 0)
            {
                grdpdf.DataSource = ds;
                grdpdf.DataBind();
            }
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }

    }
    private void uploadPDFfile()
    {
        int check = 0;
        try
        {
            for (int i = 0; i < grdpdf.Items.Count; i++)
            {
                FileUpload fileUpload = (FileUpload)grdpdf.Items[i].Cells[1].FindControl("Flupload");
                CheckBox chkchechtoupload = (CheckBox)grdpdf.Items[i].Cells[0].FindControl("chkupload");
                if (chkchechtoupload.Checked == true)
                {
                    if (fileUpload.HasFile)
                    {
                        string fileExt = fileUpload.PostedFile.FileName.Substring(fileUpload.PostedFile.FileName.LastIndexOf('.'), 4);
                        if (fileExt.ToUpper() == ".PDF")
                        {
                            lblError.Text = "";
                            filenames = grdpdf.Items[i].Cells[5].Text;
                            string filename = grdpdf.Items[i].Cells[5].Text;
                            string oldfilename = fileUpload.FileName.ToString();
                            string path = Server.MapPath("../../PDF/ReplacePdf/" + filename);
                            fileUpload.PostedFile.SaveAs(path);
                            Response.Write("<script language='javascript'>window.returnValue='1';</script>");
                            lblError.Visible = true;
                            lblError.Text = "File Uploaded successfully....";
                            check = 1;
                            infohistory();
                        }
                        else
                        {
                            lblError.Visible = true;
                            lblError.Text = "Upload Pdf files only.";
                            return;
                        }
                    }

                    else
                    {
                        if (check != 1)
                        {
                            lblError.Visible = true;
                            lblError.Text = "File not selected for upload";
                        }
                    }
                }
                else
                {
                    if (check != 1)
                    {
                        lblError.Visible = true;
                        lblError.Text = "Click on check box to upload the file";
                    }
                }
            }
            if (check == 1)
            {
                lblError.Visible = true;
                lblError.Text = "File Uploaded successfully....";
            }
            fillgridforPdf();
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
    }
    private void infohistory()
    {
        objbl = new businesslogic();
        username = Session["Username"].ToString();
        updatetype = "PDF";
        objbl.UpdatedPagehistory("bk_bikanerdb", "updateContentHistroy", username, int.Parse(ddlPage.SelectedValue), filenames, updatetype);
    }
}