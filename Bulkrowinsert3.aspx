﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bulkrowinsert3.aspx.cs" Inherits="Bulkrowinsert3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:blanchedalmond">
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Id" HeaderText="Id" ItemStyle-Width="30" />
        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" />
        <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="150" />
    </Columns>
</asp:GridView>
<br />
<asp:Button ID="Button1" Text="Bulk Insert" OnClick="Bulk_Insert" runat="server" />
        </div>
    </form>
</body>
</html>
