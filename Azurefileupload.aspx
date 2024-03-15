<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Azurefileupload.aspx.cs" Inherits="Azurefileupload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
            <asp:Image ID="prodImg" runat="server" Width="100px" Height="100px" />
            <asp:Button ID="btnupload" runat="server" Text="Upload PDF" OnClick="btnupload_Click" />
        </div>
        <%-- Image download Section --%>
        <div>
            <h1>Image file download section...</h1>
            <a href="#" id="hrt" runat="server" download="">Click here for Download Img</a>
            <asp:Button ID="btnimgdwl" runat="server" Text="Image Download" OnClick="btnimgdwl_Click" />
        </div>
    </form>
</body>
</html>
