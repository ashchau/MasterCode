using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Text;
using System.Security.Cryptography;

public partial class Login_Encrypt_Login : System.Web.UI.Page
{
    //string conn = ConfigurationManager.ConnectionStrings["Con"].ToString();
    SqlConnection con = new SqlConnection(@"Data Source=dilshad;Database=chauhan;Integrated Security=True;");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["Username"] == null || Session["Username"].ToString()== "")
            {
                lblmsg.Text = "Default user";
                //Response.Redirect("EncrypDecryptLogin.aspx");
            }
            else
            {
                lblmsg.Text = Session["Username"].ToString();
            }
        }
    }

    protected void btnloin_Click(object sender, EventArgs e)
    {
        string strpass = Base64Encode(pwd.Text);
        SqlCommand cmd = new SqlCommand("insert into tbllogin(loginid,username,password) values(@email,@name,@pass)", con);
        cmd.Parameters.AddWithValue("@name", txtname.Text);
        cmd.Parameters.AddWithValue("@email", loginid.Text);
        cmd.Parameters.AddWithValue("@pass", strpass);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i != 0)
        {
            lblmsg.Text = "Registration Complete";
            lblmsg.ForeColor = System.Drawing.Color.ForestGreen;
        }
        else
        {
            lblmsg.Text = "Error while Registring";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    public string encryptpass(string password)
    {
        string msg = "";
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        msg = Convert.ToBase64String(encode);
        return msg;
    }
    private string Encryptdata(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
    }
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }
    public static string Base64Encode(string Password)
    {
        var passwordBytes = System.Text.Encoding.UTF8.GetBytes(Password);
        return System.Convert.ToBase64String(passwordBytes);
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {

    }
}