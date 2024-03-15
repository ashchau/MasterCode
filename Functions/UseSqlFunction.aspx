<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UseSqlFunction.aspx.cs" Inherits="Functions_UseSqlFunction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtserno" runat="server"></asp:TextBox>
            <asp:Button ID="btnsearh" runat="server" Text="Search" OnClick="btnsearh_Click" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" EmptyDataText="Record not found"></asp:GridView>
        </div>
    </form>
</body>
</html>
