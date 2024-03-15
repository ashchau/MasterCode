using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class CRUD_CountryStateCityBind : System.Web.UI.Page
{
    businesslogic businesslogic;
    DataSet ds;
    DataSet dtBindDDL
    {
        get { return (DataSet)ViewState["dtBindDDL"]; }
        set { ViewState["dtBindDDL"] = value; }
    }
    public string Name
    {
        
        get
        {
            return ViewState["NameValue"].ToString();
        }

        set
        {
            ViewState["NameValue"]= value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bindddl();
            getvaulue();
            lblmsg.Visible = true;
            lblmsg.Text = Name;
        }
    }

    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcountry.SelectedIndex== 0)
        {
            ddlstate.Items.Clear();
            lblmsg.Visible = true;
            lblmsg.Text = "Please Select a Country Name";
            return;
        }
        var lst = dtBindDDL.Tables[1].AsEnumerable().Where(row => Convert.ToInt16(row["country_id"]) == Convert.ToInt32(ddlcountry.SelectedValue)).ToList();
        if(lst.Count>0)
        {
            ddlstate.DataSource = lst.CopyToDataTable();
            ddlstate.DataValueField = "s_id";
            ddlstate.DataTextField = "s_name";
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("<-Select State->", "0"));
            lblmsg.Visible = false;
        }
        else
        {
            ddlstate.Items.Insert(0, new ListItem("No State Found", "0"));
            lblmsg.Visible = true;
            lblmsg.Text = "No State Found";
        }
        
    }

    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlstate.SelectedIndex == 0)
        {
            ddldist.Items.Clear();
            lblmsg.Visible = true;
            lblmsg.Text = "Please Select a State Name";
            return;
        }
        var lst = dtBindDDL.Tables[2].AsEnumerable().Where(row => Convert.ToInt16(row["s_id"]) == Convert.ToInt32(ddlstate.SelectedValue)).ToList();
        if (lst.Count > 0)
        {
            ddldist.DataSource = lst.CopyToDataTable();
            ddldist.DataValueField = "dc_id";
            ddldist.DataTextField = "dc_name";
            ddldist.DataBind();
            ddldist.Items.Insert(0, new ListItem("<-Select District->", "0"));
            lblmsg.Visible = false;
        }
        else
        {
            ddldist.Items.Insert(0, new ListItem("No District Found", "0"));
            lblmsg.Visible = true;
            lblmsg.Text = "No District Found";
        }
    }

    protected void ddldist_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddldist.SelectedIndex == 0)
        {
            ddlvillage.Items.Clear();
            lblmsg.Visible = true;
            lblmsg.Text = "Please Select a District Name";
            return;
        }
        var lst = dtBindDDL.Tables[3].AsEnumerable().Where(row => Convert.ToInt16(row["s_id"]) == Convert.ToInt32(ddldist.SelectedValue)).ToList();
        if (lst.Count > 0)
        {
            ddlvillage.DataSource = lst.CopyToDataTable();
            ddlvillage.DataValueField = "ct_id";
            ddlvillage.DataTextField = "ct_name";
            ddlvillage.DataBind();
            ddlvillage.Items.Insert(0, new ListItem("<-Select Village->", "0"));
            lblmsg.Visible = false;
        }
        else
        {
            ddlvillage.Items.Insert(0, new ListItem("No Village Found", "0"));
            lblmsg.Visible = true;
            lblmsg.Text = "No Village Found";
        }
    }
    protected void Bindddl()
    {
        businesslogic = new businesslogic();
        ds = new DataSet();
        ds = businesslogic.BindcountryStateCity(1, "Sp_CountryStateCity");
        if(ds!=null)
        {
            dtBindDDL = ds;
            ddlcountry.DataSource = ds.Tables[0];
            ddlcountry.DataTextField = "country_name";
            ddlcountry.DataValueField = "country_id";
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("Select Country", "0"));
        }
    }

    // private string name = "test";

    // Declare name property

    protected void  getvaulue()
    {
        Name = "Ashok Chauhan";
        //return Name;
    }
}