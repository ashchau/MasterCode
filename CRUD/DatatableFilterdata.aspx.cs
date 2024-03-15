using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRUD_DatatableFilterdata : System.Web.UI.Page
{
    businesslogic objbl;
    DataSet ds;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_ddl();
            //BindGrid();
            //Bindgrd();
            //Bindgrd1();
            GetRowsByFilter();
        }
        //https://www.codeproject.com/Questions/370620/Filter-Using-Linq-On-datatable-with-IN-and-Not-In
    }
    protected DataTable Bind_ddl()
    {
        objbl = new businesslogic();
        dt = new DataTable();
        dt = objbl.DtGridveiw(1, "Sp_Employee");
        if (dt.Rows.Count > 0)
        {
            ddlname.DataSource = dt;
            ddlname.DataTextField = "empname";
            ddlname.DataValueField = "empid";
            ddlname.DataBind();
            ddlname.Items.Insert(0, new ListItem("Select Name", "0"));
        }
        return dt;
    }
    private void BindGrid()
    {
        objbl = new businesslogic();
        ds = new DataSet();
        ds = objbl.Bindgrd(1,"Sp_Employee");
        if (ds.Tables[0].Rows.Count > 0)
        {
            grdemp.DataSource = ds.Tables[0];
            grdemp.DataBind();
        }
        //Method 1
        string nm = "8800452620";
        var filteredRows = from n in ds.Tables[0].AsEnumerable()
                           where !n.Field<string>("mobile").Contains(nm)
                           select n;
        var tblnm = filteredRows.CopyToDataTable();
        //Method 2 using not in
        var filteredTable = (from m in ds.Tables[0].AsEnumerable()
                             where !m.Field<decimal>("salary").Equals(25000)
                             select m).CopyToDataTable();
        //Method 3 using in
        var filteredTable1 = (from k in ds.Tables[0].AsEnumerable()
                              where k.Field<decimal>("salary").Equals(25000)
                              select k).CopyToDataTable();
    }
    protected void Bindgrd()
    {
        objbl = new businesslogic();
        dt = new DataTable();
        dt = objbl.DtGridveiw(1, "Sp_Employee");
        var query = from r in dt.AsEnumerable()
                    where r.Field<string>("empname") == "Kamini"
                    select new
                    {
                        entry_id = r["empid"].ToString(), //you can write any name entry_id etc
                        cp_amount = r["empname"].ToString()
                    };
        grdemp.DataSource = query;
        grdemp.DataBind();
    }
    protected void Bindgrd1()
    {
        objbl = new businesslogic();
        dt = new DataTable();
        dt = objbl.DtGridveiw(1, "Sp_Employee");
        var query = from r in dt.AsEnumerable()
                    where r.Field<decimal>("salary") ==15000 //25000
                    select new
                    {
                        entry_id = r["empid"].ToString(),
                        cp_amount = r["empname"].ToString(),
                        Salaryamt = r["salary"].ToString()
                    };
        grdemp.DataSource = query;
        grdemp.DataBind();
    }

    protected void ddlname_SelectedIndexChanged(object sender, EventArgs e)
    {
        string ename = ddlname.SelectedItem.Value;
        DataTable dt = this.Bind_ddl();
        if (!string.IsNullOrEmpty(ename))
        {
            var customers = from emp in dt.AsEnumerable()
                            where emp.Field<int>("empid") ==Convert.ToInt32(ename)
                            select new
                            {
                                Id = emp.Field<int>("empid").ToString(),
                                Name = emp.Field<string>("empname"),
                                Mobile = emp.Field<string>("mobile")
                            };
            grdemp.DataSource = customers;
            grdemp.DataBind();
        }
        else
        {
            grdemp.DataSource = dt;
            grdemp.DataBind();
        }
    }
    private void GetRowsByFilter()
    {
        //https://www.c-sharpcorner.com/UploadFile/mahesh/insert-item-into-a-C-Sharp-list/
        objbl = new businesslogic();
        ds = new DataSet();
        ds = objbl.Bindgrd(1, "Sp_Employee");
        DataTable table = ds.Tables[0];
        // Presuming the DataTable has a column named Date.
        string expression;
        expression = "salary > 15000";
        DataRow[] foundRows;

        // Use the Select method to find all rows matching the filter.
        foundRows = table.Select(expression);
        List<emp> lm = new List<emp>();
        // Print column 0 of each returned row.
        for (int i = 0; i < foundRows.Length; i++)
        {
            //Console.WriteLine(foundRows[i][0]);
            //Response.Write(foundRows[i][0]+" "+ foundRows[i]["empname"]);
            lm.Add(new emp { empid =Convert.ToInt32(foundRows[i][0]), empname = foundRows[i][1].ToString(), salary =Convert.ToDecimal( foundRows[i][2]) });
            
        }
        grdemp.DataSource = lm;
        grdemp.DataBind();
    }
    public class emp
    {
        public int empid { get; set; }
        public string empname { get; set; }
        public decimal salary { get; set; }
    }
}