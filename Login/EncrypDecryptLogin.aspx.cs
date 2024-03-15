using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;
using System.Security.Cryptography;
public partial class Login_EncrypDecryptLogin : System.Web.UI.Page
{
    private const string strconneciton = "Data Source=dilshad;Initial Catalog=chauhan;Integrated Security=True";
    SqlConnection con = new SqlConnection(strconneciton);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/Articles/Encrypt-and-Decrypt-Username-or-Password-stored-in-database-in-ASPNet-using-C-and-VBNet.aspx
        //https://www.aspdotnet-suresh.com/2010/12/introduction-here-i-will-explain-how-to_28.html
        if (!IsPostBack)
        {
            BindencryptedData();
            BindDecryptedData();
            
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string strpassword = Encryptdata(txtPassword.Text);
        con.Open();
        cmd = new SqlCommand("sp_LoginEncrpt", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", 2);
        cmd.Parameters.AddWithValue("@username", txtname.Text);
        cmd.Parameters.AddWithValue("@loginid", txtid.Text);
        cmd.Parameters.AddWithValue("@pwd", strpassword);
        cmd.ExecuteNonQuery();
        con.Close();
        BindencryptedData();
        BindDecryptedData();
    }
    /// <summary>
    /// Bind user Details to gridview
    /// </summary>
    protected void BindencryptedData()
    {
        con.Open();
        cmd = new SqlCommand("sp_LoginEncrpt", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", 1);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        gvUsers.DataSource = ds;
        gvUsers.DataBind();
        con.Close();
    }
    /// <summary>
    /// Bind user Details to gridview
    /// </summary>
    protected void BindDecryptedData()
    {
        con.Open();
        cmd = new SqlCommand("sp_LoginEncrpt", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ind", 1);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        gvUsers.DataSource = ds;
        gvUsers.DataBind();
        con.Close();
    }
    /// <summary>
    /// Function is used to encrypt the password
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    private string Encryptdata(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
    }
    /// <summary>
    /// Function is used to Decrypt the password
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    private string Decryptdata(string encryptpwd)
    {
        string decryptpwd = string.Empty;
        UTF8Encoding encodepwd = new UTF8Encoding();
        Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        return decryptpwd;
    }
    /// <summary>
    /// rowdatabound condition is used to change the encrypted password format to decryption format
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string decryptpassword = e.Row.Cells[3].Text;
            e.Row.Cells[3].Text = Decryptdata(decryptpassword);
        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
            SqlCommand cmd = new SqlCommand("sp_LoginEncrpt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@ind", 3);
            cmd.Parameters.AddWithValue("@loginid", txtid.Text.Trim());
            cmd.Parameters.AddWithValue("@pwd", Encryptdata(txtPassword.Text.Trim()));
            cmd.ExecuteNonQuery();
        //int Username = (Int32)cmd.ExecuteScalar();
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count>0)
            {
                Session["Username"] = ds.Tables[0].Rows[0]["username"];
            lblMessage.Text = "";
            Response.Redirect("Encrypt_Login.aspx");
                Session.RemoveAll();

            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid username and password";
            }
    }
}