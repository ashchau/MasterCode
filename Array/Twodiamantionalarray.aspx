<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Twodiamantionalarray.aspx.cs" Inherits="Array_Twodiamantionalarray" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Row value:
            <asp:TextBox ID="txtrow" runat="server"></asp:TextBox>
            Column Value:
            <asp:TextBox ID="txtcolumn" runat="server"></asp:TextBox>
            <asp:Button ID="btnsearch" runat="server" Text="Get Array Value" OnClick="btnsearch_Click" />
        </div>
        <div>
            <asp:Label ID="ValueLabel" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
