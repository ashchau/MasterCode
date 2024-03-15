using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Login_LoginLockeAccount : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    bool LockStatus;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            //Session["Invalidloginattempt"] = null;
        }
        else
        {
            Session["Invalidloginattempt"] = null;
        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        
        string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(constr);
        string Loginquery = "select * from UserLogin where UserName='" + txtname.Text.Trim() + "'";
        cmd = new SqlCommand(Loginquery,con);
        da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string Uname;
        string Upass;
        DateTime Lockdatetime = DateTime.Now;
        if (ds.Tables[0].Rows.Count==0)
        {
            lblmsg.Text = "Invalid User Name or Password";
        }
        else
        {
            Uname = ds.Tables[0].Rows[0]["UserName"].ToString();
            Upass = ds.Tables[0].Rows[0]["Password"].ToString();
            LockStatus =Convert.ToBoolean( ds.Tables[0].Rows[0]["LockedStatus"].ToString());
            if(LockStatus==true)
            {
                Lockdatetime =Convert.ToDateTime( ds.Tables[0].Rows[0]["LockDateTime"].ToString());
                Lockdatetime = Convert.ToDateTime(Lockdatetime.ToString("dd/MM/yyyy HH:mm:ss")); //MM/dd/yyyy HH:mm:ss ->change formate according to your sys datetime fromat
            }
            con.Close();
            if(LockStatus==true)
            {
                DateTime cdatetime = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));//MM/dd/yyyy HH:mm:ss
                TimeSpan ts = cdatetime.Subtract(Lockdatetime);
                Int32 minuteslock = Convert.ToInt32(ts.TotalMinutes);
                Int32 pendingminutes = 15 - minuteslock;//Login after 15 minutes..>15 - minuteslock;
                if (pendingminutes<=0)
                {
                    UnlockAcount();
                    if (Uname == txtname.Text.Trim() && Upass == txtpassword.Text.Trim())
                    {
                        Session["username"] = Uname;
                       // Session["Invalidloginattempt"] = null;
                        Response.Redirect("/Demo.aspx");
                    }
                }
                else
                {
                    lblLockmsg.Text = "Your Account hase been lock for 15 minutes for 3 invalid attempts. Your account will be unlock automatically after  "+pendingminutes+" minutes";
                }
            }
            else
            {
                if(Uname==txtname.Text.Trim() && Upass==txtpassword.Text.Trim())
                {
                    Session["username"] = Uname;
                    Session["Invalidloginattempt"] = null;
                    Response.Redirect("/Demo.aspx");
                }
                else
                {
                    int attemptcount;
                    if(Session["Invalidloginattempt"]!=null)
                    {
                        attemptcount = Convert.ToInt16(Session["Invalidloginattempt"].ToString());
                        attemptcount = attemptcount + 1;
                    }
                    else
                    {
                        attemptcount = 1;
                    }
                    Session["Invalidloginattempt"] = attemptcount;
                    if(attemptcount==3)
                    {
                        lblLockmsg.Text = "Your Account hase been lock for 15 minutes for 3 invalid attempts. Your account will be unlock automatically after 15 minutes";
                        ChangeLockStatus();
                    }
                    else
                    {
                        lblLockmsg.Text = "Invalid user name or password-Reloin. You have "+ (3-attemptcount) + " remaining to login ";
                    }
                }
            }
        }
           
    }
    void ChangeLockStatus()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(constr);
        con.Open();
        string Dateformat = "yyyy/MM/dd HH:mm:ss";//MM/dd/yyyy HH:mm:ss
        string Updatequery = "Update UserLogin set LockedStatus=1,LockDateTime='" + DateTime.Now.ToString(Dateformat)+ "' where UserName='"+txtname.Text.Trim()+"'  ";
        //string Updatequery = "Update UserLogin set LockedStatus=1,LockDateTime='" + DateTime.Now.ToString() + "' where UserName='" + txtname.Text.Trim() + "'  ";

        cmd = new SqlCommand(Updatequery, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    void UnlockAcount()
    {
        string constr = ConfigurationManager.ConnectionStrings["Con"].ToString();
        con = new SqlConnection(constr);
        con.Open();
        string Updatequery = "Update UserLogin set LockedStatus=0,LockDateTime=NULL where UserName='" + txtname.Text.Trim() + "'  ";
        cmd = new SqlCommand(Updatequery, con);
        cmd.ExecuteNonQuery();
        Session["Invalidloginattempt"] = null;
        con.Close();
    }
}