using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for Prop_MstPdf_Cs
/// </summary>
public class Prop_MstPdf_Cs
{
    public Prop_MstPdf_Cs()
    {
    }
    public DataTable Dt { get; set; }
    public DataSet Ds { get; set; }
    public DataSet dsxml { get; set; }
    public int Ind { get; set; }
    public int serno { get; set; }
    public int pageid { get; set; }
    public string Pagename { get; set; }
    public string pdffilename { get; set; }
    public string linkname { get; set; }
    public int Groupid { get; set; }
    public string Pagetitle { get; set; }
    public int DisplayStatus { get; set; }
    public int DisplayOrder { get; set; }

}