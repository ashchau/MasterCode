<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fileuploadstatusbar3.aspx.cs" Inherits="Fileuploadbar_Fileuploadstatusbar3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/uploadify.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.3.2.min.js"></script>
    <script src="Scripts/jquery.uploadify.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    <script type="text/javascript">

        $(window).load(

            function () {

                $("#<%=FileUpload1.ClientID %>").fileUpload({

            'uploader': 'scripts/uploader.swf',

            'cancelImg': 'images/cancel.png',

            'buttonText': 'Browse Files',

            'script': 'Upload.ashx',

            'folder': 'uploads',

            'fileDesc': 'Image Files',

            'fileExt': '*.jpg;*.jpeg;*.gif;*.png',

            'multi': true,

            'auto': true

        });

    }

);

    </script>  
</head>
<body>
    <form id="form1" runat="server">
        <div style = "padding:40px">

        <asp:FileUpload ID="FileUpload1" runat="server" />

        </div>
    </form>
</body>
</html>
