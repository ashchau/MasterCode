<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Uploadandshowimg.aspx.cs" Inherits="ImportExport_Uploadandshowimg" MasterPageFile="~/MyMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="card">
            <div class="card-header bg-primary">
                <div class="card-title text-center">
                    <h3>How to upload and View Image</h3>
                </div>
            </div>
            <div class="card card-body">
                <div class="card-group">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-3">
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="btnuploadimg" runat="server" Text="Upload Image" CssClass="btn btn-info" OnClick="btnuploadimg_Click" />
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="btnshowimg" runat="server" Text="View Image" CssClass="btn btn-primary" OnClick="btnshowimg_Click" />
                                <asp:Image ID="Image1" runat="server" />

                            </div>
                            <div class="col-md-3">
                                <button type="button" id="MybtnPreventHTML" class="btn btn-primary" data-target="#MymodalPreventHTML" data-toggle="modal" data-backdrop="static" data-keyboard="false">Change Password</button>
                            </div>
                            <div>
                                <iframe class="responsive-iframe" runat="server" id="imgiframe"></iframe>
                            </div>
                            <div class="modal fade" id="MymodalPreventHTML" tabindex="-1" role="dialog" aria-labelledby="MymodalPreventHTML" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Change Password</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure you want to change password?</p>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer bg-warning">
                <div class="card-text text-center">
                    <h5>@coppy wrights...</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="card">
            <div class="card-header bg-primary">
                <div class="card-title text-center"><h2>Upload Image</h2></div>
            </div>
            <div class="card card-body">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Panel ID="Panel1" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Serno" OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:FileUpload ID="FileUpload2" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="lblserno" runat="server" Text='<%# Eval("Serno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnuploadimg" runat="server" Text="Upload image" CommandName="U" CommandArgument='<%# Container.DataItemIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="lblshortschemename" runat="server" Visible="true"></asp:Label><asp:HyperLink ID="hylmore" runat="server">More...</asp:HyperLink>
                                            <asp:Label ID="lblfullSchemeName" Visible="false" runat="server" Text='<%# Eval("SchemeName") %>'></asp:Label><asp:HyperLink ID="hylless" runat="server">Less...</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="GridView1" />
                        </Triggers>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
            <div class="card-footer bg-warning text-center text-danger">
                <h3>Images Upload</h3>
            </div>
        </div>

    </div>
</asp:Content>
