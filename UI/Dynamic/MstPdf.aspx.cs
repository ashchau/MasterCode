using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UI_Dynamic_MstPdf : System.Web.UI.Page
{
    Prop_MstPdf_Cs Pr_MstPdfObj;
    DL_MstPdf_Cs Dl_MstPdfObj;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) FillMstPDf();
    }
    private void FillMstPDf()
    {
        Pr_MstPdfObj = new Prop_MstPdf_Cs();
        Pr_MstPdfObj.Ind = 1;
        Pr_MstPdfObj.pageid = Convert.ToInt32(Request.QueryString["Pageid"]);
        Dl_MstPdfObj = new DL_MstPdf_Cs();
        Dl_MstPdfObj.Dl_MstPdf(Pr_MstPdfObj);
        if (Pr_MstPdfObj.Ds.Tables[0].Rows.Count > 0)
        {
            lblHeader.Text = Pr_MstPdfObj.Ds.Tables[0].Rows[0]["Pagetitle"].ToString();
            lblMstPdfTbl.Text = " <table class='table table-bordered table-responsive' border='1' bordercolor='white'> <tr><td   class='headerstyle' align='center' style='background-color:#931B2f; color:white' width='40px'>S.No.</td><td  class='headerstyle' align='center' style='background-color:#931B2f; color:white'>Particulars</td><td  class='headerstyle' align='center' style='background-color:#931B2f; color:white' width='100px'>File</td></tr> ";
            for (int i = 0; i < Pr_MstPdfObj.Ds.Tables[0].Rows.Count; i++) lblMstPdfTbl.Text = lblMstPdfTbl.Text + " <tbody><tr><td> " + (i + 1) + " </td><td> " + Pr_MstPdfObj.Ds.Tables[0].Rows[i]["linkname"].ToString().ToUpper() + " </td><td> <a href='MstPdfViewer.aspx?Pageid=5&PdfName=" + Pr_MstPdfObj.Ds.Tables[0].Rows[i]["pdffilename"].ToString() + "&Header=" + Pr_MstPdfObj.Ds.Tables[0].Rows[i]["linkname"] + "' class='btn btn-info'>&nbsp;&nbsp; View &nbsp;&nbsp;</a></td></tr></tbody>";
            lblMstPdfTbl.Text = lblMstPdfTbl.Text + " </table> ";
        }
        else Response.Redirect("../../Jp_HomePagemain.aspx");
    }
}