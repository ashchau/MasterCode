<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exportpdfwith_Imgdata.aspx.cs" Inherits="ImportExport_Exportpdfwith_Imgdata" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                 <Columns>
                         <asp:TemplateField HeaderText="Sn.">
                            <ItemTemplate>
                                <asp:Label ID="lblsn" runat="server" Text='<%# Bind("prod_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prod Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                         <asp:TemplateField HeaderText="Prod bind Name">
                            <ItemTemplate>
                                <%# Eval("prod_name")%>
                               <%-- <asp:Label ID="lblpname" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label>--%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="cmbChargE"  runat="server" >
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbChargF" runat="server" >
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>




                        <asp:TemplateField HeaderText="Prod Price">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("prod_price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <a href='<%# Eval("prod_imgpath") %>'> <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("prod_imgpath") %>' Height="50PX" Width="50PX" /></a>
                                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Bind("prod_imgpath") %>'>Download IMG</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:Button ID="btnexportpdf" runat="server" Text="ExportPDF" OnClick="btnexportpdf_Click" />
            <asp:Button ID="btnpdf" runat="server" Text="Export To PDF" OnClick="btnpdf_Click" />
            <asp:Button ID="btntest" runat="server" Text="Test" OnClick="btntest_Click" />
        </div>
    </form>
</body>
</html>
