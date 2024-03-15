using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRUD_PdfImagePreview : System.Web.UI.Page
{
    businesslogic objbl;
    DataSet ds;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        //https://www.webcodeexpert.com/2015/11/maintain-scroll-position-of.html
        if (!IsPostBack)
        {
            show();
            Grdfill();
            Bindimggrd();
        }
    }
    protected void btnshow_Click(object sender, EventArgs e)
    {
        UpdatePanel1.Visible = true;
    }
    protected void show()
    {
        objbl = new businesslogic();
        dt = new DataTable();
        dt = objbl.DtGridveiw(6, "Sp_Employee");
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected void Grdfill()
    {
        objbl = new businesslogic();
        dt = new DataTable();
        dt = objbl.DtGridveiw(8, "Sp_Employee");
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
    }

    protected void Bindimggrd()
    {
        objbl = new businesslogic();
        dt = new DataTable();
        dt = objbl.DtGridveiw(9, "Sp_Employee");
        if (dt.Rows.Count > 0)
        {
            gvImages.DataSource = dt;
            gvImages.DataBind();
        }
    }
  

    protected void btnupload_Click(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/Articles/How-to-save-insert-Image-in-Database-in-ASPNet-using-C-and-VBNet.aspx
        //https://www.aspsnippets.com/Articles/Download-Save-VARBINARY-Data-as-File-in-ASPNet-using-C-and-VBNet.aspx
        byte[] bytes;
        using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
        {
            bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
        }
        string constr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(constr))
        {
            string sql = "INSERT INTO tblimgsave VALUES(@imgname, @ContentType, @imgdata)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@imgname", Path.GetFileName(FileUpload1.PostedFile.FileName));
                cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                cmd.Parameters.AddWithValue("@imgdata", bytes);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void gvImages_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;
            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["imgdata"]);
            (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            HyperLink a= e.Row.FindControl("HyperLink1") as HyperLink;

            
            string fileNm = "test.png";
            WebClient req = new WebClient();
            string str = Convert.ToBase64String((byte[])dr["imgdata"]);
           // string txtFilePath = Convert.ToBase64String(str);
            a.NavigateUrl = "data:image/jpg;base64," + str;
            //a.Target = "_self";
            a.Attributes.Add("download", fileNm);
        }
    }
}