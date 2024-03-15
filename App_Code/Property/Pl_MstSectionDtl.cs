using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for Pl_MstSectionDtl
/// </summary>
public class Pl_MstSectionDtl
{
    public Pl_MstSectionDtl()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataSet DS { get; set; }
    public DataTable DT { get; set; }
    public int ind { get; set; }
    public int prod_id { get; set; }
    public string prod_name { get; set; }
    public int prod_price { get; set; }
    public string prod_imgpath { get; set; }
}