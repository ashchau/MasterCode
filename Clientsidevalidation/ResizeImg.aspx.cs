using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
public partial class Clientsidevalidation_ResizeImg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showimg();
        }
    }
    protected void btnresize_Click(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/questions/556596/Resize-Image-and-maintain-file-size-in-ASPNet-using-C-and-VBNet/
        //below code for how to get img height,width size
        //System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
        //int height = img.Height;
        //int width = img.Width;
        //decimal imgsize = Math.Round(((decimal)FileUpload1.PostedFile.ContentLength / (decimal)1024), 2);

        HttpPostedFile files = FileUpload1.PostedFile;
        string imgName = Path.GetFileName(files.FileName);
        string imgPath1 = "~/Resume/" + imgName;
        int widthC = 1000;
        int heightC = 1000;
        Stream streamC = files.InputStream;
        using (Bitmap imageC = new Bitmap(streamC))
        {
            using (Bitmap targetC = new Bitmap(widthC, heightC, PixelFormat.Format24bppRgb))
            {
                using (Graphics graphicC = Graphics.FromImage(targetC))
                {
                    graphicC.SmoothingMode = SmoothingMode.AntiAlias;
                    graphicC.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    graphicC.PixelOffsetMode = PixelOffsetMode.HighQuality;
                    graphicC.CompositingQuality = CompositingQuality.HighSpeed;
                    graphicC.CompositingMode = CompositingMode.SourceCopy;
                    graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                    targetC.Save(Server.MapPath(imgPath1), ImageFormat.Jpeg);
                }
            }
        }
    }
    public bool ThumbnailCallback()
    {
        return false;
    }
    protected void btnGenerateThumbnail_Click(object sender, EventArgs e)
    {
        //https://www.aspsnippets.com/Articles/Resize-image-on-the-fly-and-maintain-keep-Aspect-Ratio-in-ASPNet.aspx
        string path = Server.MapPath("~/Resume/lichi.jpg");
        System.Drawing.Image image = System.Drawing.Image.FromFile(path);
        using (System.Drawing.Image thumbnail = image.GetThumbnailImage(100, 100, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero))
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                thumbnail.Save(memoryStream, ImageFormat.Png);
                Byte[] bytes = new Byte[memoryStream.Length];
                memoryStream.Position = 0;
                memoryStream.Read(bytes, 0, (int)bytes.Length);
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                Image2.ImageUrl = "data:image/png;base64," + base64String;
                Image2.Visible = true;
            }
        }
    }
   protected void showimg()
    {
        //https://www.c-sharpcorner.com/UploadFile/ishbandhu2009/resize-an-image-in-C-Sharp/
        //https://www.encodedna.com/2014/07/how-to-resize-an-image-using-aspdotnet-without-losing-quality.htm
        //https://codepedia.info/how-to-resize-image-while-uploading-in-asp-net-using-c
        string path = Server.MapPath("~/Resume");
        System.Drawing.Image img = System.Drawing.Image.FromFile(string.Concat(path, "/Jp_Cm.jpg"));
        //string imgName = Path.GetFileName(files.FileName);
        Bitmap b = new Bitmap(img);
        System.Drawing.Image i = resizeImage(b, new Size(100, 100));
        Bitmap Newimg = new Bitmap(i);
        string NewimgPath = "~/Resume/" + "NewImg.jpg";
        Newimg.Save(Server.MapPath(NewimgPath), ImageFormat.Jpeg);
    }
    private static System.Drawing.Image resizeImage(System.Drawing.Image imgToResize, Size size)
    {
        //Get the image current width  
        int sourceWidth = imgToResize.Width;
        //Get the image current height  
        int sourceHeight = imgToResize.Height;
        float nPercent = 0;
        float nPercentW = 0;
        float nPercentH = 0;
        //Calulate  width with new desired size  
        nPercentW = ((float)size.Width / (float)sourceWidth);
        //Calculate height with new desired size  
        nPercentH = ((float)size.Height / (float)sourceHeight);
        if (nPercentH < nPercentW)
            nPercent = nPercentH;
        else
            nPercent = nPercentW;
        //New Width  
        int destWidth = (int)(sourceWidth * nPercent);
        //New Height  
        int destHeight = (int)(sourceHeight * nPercent);
        Bitmap b = new Bitmap(destWidth, destHeight);
        Graphics g = Graphics.FromImage((System.Drawing.Image)b);
        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
        // Draw image with new width and height  
        g.DrawImage(imgToResize, 0, 0, destWidth, destHeight);
        //b.Save(Server.MapPath("p"), ImageFormat.Jpeg);
        g.Dispose();
        return (System.Drawing.Image)b;
    }
    

}