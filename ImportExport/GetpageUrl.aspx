<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetpageUrl.aspx.cs" Inherits="ImportExport_GetpageUrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
        </div>
        <div>
            <a id="repurl" runat="server">Replace Link</a>
        </div>
        <div>
            <h1>First method </h1>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:Label ID="lblresverce" runat="server" Text="Label"></asp:Label><br />
        <asp:Label ID="lblsub" runat="server"></asp:Label><br />
       <div>
            <asp:TextBox ID="txtarms" runat="server"></asp:TextBox>
            <asp:Label ID="lblarms" runat="server"></asp:Label><br />
            <asp:Label ID="lblarmssum" runat="server"></asp:Label>
           <asp:Button ID="btnarms" runat="server" Text="Armstrong Number" OnClick="btnarms_Click" />
       </div>
    </form>
</body>
</html>
