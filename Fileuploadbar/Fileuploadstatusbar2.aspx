<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fileuploadstatusbar2.aspx.cs" Inherits="Fileuploadbar_Fileuploadstatusbar2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .progressbar
        {
            width: 300px;
            height: 8px;
        }
        .progressbarlabel
        {
            width: 300px;
            height: 8px;
            position: absolute;
            text-align: center;
            font-size: small;
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#FileUploadpost").change(function (evt) {
                var xhr = new XMLHttpRequest();
                var data = new FormData();
                var files = $("#FileUploadpost").get(0).files;
                for (var i = 0; i < files.length; i++) {
                    data.append(files[i].name, files[i]);
                }
                xhr.upload.addEventListener("progress", function (evt) {
                    if (evt.lengthComputable) {
                        var progress = Math.round(evt.loaded * 100 / evt.total);
                        $("#progressbar").progressbar("value", progress);
                    }
                }, false);
                xhr.open("POST", "Uploader.ashx");
                xhr.send(data);
 
                $("#progressbar").progressbar({
                    max: 100,
                    change: function (evt, ui) { $("#progresslabel").text($("#progressbar").progressbar("value") + "%"); },
                    complete: function (evt, ui) { $("#progresslabel").text("File upload successfully!"); }
                });
                evt.preventDefault();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" Text="Select File(s) to Upload : "></asp:Label>
        <asp:FileUpload ID="FileUploadpost" runat="server" AllowMultiple="false" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Save" />
        <div id="progressbar" class="progressbar">
            <div id="progresslabel" class="progressbarlabel">
            </div>
        </div>
    </div>
    </form>
</body>
</html>
