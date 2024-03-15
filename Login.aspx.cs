using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter da;
    DataSet ds;
    DataTable dt;
    SqlCommand cmd;
    string IPAddress = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //https://stackoverflow.com/questions/21155352/get-ip-address-of-client-machine
            GetIPAddress();
            GetUserIP();
        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            cmd = new SqlCommand("sp_Login", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ind", 1);
            cmd.Parameters.AddWithValue("@Username", txtusername.Text.ToString());
            cmd.Parameters.AddWithValue("@Password", txtpassword.Text.ToString());
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {

                //Session["Usernam"] = ds.Tables[0].Rows[0]["Username"].ToString();
                //Session["Mobil"] = ds.Tables[0].Rows[0]["Mobile"].ToString();
                //Session["Name"] = ds.Tables[1].Rows[0]["Name"].ToString();
                //Session["Clas"] = ds.Tables[1].Rows[0]["Class"].ToString();
                //Session["fName"] = ds.Tables[2].Rows[0]["FName"].ToString();
                //Session["Locaadd"] = ds.Tables[2].Rows[0]["LocalAddress"].ToString();
                Session["Usernam"] = ds.Tables[0].Rows[0]["Username"].ToString();
                Session["Mobile"] = ds.Tables[0].Rows[0]["Mobile"].ToString();
                Session["frndname"] = ds.Tables[0].Rows[0]["frndname"].ToString();
               
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Yes!', 'Welcome to Master!', 'success');", true);
                   
                }
                //below error come when not add false in below code cursor go to the catch block
                //Unable to evaluate expression because the code is optimized or a native frame is on top of the call stack 
                Response.Redirect("~/HomePage.aspx",false);
            }
           
            else
            {
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oops!', 'Invalid Username And Passward!', 'error');", true);
                }
            }
        }
        catch (Exception )
        {
            throw;
           // Response.Write(ex);
        }
    }
    
    private string GetUserIP()
    {
        string hostName = Dns.GetHostName();
        IPHostEntry ip = Dns.GetHostEntry(hostName);
        string IP = ip.AddressList[0].ToString();
        return "IP Address is : " + IP;
    }

    public string GetIPAddress()
    {
        IPHostEntry Host = default(IPHostEntry);
        string Hostname = null;
        Hostname = System.Environment.MachineName;
        Host = Dns.GetHostEntry(Hostname);
        foreach (IPAddress IP in Host.AddressList)
        {
            if (IP.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
            {
                IPAddress = Convert.ToString(IP);
            }
        }
        return IPAddress;
    }
}