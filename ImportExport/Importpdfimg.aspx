<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Importpdfimg.aspx.cs" Inherits="ImportExport_Importpdfimg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .GridviewDiv {
            font-size: 100%;
            font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif;
            color: #303933;
        }

        .headerstyle {
            color: #FFFFFF;
            border-right-color: #abb079;
            border-bottom-color: #abb079;
            background-color: #df5015;
            padding: 0.5em 0.5em 0.5em 0.5em;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="GridviewDiv">
                <asp:GridView ID="gvDetails" CssClass="Gridview" runat="server" AutoGenerateColumns="False">
                    <HeaderStyle CssClass="headerstyle" />
                    <Columns>
                        <asp:BoundField HeaderText="User Id" DataField="UserId" />
                        <asp:BoundField HeaderText="User Name" DataField="UserName" />
                        <asp:BoundField HeaderText="Education" DataField="Education" />
                        <asp:ImageField DataImageUrlField="Imagepath" HeaderText="Image" ItemStyle-Height="25px" ItemStyle-Width="25px" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Button ID="btnExport" runat="server" Text="Export Data" OnClick="btnExport_Click" />
               
            </div>
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
                               <a href='<%# Eval("prod_imgpath") %>'> <asp:Image ID="Image1" runat="server" ImageUrl='<%# "http://localhost:63913" + Eval("prod_imgpath") %>' Height="50PX" Width="50PX" /></a>
                                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Bind("prod_imgpath") %>'>Download IMG</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
            </asp:GridView>
                <asp:Button ID="showimg" runat="server" Text="IMG" OnClick="showimg_Click" />
        </div>
        </div>
    </form>
</body>
</html>
