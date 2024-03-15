using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Pl_lotterydoc
/// </summary>
public class Pl_lotterydoc
{
    public Pl_lotterydoc()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Ind { get; set; }
    public int clientid { get; set; }
    public string clientname { get; set; }
    public int docid { get; set; }
    public string virtualpath { get; set; }
    public string physicalpath { get; set; }
    public string uploadfilename { get; set; }
    public DataTable dtDocImagePhoto = new DataTable();

}