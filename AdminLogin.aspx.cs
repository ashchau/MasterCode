﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsignin_Click(object sender, EventArgs e)
    {
        string UserName = "";
        string conn_string = "Data Source=DILSHAD;Initial Catalog=CHAUHAN;Integrated Security=True";
        SqlConnection con = new SqlConnection(conn_string);
        con.Open();
        string query = "select * from tbllogin where loginid= '" + txtemail.Value + "' and password='" + txtpsw.Value + "'";
        SqlCommand y = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(y);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            UserName = dt.Rows[0]["username"].ToString();
            Session["name"] = UserName;
            Response.Redirect("~/Fileupload.aspx");
            Session.RemoveAll();

        }
        else
        {
            Response.Redirect("Errorpage.aspx");
        }
        Response.Redirect("~/popup.aspx");
    }


   
}