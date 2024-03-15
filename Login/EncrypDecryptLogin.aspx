﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="EncrypDecryptLogin.aspx.cs" Inherits="Login_EncrypDecryptLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container py-4">  
            <div class="col-md-5 offset-md-3">  
                <div class="card card-outline-secondary rounded-0">  
                    <div class="card-header bg-success rounded-0">  
                        <h4 class="text-center text-uppercase text-white">Login</h4>  
                    </div>  
                    <div class="card-body">  
                        <div class="form-group bottom">  
                            <label>User Name</label>  
                            <div class="input-group">  
                                <div class="input-group-prepend">  
                                    <div class="input-group-text"><i class="fa fa-lock"></i></div>  
                                </div>  
                                <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>  
                            </div>  
                        </div>  
                        <div class="form-group bottom">  
                            <label>User Id</label>  
                            <div class="input-group">  
                                <div class="input-group-prepend">  
                                    <div class="input-group-text"><i class="fa fa-envelope"></i></div>  
                                </div>  
                                <asp:TextBox ID="txtid" runat="server" CssClass="form-control"></asp:TextBox>  
                            </div>  
                        </div>  
                        <div class="form-group bottom">  
                            <label>Password</label>  
                            <div class="input-group">  
                                <div class="input-group-prepend">  
                                    <div class="input-group-text"><i class="fa fa-lock"></i></div>  
                                </div>  
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>  
                            </div>  
                            <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" CssClass="text-danger" runat="server" ErrorMessage="Please enter password"></asp:RequiredFieldValidator>  
                        </div>  
                        <div class="form-group">  
                            <asp:Button ID="btnsave" CssClass="btn btn-success rounded-0 btn-block" runat="server" Text="Save" OnClick="btnsave_Click" />  
                        </div>  
                         <div class="form-group">  
                            <asp:Button ID="btnlogin" CssClass="btn btn-success rounded-0 btn-block" runat="server" Text="Login" OnClick="btnlogin_Click" />  
                        </div>
                        <div class="text-center">  
                             <asp:Label ID="lblMessage" CssClass="text-center" runat="server"></asp:Label>  
                        </div>                        
                    </div>  
                </div>  
            </div> 
        <div>
            <asp:GridView ID="gvUsers" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowDataBound="gvUsers_RowDataBound"> 
                <RowStyle BackColor="White" ForeColor="#330099" />
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            </asp:GridView>
        </div>
        </div>  
</asp:Content>
