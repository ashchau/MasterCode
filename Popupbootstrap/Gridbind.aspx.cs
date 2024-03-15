using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public partial class Popupbootstrap_Gridbind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindColumnToGridview();
        }
       
    }
    private void BindColumnToGridview()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("UserId");
        dt.Columns.Add("UserName");
        dt.Columns.Add("Location");
        dt.Rows.Add();
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
        gvDetails.Rows[0].Visible = false;
    }
    [WebMethod]
    public static UserDetails[] BindDatatable()
    {
        DataTable dt = new DataTable();
        List<UserDetails> details = new List<UserDetails>();
        
        using (SqlConnection con = new SqlConnection("Data Source=dilshad;Initial Catalog=chauhan;Integrated Security=true"))
        {
            // using (SqlCommand cmd = new SqlCommand("select TOP 10 UserId,UserName,Location from UserInformation", con))
            using (SqlCommand cmd = new SqlCommand("select * from UserInformation", con))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dtrow in dt.Rows)
                {
                    UserDetails user = new UserDetails();
                    user.UserId = dtrow["UserId"].ToString();
                    user.UserName = dtrow["UserName"].ToString();
                    user.Location = dtrow["Location"].ToString();
                    user.pdf = dtrow["pdf"].ToString();
                    details.Add(user);
                }
            }
        }
        return details.ToArray();
    }
    public class UserDetails
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Location { get; set; }
        public string pdf { get; set; }
    }
}