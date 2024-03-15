using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for PlEmployee
/// </summary>
public class PlEmployee
{
    public PlEmployee()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Ind { get; set; }
    public int empid { get; set; }
    public string empname { get; set; }
    public decimal salary { get; set; }
    public string mobile { get; set; }
    public DataTable Typetable = new DataTable();
    //public DataTable Typetable { get; set; }

}