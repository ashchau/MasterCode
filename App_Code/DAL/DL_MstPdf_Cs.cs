using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
/// <summary>
/// Summary description for DL_MstPdf_Cs
/// </summary>
public class DL_MstPdf_Cs
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds, XmlDs;
    DataTable dt;
    FileInfo file;
    public DL_MstPdf_Cs()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void Dl_MstPdf(Prop_MstPdf_Cs Pr_MstPdfObj)
    {
        file = DBConnection.Xml_Conn();
        if (file.Exists)
        {
            try
            {
                ds = new DataSet();
                XmlDs = new DataSet();
                XmlDs.ReadXml(file.FullName);
                if (XmlDs.Tables.Count > 0 && XmlDs.Tables["MstPdf"] != null && XmlDs.Tables["MstPdf"].Rows.Count > 0)
                {
                    con = DBConnection.SqlConn_JaipurMcDB();
                    cmd = new SqlCommand(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["Id"]), con);//get the store procedure name-XmlDs.Tables["MstPdf"].Rows[0]["Id"]
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 0;
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["Ind"]), Pr_MstPdfObj.Ind);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["serno"]), Pr_MstPdfObj.serno);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["pageid"]), Pr_MstPdfObj.pageid);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["Pagename"]), Pr_MstPdfObj.Pagename);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["pdffilename"]), Pr_MstPdfObj.pdffilename);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["linkname"]), Pr_MstPdfObj.linkname);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["Groupid"]), Pr_MstPdfObj.Groupid);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["Pagetitle"]), Pr_MstPdfObj.Pagetitle);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["DisplayStatus"]), Pr_MstPdfObj.DisplayStatus);
                    cmd.Parameters.AddWithValue(Convert.ToString(XmlDs.Tables["MstPdf"].Rows[0]["DisplayOrder"]), Pr_MstPdfObj.DisplayOrder);
                    da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    Pr_MstPdfObj.Ds = ds;
                }
            }
            finally
            {
                if (con.State == ConnectionState.Open) con.Close();
            }
        }
    }
}