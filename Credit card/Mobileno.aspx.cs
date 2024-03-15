using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Credit_card_Mobileno : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            showstarno();
            gridshow();
        }
    }

    protected void HideCharacters(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/questions/607688/Mask-Credit-Card-Number-Show-only-the-last-four-digit-of-a-credit-card-number-C/
          this.lblCreditCardNum.Text = string.Format("************{0}", this.txtCreditCardNum.Text.Trim().Substring(6, 4));
    }
    public void showstarno()
    {
        this.lblCreditCardNum.Text = string.Format("************{0}", this.txtCreditCardNum.Text.Trim().Substring(6, 4));
    }
    public void gridshow()
    {
        //https://www.aspsnippets.com/questions/607688/Mask-Credit-Card-Number-Show-only-the-last-four-digit-of-a-credit-card-number-C/
        string conn = ConfigurationManager.ConnectionStrings["con"].ToString();
        SqlConnection Con = new SqlConnection(conn);
        SqlCommand cmd = new SqlCommand("select * from employee",Con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
       
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Label str = (Label)GridView1.Rows[i].FindControl("lblmobile");
            //if(str.Text.Length==12)
            //{
            //    str.Text = string.Format("********{0}", str.Text.Trim().Substring(8, 4));
            //}
            //else
            //{ 
            //str.Text = string.Format("******{0}", str.Text.Trim().Substring(6, 4));
            //}
            //str.Text = string.Format("******{0}", str.Text.Trim().Substring(6, 4));
            string j = new string('*',  str.Text.Length - 4) + new string(str.Text.Skip(str.Text.Length - 4).ToArray());
            str.Text = j;
            //https://stackoverflow.com/questions/9035192/mask-out-part-first-12-characters-of-string-with/9037991
            //below code also work 
            //int l = str.Text.Length;
            //str.Text = str.Text.Substring(l - 4);
            //string r = new string('*', l - 4);
            //r = r + str.Text;
            //str.Text = r;

            GridView1.Rows[i].FindControl("lblmobile");
            
        }
    }
}