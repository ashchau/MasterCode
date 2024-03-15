<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="DdlOnGrid.aspx.cs" Inherits="Gridview_DdlOnGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
        function ShowAleart() {
            return confirm("Do you want to Delete? ");
            //alert(result);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="Fruitid">
                <Columns>
                    <asp:TemplateField HeaderText="Sn.">
                        <ItemTemplate>
                            <asp:TextBox ID="txtid" runat="server" Enabled="false" Visible="false" Text='<%# Bind("prod_id") %>'></asp:TextBox>
                            <asp:Label ID="lblsn" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            <asp:HiddenField ID="hdfid" runat="server" Value='<%# Bind("prod_id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Fruits Name">
                        <ItemTemplate>
                            <asp:Label ID="lblfruitname" runat="server" Enabled="false" Text='<%# Bind("prod_name") %>'></asp:Label>
                             <asp:DropDownList ID="DropDownList1" runat="server" Enabled="false"></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:TextBox ID="txtprice" runat="server" Enabled="false" Text='<%# Bind("prod_price") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <a href='<%# Eval("prod_imgpath") %>'> <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("prod_imgpath") %>' Height="50PX" Width="50PX" /></a>
                                 <asp:HyperLink ID="HyperLinkimg" runat="server" NavigateUrl='<%#Bind("prod_imgpath") %>'>Download IMG</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnedit" runat="server" Text="Edit" OnClick="btnedit_Click" />
                            <asp:Button ID="btnupdate" runat="server" Text="Update" Visible="false" OnClick="btnupdate_Click" />
                            <asp:Button ID="btncancel" runat="server" Text="Cancel" Visible="false" OnClick="btncancel_Click" />
                            <asp:Button ID="btndelete" runat="server" Text="Delete" Visible="true" OnClick="btndelete_Click" OnClientClick="return ShowAleart();" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:Button ID="btnshow" runat="server" Text="Show" OnClick="btnshow_Click" />
            <asp:Label ID="lbl_ErroMsg" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
</asp:Content>

