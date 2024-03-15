<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="DropdownUnderGridview.aspx.cs" Inherits="Gridview_DropdownUnderGridview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="panel">
            <div class="panel-heading text-center bg-primary">
                <h3>Dropdown Under GriedView</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <h3>When click on Edit button then dropdown is come</h3>
                        <div class="col-md-6" style="height: 300px; overflow: auto; width: 500px">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowEditing="GridView1_RowEditing" OnRowDataBound="GridView1_RowDataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit">
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
                                            <asp:DropDownList ID="cmbChargE" runat="server">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="cmbChargF" runat="server">
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
                                            <a href='<%# Eval("prod_imgpath") %>'>
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("prod_imgpath") %>' Height="50PX" Width="50PX" /></a>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Bind("prod_imgpath") %>'>Download IMG</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="col-md-6">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView2_RowDataBound">
                                <Columns>
                                    <asp:BoundField HeaderText="Name" DataField="id" />
                                    <asp:TemplateField HeaderText="Country">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Address") %>' Visible="false" />
                                            <asp:DropDownList ID="ddlCountries" runat="server">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success" />
                <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

