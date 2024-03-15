using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Gridview_DdlOnGrid : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataAdapter da;
    DataSet ds;
    public DataTable DtDesgSt;
    Pl_MstSectionDtl pl_MsdObj;
    businesslogic dl_MsdObj;
    protected void Page_Load(object sender, EventArgs e)
    {
        //string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        //con = new SqlConnection(constr);
        if (!IsPostBack)
        {
            Bindgrd();
        }

    }
    private void Bindgrd()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(constr);
        con.Open();
        //string query = "select * from prod";
        string query = "select pd.prod_id,mf.Fruitname as prod_name,pd.Fruitid,pd.prod_imgpath,pd.prod_price from prod pd inner join mstfruit mf on pd.fruitid=mf.Fruitid ";
        cmd = new SqlCommand(query, con);
        DataSet ds = new DataSet();
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if(ds.Tables[0].Rows.Count>0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
       
      
        con.Close();
        
    }
    protected void btnshow_Click(object sender, EventArgs e)
    {
        Bindgrd();
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        int RowIndex = gvr.RowIndex;
        for(int i=0;i<GridView1.Rows.Count;i++)
        {
            ((DropDownList)GridView1.Rows[RowIndex].FindControl("DropDownList1")).Enabled = false;
            ((TextBox)GridView1.Rows[RowIndex].FindControl("txtprice")).Enabled=false;
            ((Button)GridView1.Rows[RowIndex].FindControl("btnedit")).Visible = true;
            ((Button)GridView1.Rows[RowIndex].FindControl("btnupdate")).Visible = false;
            ((Button)GridView1.Rows[RowIndex].FindControl("btncancel")).Visible = false;
            ((Button)GridView1.Rows[RowIndex].FindControl("btndelete")).Visible = true;
        }
         ((DropDownList)GridView1.Rows[RowIndex].FindControl("DropDownList1")).Enabled = true;
        ((TextBox)GridView1.Rows[RowIndex].FindControl("txtprice")).Enabled = true;
        ((Button)GridView1.Rows[RowIndex].FindControl("btnedit")).Visible = false;
        ((Button)GridView1.Rows[RowIndex].FindControl("btnupdate")).Visible = true;
        ((Button)GridView1.Rows[RowIndex].FindControl("btncancel")).Visible = true;
        ((Button)GridView1.Rows[RowIndex].FindControl("btndelete")).Visible = false;
    }
    private DataTable FillDllSection()
    {
        DataTable DT = new DataTable();
        pl_MsdObj = new Pl_MstSectionDtl();
        //pl_MsdObj.Ind = 1;
        dl_MsdObj = new businesslogic();
        dl_MsdObj.MstSectionDtl("chauhan", pl_MsdObj);
        if (pl_MsdObj.DS.Tables.Count > 0)
        {
            if (pl_MsdObj.DS.Tables[0].Rows.Count > 0)
            {
                DT = pl_MsdObj.DS.Tables[0];
            }
            else { DT = null; }
        }
        return DT;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (DtDesgSt == null) DtDesgSt = FillDllSection();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
            DropDownList ddl = (DropDownList)e.Row.FindControl("DropDownList1");
            ddl.DataSource = DtDesgSt;
            ddl.DataTextField = "Fruitname"; 
            ddl.DataValueField = "Fruitid";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("<--Select Fruits-->"));
            if (DtDesgSt.Rows.Count > 0) ddl.SelectedValue = GridView1.DataKeys[e.Row.RowIndex]["Fruitid"].ToString(); else ddl.SelectedIndex = 0;

            //below code is used for bind another dropdownlist
            //DropDownList ddl2 = (DropDownList)e.Row.FindControl("gv_ddl_IsActive");
            //ddl2.SelectedValue = GridView1.DataKeys[e.Row.RowIndex]["IsActive"].ToString();

        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        Bindgrd();
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        int RowIndex = gvr.RowIndex;

        if (((DropDownList)GridView1.Rows[RowIndex].FindControl("DropDownList1")).SelectedIndex == 0)
        {
            lbl_ErroMsg.Text = "Select Fruits...";
            ((DropDownList)GridView1.Rows[RowIndex].FindControl("DropDownList1")).Focus();
            return;
        }
        if(((TextBox)GridView1.Rows[RowIndex].FindControl("txtprice")).Text.ToString().Trim()=="")
        {
            lbl_ErroMsg.Text = "Select price";
            ((TextBox)GridView1.Rows[RowIndex].FindControl("txtprice")).Focus();
            return;
        }
        pl_MsdObj = new Pl_MstSectionDtl();
        pl_MsdObj.ind = 2;
        pl_MsdObj.prod_id =Convert.ToInt32(((HiddenField)GridView1.Rows[RowIndex].FindControl("hdfid")).Value.ToString());
        //pl_MsdObj.prod_name = ((DropDownList)GridView1.Rows[RowIndex].FindControl("DropDownList1")).SelectedValue; //used for save id and below code is use for save values
        pl_MsdObj.prod_name = ((DropDownList)GridView1.Rows[RowIndex].FindControl("DropDownList1")).SelectedItem.Text;
        pl_MsdObj.prod_price =Convert.ToInt32( ((TextBox)GridView1.Rows[RowIndex].FindControl("txtprice")).Text);
        dl_MsdObj = new businesslogic();
        dl_MsdObj.Mstupdate("chauhan", "sp_fruit", pl_MsdObj);
        //ds = new DataSet();
        //ds = pl_MsdObj.DS;
        if (pl_MsdObj.DS.Tables[0].Rows[0][0].ToString()=="1")
        {
            lbl_ErroMsg.Text = "Record Update successfully...";
        }
        else
        {
            lbl_ErroMsg.Text = "Sorry Record not updated...";
        }
         ((DropDownList)GridView1.Rows[RowIndex].FindControl("DropDownList1")).Enabled = false;
        ((TextBox)GridView1.Rows[RowIndex].FindControl("txtprice")).Enabled = false;
        ((Button)GridView1.Rows[RowIndex].FindControl("btnedit")).Visible = true;
        ((Button)GridView1.Rows[RowIndex].FindControl("btnupdate")).Visible = false;
        ((Button)GridView1.Rows[RowIndex].FindControl("btncancel")).Visible = false;
        ((Button)GridView1.Rows[RowIndex].FindControl("btndelete")).Visible = true;
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        int RowIndex = gvr.RowIndex;
        pl_MsdObj = new Pl_MstSectionDtl();
        pl_MsdObj.ind = 3;
        pl_MsdObj.prod_id = Convert.ToInt32(((HiddenField)GridView1.Rows[RowIndex].FindControl("hdfid")).Value.ToString());
        dl_MsdObj = new businesslogic();
        dl_MsdObj.MstDelete("chauhan","sp_fruit",pl_MsdObj);
        if (pl_MsdObj.DS.Tables[0].Rows[0][0].ToString() == "1")
        {
            lbl_ErroMsg.Text = "Record Deleted successfully...";
        }
        else
        {
            lbl_ErroMsg.Text = "Sorry Record not Deleted...";
        }
         ((DropDownList)GridView1.Rows[RowIndex].FindControl("DropDownList1")).Enabled = false;
        ((TextBox)GridView1.Rows[RowIndex].FindControl("txtprice")).Enabled = false;
        ((Button)GridView1.Rows[RowIndex].FindControl("btnedit")).Visible = true;
        ((Button)GridView1.Rows[RowIndex].FindControl("btnupdate")).Visible = false;
        ((Button)GridView1.Rows[RowIndex].FindControl("btncancel")).Visible = false;
        Bindgrd();
    }
}