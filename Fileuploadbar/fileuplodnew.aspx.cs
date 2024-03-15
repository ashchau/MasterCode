using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;
public partial class Fileuploadbar_fileuplodnew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
            ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Add Fake Delay to simulate long running process.
        //https://www.aspsnippets.com/Articles/Show-progress-bar-on-Button-Click-in-ASPNet.aspx
        Thread.Sleep(5000);
        this.LoadCustomers();
    }
    private void LoadCustomers()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        string query = "SELECT * FROM customers WHERE Country = @Country OR @Country = ''";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Parameters.AddWithValue("@Country", ddlCountries.SelectedItem.Value);
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        gvCustomers.DataSource = dt;
                        gvCustomers.DataBind();
                    }
                }
            }
        }
    }
}