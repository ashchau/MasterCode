using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Change_PDF_Replacepdf2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { lbl_ErrorMsg.Text = "Select Group..."; ddl_Group.Focus(); }
    }
    private void FrmClear()
    {
        ddl_Group.SelectedIndex = 0;
        lbl_ErrorMsg.Text = "Select Group...";
    }

    private bool FrmCheck()
    {
        if (ddl_Group.SelectedIndex == 0) { lbl_ErrorMsg.Text = "Select Group..."; ddl_Group.Focus(); return false; }
        if (fl_uplod.PostedFile.FileName.ToString() == "") { lbl_ErrorMsg.Text = "Choose same Name PDF which you want to Replace..."; fl_uplod.Focus(); return false; }
        else { if ((fl_uplod.PostedFile.FileName.ToString().Substring(fl_uplod.PostedFile.FileName.ToString().LastIndexOf('.'))).ToUpper() != ".PDF") { lbl_ErrorMsg.Text = "Select PDF File Only..."; return false; } }
        return true;
    }
    protected void ddl_Group_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Group.SelectedIndex == 0) { lbl_ErrorMsg.Text = "Select Group..."; ddl_Group.Focus(); return; }
        else { fl_uplod.Focus(); lbl_ErrorMsg.Text = "Choose PDF with same Name which you want to replace..."; }
    }

    protected void btn_Add_Click(object sender, EventArgs e)
    {
        int i = 0;
        try
        {
            if (!FrmCheck()) return;
            string Path = String.Empty;
            int Condition = Convert.ToInt32(ddl_Group.SelectedValue.ToString());
            switch (Condition)
            {
                // the path should be "../../PDf/News/"  below path work fine on local server but when deploy on server then can't be able to save the file 
                case 1: Path = "~/PDf/ActByLaw/"; break;
                case 2: Path = "~/PDf/AppForm/"; break;
                case 3: Path = "~/PDf/BalSheet/"; break;
                case 4: Path = "~/PDf/BplList/"; break;
                case 5: Path = "~/PDf/Budget/"; break;
                case 6: Path = "~/PDf/eNewsLetter/"; break;
                case 7: Path = "~/PDf/MeetingMinuts/"; break;
                case 8: Path = "~/PDf/News/"; break;
                case 9: Path = "~/PDf/NitTender/"; break;
                case 10: Path = "~/PDf/Notices/"; break;
                case 11: Path = "~/PDf/OrderCirculars/"; break;
                case 12: Path = "~/PDf/RTI/"; break;
                default: Path = "~/PDf/WardMap/"; break;
            }
            Path = Server.MapPath(Path + fl_uplod.PostedFile.FileName.ToString());
            fl_uplod.PostedFile.SaveAs(Path);
            FrmClear();
            i++;
        }
        //catch (Exception e)
        //{
        //    if (i == 0) { lbl_ErrorMsg.Text = "Sorry : Fail to PDF File Uploaded/Replaced Successfully..."; }
        //}
        finally
        {
            if (i == 0) { lbl_ErrorMsg.Text = "Sorry : Fail to PDF File Uploaded/Replaced Successfully..."; }
            else lbl_ErrorMsg.Text = "PDF File Uploaded/Replaced Successfully...";
        }
    }

    protected void btn_Clear_Click(object sender, EventArgs e)
    {
        FrmClear();
    }
}