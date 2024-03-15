using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class CRUD_Execute_NonQuery_Scalar_Reader : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.c-sharpcorner.com/blogs/executereader-executenonquery-and-executescalar-in-adonet
    }
    public void InsertTest( )
    {
        SqlConnection sqlCon = null;
        String SqlconString = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        using (sqlCon = new SqlConnection(SqlconString))
        {
            sqlCon.Open();
            SqlCommand Cmnd = new SqlCommand("Sp_ApiCrud", sqlCon);
            Cmnd.CommandType = CommandType.StoredProcedure;
            //Cmnd.Parameters.AddWithValue("@ID", SqlDbType.Int).Value = Id;
            //Cmnd.Parameters.AddWithValue("@NAME", SqlDbType.NVarChar).Value = Name;
            Cmnd.Parameters.AddWithValue("@Ind", 3);
            Cmnd.Parameters.AddWithValue("@empname", txtname.Text.Trim());
            Cmnd.Parameters.AddWithValue("@salary", txtsalary.Text);
            Cmnd.Parameters.AddWithValue("@mobile", txtmobile.Text);

            int result = Cmnd.ExecuteNonQuery();
            sqlCon.Close();
        }
    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        //ExecuteNonQuery method is used to execute SQL Command or the storeprocedure performs, INSERT, UPDATE or Delete operations. It doesn't return any data from the database. Instead, it returns an integer specifying the number of rows inserted, updated or deleted.
        InsertTest();
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {

    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {

    }
    public void ShowData()
    {
        SqlConnection sqlCon = null;
        String SqlconString = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        using (sqlCon = new SqlConnection(SqlconString))
        {
            sqlCon.Open();
            SqlCommand Cmnd = new SqlCommand("Sp_ApiCrud", sqlCon);
            Cmnd.CommandType = CommandType.StoredProcedure;
            Cmnd.Parameters.AddWithValue("@Ind", 1);
            object result = Cmnd.ExecuteScalar();
            //ExecuteScalar method is used to execute SQL Commands or storeprocedure, after executing return a single value from the database. It also returns the first column of the first row in the result set from a database.
            string res = result.ToString();
           // object result1 = Cmnd.ExecuteReader();
            SqlDataReader dr = Cmnd.ExecuteReader();//ExecuteReader method is used to execute a SQL Command or storedprocedure returns a set of rows from the database.
            if (dr.Read())
            {
                string name = dr["empname"].ToString();
                string salary = dr["salary"].ToString();
                string mobile = dr["mobile"].ToString();
            }
            sqlCon.Close();
        }
    }
    protected void btnshow_Click(object sender, EventArgs e)
    {
        ShowData();
    }
}