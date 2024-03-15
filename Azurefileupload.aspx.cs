using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System.Drawing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.IO;
using Microsoft.WindowsAzure.Storage.Auth;
using iTextSharp.text.log;
using DocumentFormat.OpenXml.Drawing.Diagrams;
using Microsoft.Azure;
using System.Net;

public partial class Azurefileupload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //save();
            // DownloadImg();
            DownloadFileFromBlob();
        }
    }
    public void save()
    {
        string connString = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
        CloudStorageAccount storageAccount = CloudStorageAccount.Parse(connString);
        CloudBlobClient cloudBlobClient = storageAccount.CreateCloudBlobClient();
        //CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("univomrimg21/BU");
        //CloudBlockBlob cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference("2804002_267496.jpg");

        CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("univomrimg21/JaipurHeritagePDF/PDF/NitTender");
        // CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("JaipurGreaterPDF/PDF");
        CloudBlockBlob cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference("jmc_Tender_11788.pdf");
        string pdfurl = cloudBlockBlob.Uri.ToString();
        lblmsg.Text = pdfurl;
        //string pdfur2 = cloudBlobContainer.Uri.ToString();
        //string pdfur3 = cloudBlobContainer.StorageUri.PrimaryUri.ToString();
        //string pdfur4 = cloudBlobContainer.StorageUri.SecondaryUri.ToString();
        //prodImg.ImageUrl = cloudBlockBlob.Uri.ToString();

    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        //if (FileUpload1.HasFile)
        //{
        //    FileUpload1.SaveAs(Server.MapPath("~/Resume/") + FileUpload1.FileName);
        //    string path = string.Concat(Server.MapPath("~/File/" + FileUpload1.FileName));
        //    FileUpload1.SaveAs(path);
        //    prodImg.ImageUrl = "~/Resume/" + FileUpload1.FileName;
        //    lblmsg.Text = "Image Uploaded Successfully !!";
        //    lblmsg.ForeColor = Color.Green;
        //    lblmsg.Visible = true;
        //}
        //else
        //{
        //    lblmsg.Text = "Select image first !!";
        //}
        //fileupload();

        Task.Run(async () => await UploadFile());
    }

    public async Task UploadFile()
    {
        //string systemFileName = FileUpload1.FileName;
        //string blobstorageconnection = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
        ////string blobstorageconnection = _configuration.GetValue<string>("BlobConnectionString");
        //// Retrieve storage account from connection string.    
        //CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(blobstorageconnection);
        //// Create the blob client.    
        //CloudBlobClient blobClient = cloudStorageAccount.CreateCloudBlobClient();
        //// Retrieve a reference to a container.    
        //CloudStorageAccount storageAccount = CloudStorageAccount.Parse(blobstorageconnection);
        //CloudBlobClient cloudBlobClient = storageAccount.CreateCloudBlobClient();
        //CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("univomrimg21/JaipurHeritagePDF/PDF/NitTender");
        ////CloudBlobContainer container = blobClient.GetContainerReference(_configuration.GetValue<string>("BlobContainerName"));
        //// This also does not make a service call; it only creates a local object.    
        //CloudBlockBlob blockBlob = cloudBlobContainer.GetBlockBlobReference(systemFileName);

        //using (var data = FileUpload1.OpenReadStream())
        //{
        //    await blockBlob.UploadFromStreamAsync(data);
        //}



        string imageFullPath = null;
        //if (imageToUpload == null || imageToUpload.ContentLength == 0)
        //{
        //    return null;
        //}
        try
        {
            string blobstorageconnection = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
            CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(blobstorageconnection);
            CloudBlobClient cloudBlobClient = cloudStorageAccount.CreateCloudBlobClient();
            CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("univomrimg21/JaipurHeritagePDF/PDF/NitTender");

            //if (await cloudBlobContainer.CreateIfNotExistsAsync())
            //{
            //    await cloudBlobContainer.SetPermissionsAsync(
            //        new BlobContainerPermissions
            //        {
            //            PublicAccess = BlobContainerPublicAccessType.Blob
            //        }
            //        );
            //}
            // CloudBlobContainer blobContainer=new CloudBlobContainer(cloudBlobContainer, blobstorageconnection)
            //string containername = "univomrimg21/JaipurHeritagePDF/PDF/NitTender";
            Uri con = new Uri(blobstorageconnection);
            StorageCredentials storageCredentials = new StorageCredentials("univomrimg21", "Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==");
            CloudBlobClient cc = new CloudBlobClient(con,storageCredentials);
            HttpPostedFile imageToUpload = HttpContext.Current.Request.Files[0];

            string imageName = Guid.NewGuid().ToString() + "-" + Path.GetExtension(imageToUpload.FileName);

            CloudBlockBlob cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference(imageName);
            cloudBlockBlob.Properties.ContentType = imageToUpload.ContentType;
            await cloudBlockBlob.UploadFromStreamAsync(imageToUpload.InputStream);

            imageFullPath = cloudBlockBlob.Uri.ToString();
        }
        catch (Exception ex)
        {

        }
    }




    //public async Task<Uri> UploadFileBlobAsync(string blobContainerName, Stream content, string contentType, string fileName)
    //{
    //    var containerClient = GetContainerClient(blobContainerName);
    //    var blobClient = containerClient.GetBlobClient(fileName);
    //    await blobClient.UploadAsync(content, new BlobHttpHeaders { ContentType = contentType });
    //    return blobClient.Uri;
    //}


    public void fileupload()
    {
        string filename = FileUpload1.FileName.ToString();
        string connString = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
        CloudStorageAccount storageAccount = CloudStorageAccount.Parse(connString);
        CloudBlobClient cloudBlobClient = storageAccount.CreateCloudBlobClient();
        CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("univomrimg21/JaipurHeritagePDF/PDF/NitTender");
        CloudBlockBlob cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference(filename);
        string pdfurl = cloudBlockBlob.Uri.ToString();

        FileUpload1.SaveAs(pdfurl);
        lblmsg.Text = pdfurl;
    }

    public void Method1()
    {
        string connectionString = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
        CloudStorageAccount storageAccount = CloudStorageAccount.Parse(connectionString);
        CloudBlobClient cloudBlobClient = storageAccount.CreateCloudBlobClient();
        CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("univomrimg21/JaipurHeritagePDF/PDF/NitTender");
        // Get a reference to a container named "sample-container" and then create it
        //BlobContainerClient container = new BlobContainerClient(connectionString, "sample-container");
        Uri con = new Uri(connectionString);
        StorageCredentials storageCredentials = new StorageCredentials("univomrimg21", "Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==");
        CloudBlobClient container = new CloudBlobClient(con, storageCredentials);
      
   
        CloudBlockBlob cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference("univomrimg21/JaipurHeritagePDF/PDF/NitTender");
        string containerName = "univomrimg21/JaipurHeritagePDF/PDF/NitTender";
        string blobName = "sample-blob";
        string filePath = "sample-file";
        
       
    }
    public string DeleteFile(string Name)    //https://www.youtube.com/watch?v=0CPF3w_at6M
    {
        string connString = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
        Uri uri = new Uri(Name);
        string filename = Path.GetFileName(uri.LocalPath);
        CloudStorageAccount storageAccount = CloudStorageAccount.Parse(connString);
        CloudBlobClient cloudBlobClient = storageAccount.CreateCloudBlobClient();
        CloudBlobContainer blobContainer = cloudBlobClient.GetContainerReference(filename);
        CloudBlockBlob blob = blobContainer.GetBlockBlobReference(filename);
        blob.Delete();
        return "File Successfully Deleted";
    }
    public void SaveImg()
    {
        string connString = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
        CloudStorageAccount storageAccount = CloudStorageAccount.Parse(connString);
        CloudBlobClient cloudBlobClient = storageAccount.CreateCloudBlobClient();
        CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("univomrimg21/JaipurGreaterLetterMonitoringImages");
        CloudBlockBlob cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference("1_239032800.png");
        //prodImg.ImageUrl = cloudBlockBlob.Uri.ToString();
        //Uri uri = new Uri(cloudBlockBlob.Uri.ToString());
        //CloudBlobClient BlobClient = cloudBlobContainer.GetBlobReference()
       // string filename = Path.GetFileName(uri.LocalPath);
        cloudBlockBlob.DownloadToFile(@"E:\anuj\"+cloudBlockBlob.Name, FileMode.Create);

    }
    public void DownloadImg()
    {
        string connString = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
        CloudStorageAccount storageAccount = CloudStorageAccount.Parse(connString);
        CloudBlobClient cloudBlobClient = storageAccount.CreateCloudBlobClient();
        CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("univomrimg21/JaipurGreaterLetterMonitoringImages");
        CloudBlockBlob cloudBlockBlob = cloudBlobContainer.GetBlockBlobReference("1_239032800.png");
        prodImg.ImageUrl = cloudBlockBlob.Uri.ToString();
        //cloudBlockBlob.DownloadToFile(@"D:\ashok" + cloudBlockBlob.Name, FileMode.Create);

        WebClient wc = new WebClient();
        byte[] a = wc.DownloadData(cloudBlockBlob.Uri.ToString());

        System.Drawing.Image image;
        using (MemoryStream inStream = new MemoryStream())
        {
            inStream.Write(a, 0, a.Length);

            image = Bitmap.FromStream(inStream);
            // image.Save(inStream, System.Drawing.Imaging.ImageFormat.Png);
            image.Save(inStream, image.RawFormat);
        }
    }
    public void Downloadfile()
    {
       // string fileName = "1_239032800.png";
        string path = "http://oswalstorage1.blob.core.windows.net/univomrimg21/JaipurGreaterLetterMonitoringImages/1_239032800.png";
        WebClient webClient = new WebClient();
        byte[] byt = webClient.DownloadData(path);
        string a = Convert.ToBase64String(byt);
        //data:application/pdf
        string all = "data:image/png;base64," + a;// data: image / jpg; base64,
        hrt.HRef = all;
        hrt.Target = "_self";

    }

    protected void btnimgdwl_Click(object sender, EventArgs e)
    {
        Downloadfile();
    }
    private void DownloadFileFromBlob()//string fileName, string containerName, string localFilePath
    {
        string fileName = "1_239032800.png";
        string containerName = "univomrimg21/JaipurGreaterLetterMonitoringImages";
        string localFilePath = @"E:\anuj";
        string connString = "DefaultEndpointsProtocol=http;AccountName=oswalstorage1;AccountKey=Js/pqxMbSkorNIMP6aVghRfgQ6Y7uiv9IqZDm3RRb3Q1Yo5YCl2ea2fNjzeQjzf7RxG+hGjiS5QeVDV0Pc4M1w==;EndpointSuffix=core.windows.net";
        CloudStorageAccount account = CloudStorageAccount.Parse(connString);
        CloudBlobClient blobClient = account.CreateCloudBlobClient();
        CloudBlobContainer container = blobClient.GetContainerReference(containerName);
        CloudBlob blob = container.GetBlobReference(fileName);
        using (var fileStream = File.OpenWrite(localFilePath))//access denied problem
        {
            blob.DownloadToStream(fileStream);
        }
    }
}