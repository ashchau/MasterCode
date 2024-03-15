using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for businesslogic
/// </summary>
public class businesslogic
{
    DataTable dt;
    DataSet ds;
    SqlDataAdapter sqlda;
    dynamicconnection objdynconn;
    SqlCommand cmd;
    DBConnection dBConnection;
    SqlConnection con;
    PlEmployee plEmployee;
    string msgsuccess="";
    public businesslogic()
    {
        
    }
    //public DataSet GetMessage(int pageid)
    //{
    //   // objdl = new Datalayer();
    //    objdynconn = new dynamicconnection(dbname);
    //    ds = new DataSet();
    //    sqlda = new SqlDataAdapter("GetPageContentByID", objdynconn.sqlconn);
    //    sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
    //    sqlda.SelectCommand.Parameters.AddWithValue("@pageid", pageid);
    //    sqlda.Fill(ds);
    //    sqlda.SelectCommand.ExecuteNonQuery();
    //    objdynconn.sqlconn.Close();
    //    return ds;
    //}
    public DataSet Login(string Procedure,PlLogin plLogin)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            ds = new DataSet();
            sqlda = new SqlDataAdapter(Procedure, con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Ind",plLogin.Ind);
            sqlda.SelectCommand.Parameters.AddWithValue("@UserId",plLogin.UserId);
            sqlda.SelectCommand.Parameters.AddWithValue("@Password",plLogin.Password);
            sqlda.Fill(ds);

        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
        return ds;
    }
    public void update(string dbname, string procname, int id, string name, decimal salary, string city, string pdfname )
    {
        objdynconn = new dynamicconnection(dbname);
        
        try
        {
            sqlda = new SqlDataAdapter(procname, objdynconn.sqlconn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@id", id);
            sqlda.SelectCommand.Parameters.AddWithValue("@name", name);
            sqlda.SelectCommand.Parameters.AddWithValue("@salary", salary);
            sqlda.SelectCommand.Parameters.AddWithValue("@city", city);
            sqlda.SelectCommand.Parameters.AddWithValue("@pdfname", pdfname);

            sqlda.SelectCommand.ExecuteNonQuery();
            objdynconn.sqlconn.Close();
            objdynconn.sqlconn.Dispose();
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
    }
    public void updatenew(string dbname, int id, string name, decimal salary, string city, string pdfname)
    {
        objdynconn = new dynamicconnection(dbname);
        ds = new DataSet();
        try
        {
            string q = "update tblpdf set name = @name,salary = @salary,city = @city,pdfname = @pdfname where id = @id ";
            sqlda = new SqlDataAdapter(q, objdynconn.sqlconn);
            //sqlda = new SqlDataAdapter(procname, objdynconn.sqlconn);
           // sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@id", id);
            sqlda.SelectCommand.Parameters.AddWithValue("@name", name);
            sqlda.SelectCommand.Parameters.AddWithValue("@salary", salary);
            sqlda.SelectCommand.Parameters.AddWithValue("@city", city);
            sqlda.SelectCommand.Parameters.AddWithValue("@pdfname", pdfname);
            sqlda.Fill(ds);
            
            sqlda.SelectCommand.ExecuteNonQuery();
            objdynconn.sqlconn.Close();
            objdynconn.sqlconn.Dispose();
            //return ds;
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
    }
    public DataSet Updateset (string dbname, int id, string name, decimal salary, string city, string pdfname)
    {
        objdynconn = new dynamicconnection(dbname);
        ds = new DataSet();
        try
        {
            string q = "update tblpdf set name = @name,salary = @salary,city = @city,pdfname = @pdfname where id = @id ";
            sqlda = new SqlDataAdapter(q, objdynconn.sqlconn);
            //sqlda = new SqlDataAdapter(procname, objdynconn.sqlconn);
            // sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@id", id);
            sqlda.SelectCommand.Parameters.AddWithValue("@name", name);
            sqlda.SelectCommand.Parameters.AddWithValue("@salary", salary);
            sqlda.SelectCommand.Parameters.AddWithValue("@city", city);
            sqlda.SelectCommand.Parameters.AddWithValue("@pdfname", pdfname);
            sqlda.Fill(ds);

            sqlda.SelectCommand.ExecuteNonQuery();
            objdynconn.sqlconn.Close();
            objdynconn.sqlconn.Dispose();
           // return ds;
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        return ds;
    }
    public DataSet GetAllpagename(string database,string pagename)
    {
        try
        {
            objdynconn = new dynamicconnection(database);
            ds = new DataSet();
            sqlda = new SqlDataAdapter("GetallPageName", objdynconn.sqlconn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@pagename", pagename);
            sqlda.Fill(ds);
            sqlda.SelectCommand.ExecuteReader();
            objdynconn.sqlconn.Close();

        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        return ds;
    }
    #region Fill grid for PDF

    public DataSet FillGridforPDF(string dbname, string procedurenm, int pdfid)
    {
        objdynconn = new dynamicconnection(dbname);
        ds = new DataSet();
        sqlda = new SqlDataAdapter(procedurenm, objdynconn.sqlconn);
        sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
        sqlda.SelectCommand.Parameters.AddWithValue("@imageid", pdfid);
        sqlda.Fill(ds);
        sqlda.SelectCommand.ExecuteReader();
        objdynconn.sqlconn.Close();
        return ds;
    }
    #endregion
    public void UpdatedPagehistory(string Dbname, string procname, string uname, int pageID, string pageText, string updatetype)
    {
        objdynconn = new dynamicconnection(Dbname);
        try
        {
            sqlda = new SqlDataAdapter(procname, objdynconn.sqlconn);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@uname", uname);
            sqlda.SelectCommand.Parameters.AddWithValue("@pageID", pageID);
            sqlda.SelectCommand.Parameters.AddWithValue("@pageText", pageText);
            sqlda.SelectCommand.Parameters.AddWithValue("@updatetype", updatetype);
            sqlda.SelectCommand.ExecuteNonQuery();
            objdynconn.sqlconn.Close();
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
    }
    public void MstSectionDtl(string Dbname, Pl_MstSectionDtl pl_MSDObj)
    {
        objdynconn = new dynamicconnection(Dbname);
        ds = new DataSet();
        string q = "select * from mstfruit ";
        //string q = "select pd.prod_id,mf.Fruitname as prod_name,pd.prod_imgpath,pd.prod_price from prod pd inner join mstfruit mf on pd.fruitid=mf.Fruitid ";
        sqlda = new SqlDataAdapter(q,objdynconn.sqlconn);
        sqlda.Fill(ds);
        //sqlda.SelectCommand.ExecuteReader();
        pl_MSDObj.DS = ds;
        objdynconn.sqlconn.Close();
        //return ds;

    }
    public void Mstupdate(string Dbname, string procname, Pl_MstSectionDtl pl_MSDObj)
    {
        objdynconn = new dynamicconnection(Dbname);
        //ds = new DataSet();
        //string q = "update prod set prod_name='"+pl_MSDObj.prod_name+ "',prod_price='"+pl_MSDObj.prod_price+ "' where prod_id='"+pl_MSDObj.prod_id+"'";
        //cmd = new SqlCommand(q, objdynconn.sqlconn);
        //int i= cmd.ExecuteNonQuery();
        cmd = new SqlCommand(procname, objdynconn.sqlconn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", pl_MSDObj.ind);
        cmd.Parameters.AddWithValue("@prod_id", pl_MSDObj.prod_id);
        cmd.Parameters.AddWithValue("@prod_name", pl_MSDObj.prod_name);
        cmd.Parameters.AddWithValue("@prod_price", pl_MSDObj.prod_price);
        ds = new DataSet();
        sqlda = new SqlDataAdapter(cmd);
        sqlda.Fill(ds);
        pl_MSDObj.DS = ds;
        objdynconn.sqlconn.Close();
    }
    public void MstDelete(string Dbname, string procname, Pl_MstSectionDtl pl_MSDObj)
    {
        objdynconn = new dynamicconnection(Dbname);
        cmd = new SqlCommand(procname, objdynconn.sqlconn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", pl_MSDObj.ind);
        cmd.Parameters.AddWithValue("@prod_id", pl_MSDObj.prod_id);
        ds = new DataSet();
        sqlda = new SqlDataAdapter(cmd);
        sqlda.Fill(ds);
        pl_MSDObj.DS = ds;
        objdynconn.sqlconn.Close();
    }
    public DataSet Insertdata(int Ind ,string procname, PlEmployee plEmployee)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            ds = new DataSet();
            cmd = new SqlCommand(procname, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ind", plEmployee.Ind);
            cmd.Parameters.AddWithValue("@empname", plEmployee.empname);
            cmd.Parameters.AddWithValue("@salary", plEmployee.salary);
            cmd.Parameters.AddWithValue("@mobile", plEmployee.mobile);
            cmd.Parameters.AddWithValue("@Typetable", plEmployee.Typetable);
           // cmd.ExecuteNonQuery(); comment this line due to insert duplicate records
            sqlda = new SqlDataAdapter(cmd);
            sqlda.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            throw;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    public string InsertwithSqlparam(string procname, PlEmployee plEmployee)
    {

        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            cmd = new SqlCommand(procname, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ind", plEmployee.Ind);
            cmd.Parameters.AddWithValue("@empname", plEmployee.empname);
            cmd.Parameters.AddWithValue("@salary", plEmployee.salary);
            cmd.Parameters.AddWithValue("@mobile", plEmployee.mobile);
            //cmd.Parameters.AddWithValue("@Typetable", plEmployee.Typetable);
            cmd.Parameters.Add("@msgsql",SqlDbType.VarChar,50);
            cmd.Parameters["@msgsql"].Direction = ParameterDirection.Output;//used OUT parameter
            cmd.ExecuteNonQuery();
            msgsuccess = (string) cmd.Parameters["@msgsql"].Value;
            return msgsuccess;
        }
        catch (Exception ex)
        {
            throw;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    #region Bind Country State City
    public DataSet BindcountryStateCity(int Ind, string Procedure)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            ds = new DataSet();
            sqlda = new SqlDataAdapter("Sp_CountryStateCity", con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Ind",Ind);
            sqlda.Fill(ds);
            sqlda.SelectCommand.ExecuteReader();
            objdynconn.sqlconn.Close();

        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        return ds;
    }
    public DataSet Bindgrd(int Ind, string Procedure)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            ds = new DataSet();
            sqlda = new SqlDataAdapter(Procedure, con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Ind", Ind);
            sqlda.Fill(ds);
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        finally
        {
          con.Close();
          con.Dispose();
        }
        return ds;
    }
    public DataTable DtGridveiw(int Ind, string Procedure)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            dt = new DataTable();
            sqlda = new SqlDataAdapter(Procedure, con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Ind", Ind);
            sqlda.Fill(dt);
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
        return dt;
    }
    #endregion
    #region Bind Gridview Crud
    public DataTable Bindgrid(int ind, string Procedure,string itemlist)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            dt = new DataTable();
            sqlda = new SqlDataAdapter(Procedure, con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@ind", ind);
            sqlda.SelectCommand.Parameters.AddWithValue("@prodselectlist", itemlist.Trim());
            sqlda.Fill(dt);
            sqlda.SelectCommand.ExecuteReader();
            objdynconn.sqlconn.Close();

        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        return dt;
    }
    public DataTable GridviewInsert(string Action, string Procedure, Pl_Customers pl_Customers)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            dt = new DataTable();
            sqlda = new SqlDataAdapter(Procedure, con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Action", Action);
            sqlda.SelectCommand.Parameters.AddWithValue("@Name", pl_Customers.Name);
            sqlda.SelectCommand.Parameters.AddWithValue("@Country", pl_Customers.Country);
            sqlda.Fill(dt);
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
        return dt;
    }
    public DataTable Bindgridview(string Action, string Procedure)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            dt = new DataTable();
            sqlda = new SqlDataAdapter(Procedure, con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Action", Action);
            sqlda.Fill(dt);
            sqlda.SelectCommand.ExecuteReader();
            objdynconn.sqlconn.Close();

        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        return dt;
    }
    public DataTable GridviewDelete(string Action, string Procedure,int CustomerId)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            dt = new DataTable();
            sqlda = new SqlDataAdapter(Procedure, con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Action", Action);
            sqlda.SelectCommand.Parameters.AddWithValue("@CustomerId", CustomerId);
            sqlda.Fill(dt);
            sqlda.SelectCommand.ExecuteReader();
            objdynconn.sqlconn.Close();

        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        return dt;
    }
    public DataTable GridviewUpdate(string Action, string Procedure, Pl_Customers pl_Customers)
    {
        try
        {
            con = new SqlConnection();
            dBConnection = new DBConnection();
            con = DBConnection.SqlConn_JaipurMcDB();
            dt = new DataTable();
            sqlda = new SqlDataAdapter(Procedure, con);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@Action", Action);
            sqlda.SelectCommand.Parameters.AddWithValue("@CustomerId",pl_Customers.CustomerId);
            sqlda.SelectCommand.Parameters.AddWithValue("@Name", pl_Customers.Name);
            sqlda.SelectCommand.Parameters.AddWithValue("@Country", pl_Customers.Country);
            sqlda.Fill(dt);
        }
        catch (Exception ex)
        {
            string str = ex.Message;
        }
        finally
        {
           con.Close();
           con.Dispose();
        }
        return dt;
    }
    #endregion
}