﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Popupwithoutmaster.aspx.cs" Inherits="Popupbootstrap_Popupwithoutmaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
    <script type="text/javascript">  
        //$(document).ready(function () {
        //    $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        //});
        //data-backdrop="static"
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-3">
            <h2 class="text-center text-uppercase">How to upload excel file in sql server database in asp.net</h2>  
            <div class="card">
                 <div class="card-header bg-primary text-uppercase text-white">  
                    <h5>Import Excel File</h5>  
                </div>  
                 <div class="card-body">
            <button style="margin-bottom:10px;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">   <i class="fa fa-plus-circle"></i> Import Excel  </button>
        </div>
        <div class="modal fade" id="myModal" >
           <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                     <h4 class="modal-title">Import Excel File</h4>  
                     <button type="button" class="close" data-dismiss="modal">×</button>  
                  </div>
                  <div class="modal-body">
                      <div class="row">
                          <div class="col-md-12">
                              <div class="form-group">
                                   <label>Choose excel file</label> 
                                  <div class="input-group">
                                      <div class="custom-file">
                                          <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" /> 
                                          <label class="custom-file-label"></label>
                                      </div>
                                       <label id="filename"></label> 
                                      <div class="input-group-append">
                                          <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-outline-primary" Text="Upload" OnClick="btnUpload_Click" /> 
                                      </div>
                                  </div>
                                  <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                  <%-- Start textbox div --%>
                                  <div class="input-group">
                                      <div class="input-group-append">
                                          Name:<asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                                          Address:<asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-12">
                             <div class="col-md-12">
                                  <div class="form-group">
                                  <div class="col-md-6">
                                      Name:<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                  </div>
                                  <div class="col-md-6">
                                      Address:<asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                                  </div>
                              </div>
                             </div>
                          </div>
                      </div>
                  </div>
                  <div class="modal-footer">
                       <asp:Button ID="btnsave" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsave_Click" />
                      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> 
                  </div>
              </div>
           </div>

        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-6">
                       Name: <asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                       Address <asp:TextBox ID="txt_address" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class="col-md-6">
                       Salary <asp:TextBox ID="txt_salary" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <br />
                        <asp:Button ID="btnshow" runat="server" Text="Show" CssClass="btn btn-info" OnClick="btnshow_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="col-md-6">
                       Name: <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                       Address <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class="col-md-6">
                       Salary <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Show" CssClass="btn btn-info" OnClick="btnshow_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
            </div>
        </div>
       
    </form>
</body>
</html>
