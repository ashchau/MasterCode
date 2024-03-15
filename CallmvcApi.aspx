<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CallmvcApi.aspx.cs" Inherits="CallmvcApi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             Name:
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="Search" />
            <hr />
            <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField ItemStyle-Width="150px" DataField="CustomerID" HeaderText="CustomerID" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="CompanyName" HeaderText="Company Name" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="City" HeaderText="City" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
