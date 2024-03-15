using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;

public partial class Bulkrowinsert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateData();
        }
        //http://www.dotnetawesome.com/2013/12/insert-bulk-data-into-sql-server-using-aspnet.html
        //https://stackoverflow.com/questions/13722014/insert-2-million-rows-into-sql-server-quickly
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        // Save Here
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("<?xml version=\"1.0\" ?>");
        sb.AppendLine("     <contacts>");

        // Check Validity
        TextBox txtFirstName;
        TextBox txtLastName;
        TextBox txtContactNo;

        foreach (GridViewRow row in gvContacts.Rows)
        {
            txtFirstName = (TextBox)row.FindControl("txtFirstName");
            txtLastName = (TextBox)row.FindControl("txtLastName");
            txtContactNo = (TextBox)row.FindControl("txtContactNo");

            if (txtFirstName == null || txtLastName == null || txtContactNo == null)
            {
                return;
            }

            if (string.IsNullOrEmpty(txtFirstName.Text.Trim())
                || string.IsNullOrEmpty(txtLastName.Text.Trim())
                || string.IsNullOrEmpty(txtContactNo.Text.Trim()))
            {
                lblMsg.Text = "All fields are required!";
                return;
            }
            else
            {
                sb.AppendLine("     <contact>");
                sb.AppendLine("         <FirstName>" + txtFirstName.Text.Trim() + "</FirstName>");
                sb.AppendLine("         <LastName>" + txtLastName.Text.Trim() + "</LastName>");
                sb.AppendLine("         <ContactNo>" + txtContactNo.Text.Trim() + "</ContactNo>");
                sb.AppendLine("     </contact>");
            }

        }
        sb.AppendLine("     </contacts>");

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("ContactBulkInsert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@XMLData", sb.ToString());
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }

            int affRow = cmd.ExecuteNonQuery();
            if (affRow > 0)
            {
                lblMsg.Text = "Successfully " + affRow + " record inserted.";
                PopulateData();
                AddRowsToGrid();
            }
        }
    }
    private void PopulateData()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("Select * from Contacts", con);
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void btnAddRow_Click(object sender, EventArgs e)
    {
        AddRowsToGrid();
    }
    private void AddRowsToGrid()
    {
        List<int> noofRows = new List<int>();
        int rows = 0;
        int.TryParse(txtNoOfRecord.Text.Trim(), out rows);

        for (int i = 0; i < rows; i++)
        {
            noofRows.Add(i);
        }

        gvContacts.DataSource = noofRows;
        gvContacts.DataBind();
        if (gvContacts.Rows.Count > 0)
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
    }
}