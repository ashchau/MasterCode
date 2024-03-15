<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResizeImg.aspx.cs" Inherits="Clientsidevalidation_ResizeImg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button Text="Upload" runat="server" ID="btnresize" OnClick="btnresize_Click"/>
        </div>
        <div>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Resume/lichi.jpg" Height="400px" Width="400px" />
            <br />
            <asp:Button ID="btnGenerateThumbnail" OnClick="btnGenerateThumbnail_Click" runat="server" Text="Generate Thumbnail" />
            <hr />
            <asp:Image ID="Image2" runat="server" Visible="false" />
        </div>
    </form>
</body>
</html>
