<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Automaticaddrow.aspx.cs" Inherits="Gridview_Automaticaddrow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:gridview ID="Gridview1" runat="server" ShowFooter="true" AutoGenerateColumns="false" >

        <Columns>

        <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />

        <asp:TemplateField HeaderText="Header 1">

            <ItemTemplate>

                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            </ItemTemplate>

        </asp:TemplateField>

        <asp:TemplateField HeaderText="Header 2">

            <ItemTemplate>

                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

            </ItemTemplate>

        </asp:TemplateField>

        <asp:TemplateField HeaderText="Header 3">

            <ItemTemplate>

                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

            </ItemTemplate>

            <FooterStyle HorizontalAlign="Right" />

            <FooterTemplate>

             <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click" />

            </FooterTemplate>

        </asp:TemplateField>

        </Columns>

</asp:gridview>
        </div>

        <div>
            <asp:GridView ID="GridView2" runat="server"></asp:GridView>
            <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
        </div>
    </form>
</body>
</html>
