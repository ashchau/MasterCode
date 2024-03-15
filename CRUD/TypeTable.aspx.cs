using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class CRUD_TypeTable : System.Web.UI.Page
{
    businesslogic objblogic;
    PlEmployee plEmployee;
    DataSet ds;
    string msgsuccess = "Success";
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnsave_Click(object sender, EventArgs e)
    {
        objblogic = new businesslogic();
        plEmployee = new PlEmployee();
        plEmployee.Ind = 1;
        plEmployee.empname = txtname.Text;
        plEmployee.salary = Convert.ToDecimal(txtsalary.Text);
        plEmployee.mobile = txtmobile.Text;
        //Type table
        DataTable typetable = new DataTable();
        typetable.Columns.Add("empname", typeof(string));
        typetable.Columns.Add("empsalary", typeof(decimal));
        typetable.Columns.Add("mobile_no", typeof(string));
        typetable.Columns.Add("loginid", typeof(string));
        typetable.Rows.Add(plEmployee.empname,plEmployee.salary,plEmployee.mobile,txtloginid.Text);

        plEmployee.Typetable = typetable;

        ds = new DataSet();
        ds=objblogic.Insertdata(1, "Sp_Typetableemployee", plEmployee);
        if(ds!=null && ds.Tables[0].Rows.Count > 0)
        {
            if(ds.Tables[0].Rows[0]["MSG"].ToString()==msgsuccess)
            {
                lblmsg.Text = "Data Insert Succcessfully...";
            }
            else
            {
                lblmsg.Text = "Data not Inserted...";
            }
        }
    }
}