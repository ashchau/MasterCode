using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.Collections;
using System.Text;

public partial class Gridview_DeleteMultichk : System.Web.UI.Page
{
    //https://www.aspsnippets.com/Articles/Delete-multiple-rows-in-GridView-with-CheckBox-selection-and-with-confirmation-in-ASPNet.aspx
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)

            GetData();

        BindGrid();
    }
    private void BindGrid()

    {

        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;

        string query = "select * from Employee";

        SqlConnection con = new SqlConnection(constr);

        SqlDataAdapter sda = new SqlDataAdapter(query, con);

        DataTable dt = new DataTable();

        sda.Fill(dt);

        gvAll.DataSource = dt;

        gvAll.DataBind();

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int count = 0;

        SetData();

        gvAll.AllowPaging = false;

        gvAll.DataBind();

        ArrayList arr = (ArrayList)ViewState["SelectedRecords"];

        count = arr.Count;

        for (int i = 0; i < gvAll.Rows.Count; i++)

        {

            if (arr.Contains(gvAll.DataKeys[i].Value))

            {

                DeleteRecord(gvAll.DataKeys[i].Value.ToString());

                arr.Remove(gvAll.DataKeys[i].Value);

            }

        }

        ViewState["SelectedRecords"] = arr;

        hfCount.Value = "0";

        gvAll.AllowPaging = true;

        BindGrid();

        ShowMessage(count);
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvAll.PageIndex = e.NewPageIndex;

        gvAll.DataBind();

        SetData();
    }
    private void GetData()

    {

        ArrayList arr;

        if (ViewState["SelectedRecords"] != null)

            arr = (ArrayList)ViewState["SelectedRecords"];

        else

            arr = new ArrayList();

        CheckBox chkAll = (CheckBox)gvAll.HeaderRow.Cells[0].FindControl("chkAll");

        for (int i = 0; i < gvAll.Rows.Count; i++)

        {

            if (chkAll.Checked)

            {

                if (!arr.Contains(gvAll.DataKeys[i].Value))

                {

                    arr.Add(gvAll.DataKeys[i].Value);

                }

            }

            else

            {

                CheckBox chk = (CheckBox)gvAll.Rows[i].Cells[0].FindControl("chk");

                if (chk.Checked)

                {

                    if (!arr.Contains(gvAll.DataKeys[i].Value))

                    {

                        arr.Add(gvAll.DataKeys[i].Value);

                    }

                }

                else

                {

                    if (arr.Contains(gvAll.DataKeys[i].Value))

                    {

                        arr.Remove(gvAll.DataKeys[i].Value);

                    }

                }

            }

        }

        ViewState["SelectedRecords"] = arr;

    }
    private void SetData()

    {

        int currentCount = 0;

        CheckBox chkAll = (CheckBox)gvAll.HeaderRow.Cells[0].FindControl("chkAll");

        chkAll.Checked = true;

        ArrayList arr = (ArrayList)ViewState["SelectedRecords"];

        for (int i = 0; i < gvAll.Rows.Count; i++)

        {

            CheckBox chk = (CheckBox)gvAll.Rows[i].Cells[0].FindControl("chk");

            if (chk != null)

            {

                chk.Checked = arr.Contains(gvAll.DataKeys[i].Value);

                if (!chk.Checked)

                    chkAll.Checked = false;

                else

                    currentCount++;

            }

        }
        hfCount.Value = (arr.Count - currentCount).ToString();

    }
    private void DeleteRecord(string empid)

    {

        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        string query = "delete from employee " + "where empid=@empid";

        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.Parameters.AddWithValue("@empid", empid);

        con.Open();

        cmd.ExecuteNonQuery();

        con.Close();

    }
    private void ShowMessage(int count)

    {

        StringBuilder sb = new StringBuilder();

        sb.Append("<script type = 'text/javascript'>");

        sb.Append("alert('");

        sb.Append(count.ToString());

        sb.Append(" records deleted.');");

        sb.Append("</script>");
        ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());

    }
}