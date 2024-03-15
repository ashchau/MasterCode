using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using ZXing;
public partial class CaptchaCode_QRCode : System.Web.UI.Page
{
    internal static int Length;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    protected void btnRead_Click(object sender, EventArgs e)
    {
        //ReadQRCode();
        ReadQRCode1();
    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
       // GenerateCode(txtCode.Text);
        GenerateQRCode(txtCode.Text.Trim());
    }
    // Generate QRCode
    private void GenerateCode(string name)
    {
        //https://www.aspdotnet-suresh.com/2017/04/aspnet-generate-and-read-qr-code-in-web-application-using-csharp-vbnet.html
        var writer = new BarcodeWriter();
        writer.Format = BarcodeFormat.QR_CODE;
        var result = writer.Write(name);
        string path = Server.MapPath("~/images/QRImage.jpg");
        var barcodeBitmap = new Bitmap(result);

        //string pathnew = Server.MapPath("~/image/QRImage.jpg");//this is the new img save in this location

        using (MemoryStream memory = new MemoryStream())
        {
            using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.ReadWrite))//pathnew
            {
                barcodeBitmap.Save(memory, ImageFormat.Jpeg);
                byte[] bytes = memory.ToArray();
                fs.Write(bytes, 0, bytes.Length);
            }
        }
        imgQRCode.Visible = true;
        imgQRCode.ImageUrl = "~/images/QRImage.jpg";

    }
    // Read Code from QR Image
    private void ReadQRCode()
    {
        var reader = new BarcodeReader();
        string filename = Path.Combine(Request.MapPath("~/images"), "QRImage.jpg");
        // Detect and decode the barcode inside the bitmap
        var result = reader.Decode(new Bitmap(filename));
        if (result != null)
        {
            lblQRCode.Text = "QR Code: " + result.Text;
        }
    }
    private string GenerateQRCode(string qrcodeText)
    {
        //https://qawithexperts.com/article/asp-net/qr-code-generator-in-aspnet-c-mvc/107
        string folderPath = "~/Images/";
        string imagePath = "~/Images/QrCode.jpg";
        // If the directory doesn't exist then create it.
        if (!Directory.Exists(Server.MapPath(folderPath)))
        {
            Directory.CreateDirectory(Server.MapPath(folderPath));
        }

        var barcodeWriter = new BarcodeWriter();
        barcodeWriter.Format = BarcodeFormat.QR_CODE;
        var result = barcodeWriter.Write(qrcodeText);

        string barcodePath = Server.MapPath(imagePath);
        var barcodeBitmap = new Bitmap(result);
        using (MemoryStream memory = new MemoryStream())
        {
            using (FileStream fs = new FileStream(barcodePath, FileMode.Create, FileAccess.ReadWrite))
            {
                barcodeBitmap.Save(memory, ImageFormat.Jpeg);
                byte[] bytes = memory.ToArray();
                fs.Write(bytes, 0, bytes.Length);
            }
        }
        imgQRCode.Visible = true;
        imgQRCode.ImageUrl = "~/images/QrCode.jpg"; 
        return imagePath;
    }
    private void ReadQRCode1() //QRCodeModel
    {
       // QRCodeModel barcodeModel = new QRCodeModel();
       // string barcodeText = "";
        string imagePath = "~/Images/QrCode.jpg";
        string barcodePath = Server.MapPath(imagePath);
        var barcodeReader = new BarcodeReader();

        var result = barcodeReader.Decode(new Bitmap(barcodePath));
        if (result != null)
        {
            lblQRCode.Text = result.Text;
        }
        //return new QRCodeModel() { QRCodeText = barcodeText, QRCodeImagePath = imagePath };
    }
}