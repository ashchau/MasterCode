using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Change_PDF_ReplacePDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddl_PageName_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblError.Text = "";
    }

    protected void btt_add_Click(object sender, EventArgs e)
    {
        if (ddl_PageName.SelectedIndex == 0)
        {
            lblError.Text = "Please selct Page Name";
            return;
        }
        //if (txt_LnkNm.Text == "" && Convert.ToInt32(ddl_PageName.SelectedIndex) < 8)
        //{
        //    lblError.Text = "Please Insert Link Name";
        //    return;
        //}
        if (Flupload.FileName.ToString() == "")
        {
            lblError.Text = "Please Browse PDF File to Upload";
            return;
        }
        lblError.Text = "";
        UploadData();
    }

    protected void btt_Clear_Click(object sender, EventArgs e)
    {
        lblError.Text = ""; Clear();
    }

    protected void btt_Exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("SelecttypeNew.aspx");
    }
    public void UploadData()
    {
        int i = Convert.ToInt32(ddl_PageName.SelectedValue);
        //string LinkName = txt_LnkNm.Text;  
        string PdfFileName = Flupload.FileName.ToString();
        //bl_obj = new buisenesslogic();
        string path;
        if (i == 99 || i == 100) path = Server.MapPath("../../PDF/Others/" + PdfFileName); //("~/PDF/Others/" + PdfFileName); remove this on 02/03/2022
        else if (i == 101) path = Server.MapPath("../../PDF/NitTender/" + PdfFileName);
        else if (i == 102) path = Server.MapPath("../../PDF/BalSheet/" + PdfFileName);
        else if (i == 103) path = Server.MapPath("../../PDF/Budget/" + PdfFileName);
        else if (i == 104) path = Server.MapPath("../../PDF/ImpNotices/" + PdfFileName);
        else if (i == 105) path = Server.MapPath("../../PDF/NEWS/" + PdfFileName);
        else path = Server.MapPath("../../PDF/Auction_MM_RTI_Act_Etc_PDF/" + PdfFileName);

        Flupload.PostedFile.SaveAs(path);
        lblError.Text = "PDF Replace Successfully for : " + ddl_PageName.SelectedItem;
        Clear();
    }
    public void Clear()
    {
        ddl_PageName.SelectedIndex = 0;
        //ddl_Status.SelectedIndex = 0;
        //txt_LnkNm.Enabled = true;
        //txt_LnkNm.Text = "";
        ddl_PageName.Focus();
    }
}