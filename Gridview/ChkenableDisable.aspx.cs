using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class Gridview_ChkenableDisable : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    Pl_lotterydoc pl_Lotterydoc;
    protected void Page_Load(object sender, EventArgs e)
    {
        txt1.Text= hdftxt1.Value;
        txt2.Text = hdftxt2.Value;
        txt3.Text = hdftxt3.Value;
        txt4.Text = hdftxt4.Value;
        if (!IsPostBack)
        {
            BinddllwithIncondition();
            BindName();
            BindGrid();
            Binddoc();
            Binddocdownload();
        }
        //https://www.geeksforgeeks.org/jquery-closest-with-examples/
        //https://api.jquery.com/closest/   
    }
    private void BindName()
    {
        SqlConnection con = new SqlConnection();
        ds = new DataSet();
        con.ConnectionString = @"Data Source=dilshad; Initial Catalog=chauhan;integrated security=sspi;";
        SqlCommand cmd = new SqlCommand("SELECT * FROM EMPLOYEE", con);

        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        if (ds.Tables[0].Rows.Count > 0)
        {
            DropDownList1.DataSource = ds.Tables[0];
            DropDownList1.DataTextField = "empname";
            DropDownList1.DataValueField = "empid";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("-- Select Name -- ", "0"));
            //DropDownList1.Items.FindByText("Kamini").Selected = true;//it is also work select by given name
            DropDownList1.Items.FindByValue("6064").Selected = true; //it is also work select by given id

            ddl1.DataSource = ds.Tables[0];
            ddl1.DataTextField = "empid";
            ddl1.DataValueField = "empname";
            ddl1.DataBind();
            ddl1.Items.Insert(0, new ListItem("-- Select Name -- ", "0"));

            ddl2.DataSource = ds.Tables[0];
            ddl2.DataTextField = "empid";
            ddl2.DataValueField = "empname";
            ddl2.DataBind();
            ddl2.Items.Insert(0, new ListItem("-- Select Name -- ", "0"));

            ddl3.DataSource = ds.Tables[0];
            ddl3.DataTextField = "empname";
            ddl3.DataValueField = "empid";
            ddl3.DataBind();
            ddl3.Items.Insert(0, new ListItem("-- Select Name -- ", "0"));

            ddl4.DataSource = ds.Tables[0];
            ddl4.DataTextField = "empname";
            ddl4.DataValueField = "empid";
            ddl4.DataBind();
            ddl4.Items.Insert(0, new ListItem("-- Select Name -- ", "0"));
        }
    }
    private void BindGrid()
    {
        SqlConnection con = new SqlConnection();
        ds = new DataSet();
        con.ConnectionString = @"Data Source=dilshad; Initial Catalog=chauhan;integrated security=sspi;";
        SqlCommand cmd = new SqlCommand("SELECT * FROM EMPLOYEE	where salary is not null", con);

        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridViewEmployee.DataSource = ds.Tables[0];
            GridViewEmployee.DataBind();
        }
        //filter data from dt or list after bind records
        string nm = "8800452620";
        var filteredRows = from n in ds.Tables[0].AsEnumerable()
                           where !n.Field<string>("mobile").Contains(nm)
                           select n;
        var tblnm = filteredRows.CopyToDataTable();

        var filteredTable = (from m in ds.Tables[0].AsEnumerable()
                             where !m.Field<decimal>("salary").Equals(25000)
                             select m).CopyToDataTable();
        var filteredTable1 = (from k in ds.Tables[0].AsEnumerable()
                             where k.Field<decimal>("salary").Equals(25000)
                             select k).CopyToDataTable();
    }
    private void Binddoc()
    {
        SqlConnection con = new SqlConnection();
        ds = new DataSet();
        con.ConnectionString = @"Data Source=dilshad; Initial Catalog=chauhan;integrated security=sspi;";
        SqlCommand cmd = new SqlCommand("select * from uploaddoc", con);

        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        if (ds.Tables[0].Rows.Count > 0)
        {
            grddoc.DataSource = ds.Tables[0];
            grddoc.DataBind();
            //for (int i = 0; i < 2; i++)
            //{
            //    CheckBox chkselect = (CheckBox)grddoc.Rows[i].FindControl("chkdoc");
            //    chkselect.Checked = true;
            //    chkselect.Enabled = false;
            //    FileUpload FileUpload1 = (FileUpload)grddoc.Rows[i].FindControl("FileUploadDoc");
            //    FileUpload1.Enabled = true;
            //}
            for (int i = 0; i < grddoc.Rows.Count; i++)
            {
                HiddenField mandatory = (HiddenField)grddoc.Rows[i].FindControl("hdfmandatory");
                if(mandatory.Value=="1")
                {
                    CheckBox chkselect = (CheckBox)grddoc.Rows[i].FindControl("chkdoc");
                    chkselect.Checked = true;
                    chkselect.Enabled = false;
                    FileUpload FileUpload1 = (FileUpload)grddoc.Rows[i].FindControl("FileUploadDoc");
                    FileUpload1.Enabled = true;
                }
            }
           int ChkDocCount = grddoc.Rows.Cast<GridViewRow>().Count(r => ((CheckBox)r.FindControl("chkdoc")).Checked);
            lblcount.Text ="* Please upload At least "+ Convert.ToString(ChkDocCount)+" Mandatory document";
        }
    }
    private void Binddocdownload()
    {
        SqlConnection con = new SqlConnection();
        ds = new DataSet();
        con.ConnectionString = @"Data Source=dilshad; Initial Catalog=chauhan;integrated security=sspi;";
        SqlCommand cmd = new SqlCommand("SELECT * FROM mst_uploaddoc", con);

        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        if (ds.Tables[0].Rows.Count > 0)
        {
            grddownload.DataSource = ds.Tables[0];
            grddownload.DataBind();
            for (int i = 0; i < grddownload.Rows.Count; i++)
            {
                Label fname = (Label)grddownload.Rows[i].FindControl("lbldocname");
                HiddenField vpath = (HiddenField)grddownload.Rows[i].FindControl("hdfpath");
                HyperLink hrt = (HyperLink)grddownload.Rows[i].FindControl("hyldownload");
                string path = vpath.Value;
                string docname = Path.GetFileName(path);
                string extension = Path.GetExtension(docname);//how to get file extention
                string mimeType = MimeMapping.GetMimeMapping(path); //Howto get file mime type
                string filename = Path.GetFileNameWithoutExtension(path);//how to get file name without extention
                WebClient webClient = new WebClient();
                byte[] byt = webClient.DownloadData(path);
                string a = Convert.ToBase64String(byt);
                string all = "data:" + mimeType + ";base64," + a;// data: image / jpg; base64,
                hrt.NavigateUrl = all;
                hrt.Attributes.Add("download", filename);//docname
                hrt.Target = "_self";
            }
        }
    }

    protected void GridViewEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //this is is also run successfully
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    CheckBox checkBox = (CheckBox)e.Row.FindControl("chkSelect");
        //    Button button = (Button)e.Row.FindControl("Button1");
        //    checkBox.Attributes.Add("onclick", "if(this.checked){document.getElementById('" + button.ClientID + "').disabled=false;}else{document.getElementById('" + button.ClientID + "').disabled=true;}");
        //}
    }

    protected void btnsavedoc_Click(object sender, EventArgs e)
    {
        pl_Lotterydoc = new Pl_lotterydoc();
        DataTable dtDocument = new DataTable();
        int chkAppdoc = 0;
        int numOfChkDoc = 0;
        if (grddoc.Rows.Count>0)
        {
            numOfChkDoc = grddoc.Rows.Cast<GridViewRow>().Count(r => ((CheckBox)r.FindControl("chkdoc")).Checked);
            for (int i = 0; i < grddoc.Rows.Count; i++)
            {
                CheckBox chkDoc = (CheckBox)grddoc.Rows[i].FindControl("chkdoc");
                if (chkDoc.Checked)
                {
                    FileUpload FileUpload = (FileUpload)grddoc.Rows[i].FindControl("FileUploadDoc");
                    HiddenField lblDocId = (HiddenField)grddoc.Rows[i].FindControl("hdDocid");
                    HiddenField lblDocName = (HiddenField)grddoc.Rows[i].FindControl("hdDocDesc");
                    if (lblDocId.Value == "1")
                    {
                        chkAppdoc = 1;
                    }
                    if (FileUpload.HasFile)
                    {
                        string uploadfilename = FileUpload.FileName;
                        bool isvalid = BindDocDtImageSign(ref dtDocument, FileUpload, Convert.ToInt32(txtcid.Text),txtcname.Text, lblDocName.Value, uploadfilename, Convert.ToInt32(lblDocId.Value), (Convert.ToInt32(lblDocId.Value) == 1 ? false : true));
                        if (isvalid)
                        {

                        }
                        else
                        {
                            break;
                        }
                    }
                    else
                    {
                        dtDocument = new DataTable();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Required Document Which  are checked')", true);

                        return;
                    }
                }
                
            }
            //second step
            if (chkAppdoc == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Application and Required Documents ')", true);
                return;
            }

            if (dtDocument == null || dtDocument.Rows.Count == 0 || dtDocument.Rows.Count != numOfChkDoc)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Required Document')", true);
                return;
            }
        }
        //step 3 save record by type table
        pl_Lotterydoc.Ind = 1;
        pl_Lotterydoc.dtDocImagePhoto = dtDocument;
        DataTable dt = CommonCallApi.CallApiPostDt("Login/ApiSave", pl_Lotterydoc);
    }
    bool BindDocDtImageSign(ref DataTable dtDocImagePhoto, FileUpload fileupd, int clientid, string clientname, string docname, string uploadfilename,  int docid, bool isimg)
    {
       // bool isValid = false;
        if (docid == 1)
        {
            if (fileupd.FileName == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Application Form !')", true);
                return false;
            }
            else
            {

                string ext = System.IO.Path.GetExtension(fileupd.FileName);
                if (ext == ".pdf" || ext == "pdf")
                {
                    if (fileupd.PostedFile.ContentLength > 716800)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Application Form Max Size 700 KB')", true);
                        return false;
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Application Form Only in PDF Format')", true);
                    return false;
                }
            }
        }
        else
        {
            string ext = System.IO.Path.GetExtension(fileupd.FileName);

            if (ext == ".pdf" || ext == "pdf")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select ONLY .JPG,.PNG,JPEG FORMAT Other than Application form ')", true);
                return false;
            }

            if (ext != ".pdf" || ext != "pdf")
            {
                if (fileupd.PostedFile.ContentLength > 216800)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Image Max Size UP TO 200 KB')", true);
                    return false;
                }
            }
        }

        string Virtualfolder = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + "/" + "Gridview/LotteryProcessFiles/" + clientid + "/" + docid + "/";
        string Physicalfolder = Server.MapPath("~/Gridview/LotteryProcessFiles/" + clientid + "/" + docid + "/");


        string VirtualPath = "";
        string physicalPath = "";
        if (isimg)
        {
            VirtualPath = Virtualfolder + "/IMG_" + clientid + "_" + docid + ".jpeg";
            physicalPath = Physicalfolder + @"\IMG_" + clientid + "_" + docid + ".jpeg";
        }
        else
        {
            VirtualPath = Virtualfolder + "/PDF_" + clientid + "_" + docid + ".pdf";
            physicalPath = Physicalfolder + @"\PDF_" + clientid + "_" + docid + ".pdf";
        }
        if (dtDocImagePhoto == null || dtDocImagePhoto.Columns.Count == 0)
        {
            dtDocImagePhoto = new DataTable();
            dtDocImagePhoto.Columns.Add("clientid");
            dtDocImagePhoto.Columns.Add("clientname");
            dtDocImagePhoto.Columns.Add("docname");
            dtDocImagePhoto.Columns.Add("docid");
            dtDocImagePhoto.Columns.Add("virtualpath");
            dtDocImagePhoto.Columns.Add("physicalpath");
            dtDocImagePhoto.Columns.Add("uploadfilename");
        }
        DataRow dr = dtDocImagePhoto.NewRow();
        dr["clientid"] = clientid;
        dr["clientname"] = clientname;
        dr["docname"] = docname;
        dr["docid"] = docid;

        if (!Directory.Exists(Physicalfolder))
        {
            Directory.CreateDirectory(Physicalfolder);
        }
        if (fileupd.HasFile)
        {
            if (isimg)
            {
                fileupd.PostedFile.SaveAs(physicalPath);
            }
            else
            {
                fileupd.PostedFile.SaveAs(physicalPath);
            }
        }
        byte[] bytes;
        string imageUrl = "";
        if (isimg)
        {
            using (BinaryReader br = new BinaryReader(fileupd.PostedFile.InputStream))
            {
                bytes = br.ReadBytes(fileupd.PostedFile.ContentLength);
            }
            imageUrl = "data:image/jpg;base64," + Convert.ToBase64String(bytes);
        }

        dr["virtualpath"] = VirtualPath;
        dr["physicalpath"] = physicalPath;
        dr["uploadfilename"] =uploadfilename;
        dtDocImagePhoto.Rows.Add(dr);
        dtDocImagePhoto.AcceptChanges();
        return true;
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
       
    }

    protected void txtbasic_TextChanged(object sender, EventArgs e)
    {
        txtbasic.Text = Convert.ToString(Convert.ToDouble(txtbasic.Text));
        txthra.Text=Convert.ToString (Convert.ToDouble(txtbasic.Text)*0.05); //5% HRA
        txtpf.Text=Convert.ToString (Convert.ToDouble(txtbasic.Text) * 0.12);//12% PF
        txttotal.Text = Convert.ToString(Convert.ToDouble(txtbasic.Text) + Convert.ToDouble(txthra.Text) + Convert.ToDouble(txtpf.Text));
    }

    protected void txthra_TextChanged(object sender, EventArgs e)
    {
        //txtbasic_TextChanged(sender, e);
        //txtbasic_TextChanged(null, null);
        //txtbasic.Text = Convert.ToString(Convert.ToDouble(txtbasic.Text) + Convert.ToDouble(txthra.Text));
        //txtpf.Text = Convert.ToString(Convert.ToDouble(txtbasic.Text) * 0.12);
         txttotal.Text = Convert.ToString(Convert.ToDouble(txtbasic.Text) + Convert.ToDouble(txthra.Text) + Convert.ToDouble(txtpf.Text));
    }
    public void GetdatabyReader()
    {
        using (SqlConnection connection = new SqlConnection("connection string here"))
        {
            using (SqlCommand command = new SqlCommand("SELECT Column1 FROM Table1; SELECT Column2 FROM Table2", connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string s = reader.GetString(0);
                    }

                    reader.NextResult();

                    while (reader.Read())
                    {
                        string s2 = reader.GetString(0);
                    }
                }
            }
        }
    }
    public void BinddllwithIncondition()
    {
        string con = ConfigurationManager.ConnectionStrings["Con"].ToString();
        string ccode = "12,2,3,4";
        using (SqlConnection connection = new SqlConnection(con))
        {
            using (SqlCommand cmd = new SqlCommand("Sp_ApiCrud", connection))
            {
                cmd.Parameters.AddWithValue("@Ind", 9);
                cmd.Parameters.AddWithValue("@empname", ccode);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
            }
        }
    }
}