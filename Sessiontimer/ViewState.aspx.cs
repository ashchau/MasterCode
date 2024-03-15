using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Sessiontimer_ViewState : System.Web.UI.Page
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //View State can enable or disable the View State on control level, page level.By default View State is enabled for page.You can enable or disable ViewSate on page level in page directive.You can change EnableViewState value to true or false.
        }
        GenerateDownloadLinks();
        PopulateFileList();
        //Multisearch();
    }

    protected void btnset_Click(object sender, EventArgs e)
    {
        //Value of Textbox1 and TectBox2 is assigin on the ViewState  
        ViewState["name"] = TextBox1.Text;
        ViewState["password"] = TextBox2.Text;
        //after clicking on Button TextBox value Will be Cleared  
        TextBox1.Text = TextBox2.Text = string.Empty;
        Multisearch();
    }

    protected void btnget_Click(object sender, EventArgs e)
    {
        //If ViewState Value is not Null then Value of View State is Assign to TextBox  
        if (ViewState["name"] != null)
        {
            TextBox1.Text = ViewState["name"].ToString();
        }
        if (ViewState["password"] != null)
        {
            TextBox2.Text = ViewState["password"].ToString();
        }
       // string filename = ViewState["fname"].ToString();
    }

    protected void btngetfilename_Click(object sender, EventArgs e)
    {
        string name = Path.GetFileName(FileUpload1.FileName);
        ViewState["fname"] = name;
        //https://stackoverflow.com/questions/14877237/getting-all-file-names-from-a-folder-using-c-sharp
        string Fpath = Server.MapPath("~/PDF/");
       // DirectoryInfo d = new DirectoryInfo(@"D:\Test"); //Assuming Test is your Folder
        DirectoryInfo d = new DirectoryInfo(Fpath); //Assuming Test is your Folder
        FileInfo[] Files = d.GetFiles("*.pdf"); //Getting Text files
        string str = "";
       
        
        foreach (FileInfo file in Files)
        {
            str = str + ", " + file.Name;
            
        }
        lblname.Text = str;
    }

    protected void btnbindpdf_Click(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/questions/355875/Populate-Bind-ASPNet-DropDownList-with-files-from-Folder-Directory-using-C-and-VBNet/
        string folderPath = Server.MapPath("~/PDF/");

        //Check whether Directory (Folder) exists.
        if (!Directory.Exists(folderPath))
        {
            //If Directory (Folder) does not exists. Create it.
            Directory.CreateDirectory(folderPath);
        }

        //Save the File to the Directory (Folder).
        FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
        PopulateFileList();
    }
    private void PopulateFileList()
    {
        DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/PDF/"));
        FileInfo[] fis = di.GetFiles("*.pdf");
        ddlpdf.DataSource = fis;
        ddlpdf.DataTextField = "Name";
        ddlpdf.DataValueField = "Name";
        ddlpdf.DataBind();
        ddlpdf.Items.Insert(0, new ListItem("Select", "0"));
    }
    private void GenerateDownloadLinks()
    {
        string path = Server.MapPath("~/PDF");
        if (Directory.Exists(path))
        {
            DataTable ShowContent = new DataTable();
            ShowContent.Columns.Add("Icon", typeof(string));
            ShowContent.Columns.Add("DownloadLink", typeof(string));
            ShowContent.Columns.Add("FileName", typeof(string));
            DirectoryInfo di = new DirectoryInfo(path);
            foreach (FileInfo fi in di.GetFiles())
            {
                //DataRow dr = ShowContent.NewRow();
                //dr["FileName"] = fi.Name;
                //dr["DownloadLink"] = Server.MapPath("~/PDF/") + fi.Name;
                //string ext = Path.GetExtension(fi.FullName);
                //switch (ext)
                //{
                //    case "png":
                //        dr["Icon"] = ResolveUrl("~/images/PdfIcon.png");
                //        break;
                //    case "doc":
                //        dr["Icon"] = ResolveUrl("~/images/DocIcon.png");
                //        break;
                //    case "xls":
                //        dr["Icon"] = ResolveUrl("~/images/ExcelIcon.png");
                //        break;
                //    case "txt":
                //        dr["Icon"] = ResolveUrl("~/images/TxtIcon.png");
                //        break;
                //    case "zip":
                //        dr["Icon"] = ResolveUrl("~/images/ZipIcon.png");
                //        break;
                //}
                //DataListContent.DataSource = ShowContent;
                //DataListContent.DataBind();
                string fname = fi.Name;
                string dnpath = Server.MapPath("~/PDF/") + fi.Name;
                string ext = Path.GetExtension(fi.FullName);
                string fimg = "";
                switch (ext)
                {
                    case "png":
                        fimg = ResolveUrl("~/images/PdfIcon.png");
                        break;
                    case "doc":
                        fimg = ResolveUrl("~/images/DocIcon.png");
                        break;
                    case "xls":
                        fimg = ResolveUrl("~/images/ExcelIcon.png");
                        break;
                    case "txt":
                        fimg = ResolveUrl("~/images/TxtIcon.png");
                        break;
                    case "zip":
                        fimg = ResolveUrl("~/images/ZipIcon.png");
                        break;
                }
                ShowContent.Rows.Add(fimg,dnpath,fname);
                GridView1.DataSource = ShowContent;
                GridView1.DataBind();
            }
        }
    }
    private void Multisearch()
    {
        //string ename = " ";
        //string id = " ";
        //string salary = " ";
        //if(ddlname.SelectedIndex!=0)
        //{
        //    ename = ddlname.SelectedValue;
        //}
        //else
        //{
        //    ename = " ";
        //}
        //if (ddlid.SelectedIndex != 0)
        //{
        //    id = ddlid.SelectedValue;
        //}
        //else
        //{
        //    id = " ";
        //}
        //if (ddlsalary.SelectedIndex != 0)
        //{
        //    salary =ddlsalary.SelectedValue;
        //}
        //else
        //{
        //    salary = " ";
        //}
        string strcon = ConfigurationManager.ConnectionStrings["Con"].ToString();
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        SqlCommand cmd = new SqlCommand(); 
        cmd.CommandText = "Sp_emp";//sp_multisearch_new
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@empid", ddlid.SelectedValue);
        //cmd.Parameters.AddWithValue("@empname", ddlname.SelectedValue);
        cmd.Parameters.AddWithValue("@empsalary", ddlsalary.SelectedValue);
        //cmd.Parameters.AddWithValue("@empid", id);
        //cmd.Parameters.AddWithValue("@empname", ename);
        //cmd.Parameters.AddWithValue("@empsalary",salary);

        //cmd = new SqlCommand("sp_multisearch", con);
        //cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        else
        {
            GridView2.DataSource = null;
            GridView2.DataBind();
            ddlid.SelectedIndex = 0;
            ddlname.SelectedIndex = 0;
            ddlsalary.SelectedIndex = 0;
        }
    }
}