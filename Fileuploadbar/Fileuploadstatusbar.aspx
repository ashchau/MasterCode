<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fileuploadstatusbar.aspx.cs" Inherits="Fileuploadbar_Fileuploadstatusbar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>File upload status</title>
    <script src="JS/jquery.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script>
    var counter;
    function UploadFile() {
        var files = $("#<%=file1.ClientID%>").get(0).files;
        counter = 0;
  
        // Loop through files
        for (var i = 0; i < files.length ; i++) {
            var file = files[i];
            var formdata = new FormData();
            formdata.append("file1", file);
            var ajax = new XMLHttpRequest();
      
            ajax.upload.addEventListener("progress", progressHandler, false);
            ajax.addEventListener("load", completeHandler, false);
            ajax.addEventListener("error", errorHandler, false);
            ajax.addEventListener("abort", abortHandler, false);
            ajax.open("POST", "fileuploadhandler.ashx");
            ajax.send(formdata);
        }
    }
  
    function progressHandler(event) {
        $("#loaded_n_total").html("Uploaded " + event.loaded + " bytes of " + event.total);
        var percent = (event.loaded / event.total) * 100;
        $("#progressBar").val(Math.round(percent));
        $("#status").html(Math.round(percent) + "% uploaded... please wait");
    }
  
    function completeHandler(event) {
        counter++
        $("#status").html(counter + " " + event.target.responseText);
    }
  
    function errorHandler(event) {
        $("#status").html("Upload Failed");
    } 
  
    function abortHandler(event) {
        $("#status").html("Upload Aborted");
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="file1" runat="server" AllowMultiple="true" /><br/>
            <input type="button" value="Upload File" onclick="UploadFile()" runat="server" />

            <progress id="progressBar" value="0" max="100" style="width: 300px;"></progress>
            <h3 id="status"></h3>
            <p id="loaded_n_total"></p>
        </div>
</form>
</body>
</html>
