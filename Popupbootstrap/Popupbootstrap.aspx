<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="Popupbootstrap.aspx.cs" Inherits="Popupbootstrap_Popupbootstrap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="container">
      <div>
          User id :
          <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
          Password :
          <asp:TextBox ID="txtpsw" runat="server"></asp:TextBox>
          <asp:Button ID="btnlogin" runat="server" Text="Login" OnClick="btnlogin_Click" />
      </div>

  </div>
<div class="container">
  <h2>Modal Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
            User id :
          <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
          Password :
          <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" onserverclick="btnsubmit_Click" runat="server">Login</button>
            <asp:Button ID="btnlogout" runat="server" Text="Logout" OnClick="btnlogout_Click" CssClass="btn btn-warning" />
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<!--My Model class code-->
    <div class="container">
  <h2>Employee Modal</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#NewModal" data-backdrop="static" data-keyboard="false">+Add New Employee</button>
<!-- Add this property when you want to popup close only button click -data-backdrop="static" data-keyboard="false"-->
  <!-- Modal -->
  <div class="modal fade" id="NewModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add New Employee</h4>
        </div>
        <div class="modal-body">
          <p>Fill Employee Details-></p>
            Employee Name :
          <asp:TextBox ID="txtename" runat="server"></asp:TextBox>
          Country :
          <asp:TextBox ID="txtcountry" runat="server"></asp:TextBox>
        </div>
        <div class="modal-footer">
            <asp:Label ID="lblmsg" runat="server" Text="Label" Visible="false"></asp:Label>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-success" onserverclick="btnsave_Click"  runat="server">Save data</button>
            <input id="Button1" type="button" value="Submit" onserverclick="btnsave_Click"  />
            <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click"  CssClass="btn btn-warning" />
        </div>
      </div>
      
    </div>
  </div>
  
</div>
    <div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Open modal for @fat</button>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%--<form>--%>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Recipient:</label>
                            <input type="text" class="form-control" id="recipient-name" />
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="message-text"></textarea>
                        </div>
                        <%-- </form>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Send message</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
</asp:Content>

