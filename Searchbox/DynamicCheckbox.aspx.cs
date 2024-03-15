using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class Searchbox_DynamicCheckbox : System.Web.UI.Page
{
    CheckBox chkDynamic;
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateDynamicControls();
        chkDynamic = new CheckBox();
        chkDynamic.ID = "chkExample";
        chkDynamic.Text = "Check / Uncheck";
        chkDynamic.AutoPostBack = true;
        chkDynamic.CheckedChanged += new EventHandler(chkDynamic_CheckedChanged);
        this.Form.Controls.Add(chkDynamic);
    }
    protected void chkDynamic_CheckedChanged
                (object sender, EventArgs e)
    {
        if (chkDynamic.Checked)
            lblMessage.Text = "you checked the checkbox";
        else if (!chkDynamic.Checked)
            lblMessage.Text = "checkbox is not checked";
    }

    protected void btnckeck_Click(object sender, EventArgs e)
    {
        //Save();
    }
    
    public DataTable CustomFields()
    {
        DataTable dt = new DataTable();
        dt = new DataTable();
        //add columns
        dt.Columns.Add("FieldName",typeof(string));
        dt.Columns.Add("FieldType", typeof(string));
        dt.Columns.Add("FieldValue", typeof(string));
        //add rows
        dt.Rows.Add("Firstname","Textbox",string.Empty);
        dt.Rows.Add("Lastname", "Textbox", string.Empty);
        dt.Rows.Add("IsActive", "Checkbox", string.Empty);
        dt.Rows.Add("State", "DropdownList", string.Empty);
        dt.Rows.Add("Zip", "Textbox", string.Empty);
        dt.Rows.Add("Gender", "RadioButton", string.Empty);
        dt.Rows.Add("Job", "DropdownList", string.Empty);

        return dt;
    }
    public void CreateDynamicControls()
    {
        //https://www.c-sharpcorner.com/article/create-dynamic-form-in-asp-net-and-get-values-from-that/
        DataTable dt = new DataTable();
        dt = CustomFields();  //calling the function which describe the fieldname and fieldtype
        if (dt.Rows.Count > 0)
        {
            for (Int32 i = 0; i < dt.Rows.Count; i++)
            {
                HtmlGenericControl tr = new HtmlGenericControl("tr");
                HtmlGenericControl td = new HtmlGenericControl("td");
                HtmlGenericControl td1 = new HtmlGenericControl("td");

                string FieldName = Convert.ToString(dt.Rows[i]["FieldName"]);
                string FieldType = Convert.ToString(dt.Rows[i]["FieldType"]);
                string FieldValue = Convert.ToString(dt.Rows[i]["FieldValue"]);

                Label lbcustomename = new Label();
                lbcustomename.ID = "lb" + FieldName;
                lbcustomename.Text = FieldName;
                td.Controls.Add(lbcustomename);
                tr.Controls.Add(td);

                if (FieldType.ToLower().Trim() == "textbox")
                {
                    TextBox txtcustombox = new TextBox();
                    txtcustombox.ID = "txt" + FieldName;
                    txtcustombox.Text = FieldValue;
                    td1.Controls.Add(txtcustombox);
                }
                else if (FieldType.ToLower().Trim() == "checkbox")
                {
                    CheckBox chkbox = new CheckBox();
                    chkbox.ID = "chk" + FieldName;
                    if (FieldValue == "1")
                    {
                        chkbox.Checked = true;
                    }
                    else
                    {
                        chkbox.Checked = false;
                    }
                    td1.Controls.Add(chkbox);
                }
                else if (FieldType.ToLower().Trim() == "radiobutton")
                {
                    RadioButtonList rbnlst = new RadioButtonList();
                    rbnlst.ID = "rbnlst" + FieldName;
                    rbnlst.Items.Add(new ListItem("Male", "1"));
                    rbnlst.Items.Add(new ListItem("Female", "2"));
                    if (FieldValue != String.Empty)
                    {
                        rbnlst.SelectedValue = FieldValue;
                    }
                    else
                    {
                        rbnlst.SelectedValue = "1";
                    }
                    rbnlst.RepeatDirection = RepeatDirection.Horizontal;
                    td1.Controls.Add(rbnlst);
                }
                else if (FieldType.ToLower().Trim() == "dropdownlist")
                {
                    DropDownList ddllst = new DropDownList();
                    ddllst.ID = "ddl" + FieldName;
                    ddllst.Items.Add(new ListItem("Select", "0"));

                    if (FieldName.ToLower().Trim() == "state")
                    {
                        ddllst.Items.Add(new ListItem("Alabama", "AL"));
                        ddllst.Items.Add(new ListItem("Alaska", "AK"));
                        ddllst.Items.Add(new ListItem("Arizona", "AZ"));
                        ddllst.Items.Add(new ListItem("California", "CA"));
                        ddllst.Items.Add(new ListItem("New York", "NY"));
                    }
                    else if (FieldName.ToLower().Trim() == "job")
                    {
                        ddllst.Items.Add(new ListItem("Developer", "1"));
                        ddllst.Items.Add(new ListItem("Tester", "2"));
                    }
                    if (FieldValue != String.Empty)
                    {
                        ddllst.SelectedValue = FieldValue;
                    }
                    else
                    {
                        ddllst.SelectedValue = "0";
                    }
                    td1.Controls.Add(ddllst);
                }
                tr.Controls.Add(td1);
                PlaceHolder.Controls.Add(tr);
                //Add button  after last record  
                if (i == dt.Rows.Count - 1)
                {
                    tr = new HtmlGenericControl("tr"); 
                    td = new HtmlGenericControl("td");
                    Button btnSubmit = new Button();
                    btnSubmit.ID = "btnSubmit";
                    btnSubmit.Click += btnSubmit_Click;
                    //btnSubmit.OnClientClick = "return btnsubmit();";
                    //btnSubmit.OnClientClick = "return ValidateForm();";
                    btnSubmit.Text = "Submit";
                    td.Controls.Add(btnSubmit);
                    td.Attributes.Add("Colspan", "2");
                    td.Attributes.Add("style", "text-align:center;");
                    tr.Controls.Add(td);
                    PlaceHolder.Controls.Add(tr);
                }
            }

        }

    }
    public void Save()
    {
        DataTable dtFormValues = new DataTable();
        dtFormValues.Columns.Add("FormId", typeof(string));//int ashok 
        dtFormValues.Columns.Add("FieldName", typeof(string));
        dtFormValues.Columns.Add("Value", typeof(string));

        DataTable dt = new DataTable();
        dt = CustomFields();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string FieldName = Convert.ToString(dt.Rows[i]["FieldName"]);
                string FieldType = Convert.ToString(dt.Rows[i]["FieldType"]);
                dtFormValues.NewRow();

                if (FieldType.ToLower().Trim() == "textbox")
                {
                    TextBox txtbox = (TextBox)PlaceHolder.FindControl("txt" + FieldName);
                    if (txtbox != null)
                    {
                        //dtFormValues.Rows.Add(txtbox.ClientID, FieldName, txtbox.Text);
                        dtFormValues.Rows.Add(ClientID, FieldName, txtbox.Text);
                        
                    }
                }
                else if (FieldType.ToLower().Trim() == "checkbox")
                {
                    CheckBox checkbox = (CheckBox)PlaceHolder.FindControl("chk" + FieldName);
                    if (checkbox != null)
                    {
                        dtFormValues.Rows.Add(ClientID, FieldName, checkbox.Checked ? "1" : "0");
                    }
                }
                else if (FieldType.ToLower().Trim() == "radiobutton")
                {
                    RadioButtonList radiobuttonlist = (RadioButtonList)PlaceHolder.FindControl("rbnlst" + FieldName);
                    if (radiobuttonlist != null)
                    {
                        dtFormValues.Rows.Add(ClientID, FieldName, radiobuttonlist.SelectedValue);
                    }
                }
                else if (FieldType.ToLower().Trim() == "dropdownlist")
                {
                    DropDownList dropdownlist = (DropDownList)PlaceHolder.FindControl("ddl" + FieldName);
                    if (dropdownlist != null)
                    {
                        dtFormValues.Rows.Add(ClientID, FieldName, dropdownlist.SelectedValue);
                    }
                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Save();
    }
}