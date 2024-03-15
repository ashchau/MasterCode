<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="PopupwithMasterPage.aspx.cs" Inherits="Popupbootstrap_PopupwithMasterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container py-3">
        <h2>This is Login Popup page</h2>
        <div class="card">
            <div class="card-header bg-primary text-uppercase text-white text-center">
                <h5>Import Excel File Card Header</h5>
            </div>
            <div class="card-body">
                <button style="margin-bottom:10px;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static">   <i class="fa fa-plus-circle"></i> Import Excel  </button>
            </div>
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Import Excel files</h4>
                                <button type="button" class="close" data-dismiss="modal">X</button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div>
                                            <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
                                        </div>
                                        <div>
                                            <asp:LinkButton ID="lbntsubmit" runat="server" OnClick="lbntsubmit_Click">
                                               <div class="panel panel-default change-part1 hover-shadow pre">
                                                    <div class="panel-body">
                                                        <div class="inner-after">
                                                            <div class="row">
                                                                <div class="col-xs-12 text-center">
                                           
                                                                    <i class="fa fa-bar-chart"></i>
                                                                    <h4>Legal&nbsp;System</h4>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

