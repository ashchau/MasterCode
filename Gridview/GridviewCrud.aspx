<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="GridviewCrud.aspx.cs" Inherits="Gridview_GridviewCrud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <script>
        function ShowAleart() {
               return confirm("Do you want to Delete? ");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row m-4">
        <div class="col-md-12 m-4">
            <div class="card">
                <div class="card-header text-center">
                    <h3>Gridview Curd operation with Row Command</h3>
                </div>
                <div class="card-body">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <label>Customer Id</label>
                            <asp:TextBox ID="txtid" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Customer Name</label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Country</label>
                            <asp:TextBox ID="txtcountry" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnsave_Click" />
                            <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-warning" OnClick="btnclear_Click" />
                        </div>
                    </div>
                    <div class="col-md-12 mt-5">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="SrNo" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="SrNo" Text='<%#Eval("CustomerId")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Serno">
                                    <ItemTemplate>
                                        <asp:Label ID="serno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20%"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                                    <ItemTemplate>
                                        <asp:Label ID="lname" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_name" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle Width="40%"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
                                    <ItemTemplate>
                                        <asp:Label ID="lcontry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>

                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_country" runat="server" Text='<%# Eval("Country") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle Width="20%"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actionn">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LnkEdit" runat="server" CssClass="btn btn-primary btn fa-xs" CommandName="E" CommandArgument='<%# Container.DataItemIndex%>'><i class="far fa-comment-alt-edit"></i>Edit</asp:LinkButton>
                                        <asp:LinkButton ID="LnkDelete" Text="Delete" runat="server" CssClass="btn btn-danger btn-xs" CommandName="D" CommandArgument='<%#Container.DataItemIndex%>' OnClientClick="return ShowAleart();"><i class="fa fa-trash" aria-hidden="true"></i> Delete</asp:LinkButton>
                                        <asp:LinkButton ID="LnkCancel" runat="server" CssClass="btn btn-info btn fa-xs" CommandName="C" CommandArgument='<%#Container.DataItemIndex %>'><i class="fas fa-pen-nib "></i>Cancel</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="20%"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <div>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                </div>
            </div>
            <div class="text-center">
                <a class="cls_copy_pg_action copyAction copy-action-btn" data-value="THIS TEXT WILL BE COPIED"><i class="far fa-copy"></i>Copy</a>
            </div>
        </div>
    </div>
</asp:Content>

