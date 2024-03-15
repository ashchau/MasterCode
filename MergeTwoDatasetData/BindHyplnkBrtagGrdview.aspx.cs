﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MergeTwoDatasetData_BindHyplnkBrtagGrdview : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataAdapter da;
    string strtable = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridwithbrtag();
            BindGrd();
            BindGrd2();
        }
    }
    public void BindGridwithbrtag()
    {
        string Constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        conn = new SqlConnection(Constr);
        conn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "spbrtag";
        cmd.Connection = conn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Ind", 1);
        DataTable dt = new DataTable();
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            strtable = " <table border='2' bordercolor='Red' cellpadding='0' cellspacing='0'  width='1090px'>";
            strtable += "<tr><th>Regno</th><th>Employee Name</th><th>Ward no</th><th>Entry Date</th><th>Opening Date</th></tr>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                //strtable += "<tr>";
                //strtable += "<td>"+dt.Rows[i]["regno"]+"</td>";
                //Livetender += "<a href='../AboutMcjaipur/MstPdfViewer.aspx?Pageid=6&PdfName=" + ds.Tables[0].Rows[i]["PdfName"].ToString() + "&Header=NIT/Tender' class='tender'>Download</a></td>";
                if (i % 2 == 0)
                {
                    strtable += "<tr bgcolor='#f7dad5' valign='middle'>";
                }
                else
                {
                    strtable += "<tr bgcolor='#f5f5f5' valign='middle'>";
                }
                strtable += "<td><a href='../PDF/" + dt.Rows[i]["pdfname"] + "' class='tender'>" + dt.Rows[i]["regno"] + "</a></td>";
                strtable += "<td>" + dt.Rows[i]["empname"] + "</td>";
                strtable += "<td>" + dt.Rows[i]["wardno"] + "</td>";
                strtable += "<td>" + dt.Rows[i]["entrydate"] + "</td>";
                strtable += "<td>" + dt.Rows[i]["openingdate"] + "</td>";
                strtable += "</tr>";
            }
            strtable += "</table>";
            lblgrd.Text = strtable;
        }
        conn.Close();


    }
    public void BindGrd()
    {
        string Constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        conn = new SqlConnection(Constr);
        conn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "spbrtag";
        cmd.Connection = conn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Ind", 2);
        DataTable dt = new DataTable();
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        conn.Close();


    }
    public void BindGrd2()
    {
        string Constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        conn = new SqlConnection(Constr);
        conn.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "spbrtag";
        cmd.Connection = conn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Ind", 3);
        DataTable dt = new DataTable();
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        conn.Close();


    }
}