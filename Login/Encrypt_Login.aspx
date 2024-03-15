<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="Encrypt_Login.aspx.cs" Inherits="Login_Encrypt_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Student Login Form</h2>

        <div class="form-group">
            <label for="txtname">Name:</label>
           <%-- <input type="text" class="form-control" runat="server" id="txtname" placeholder="Enter User Name" name="txtname" required />--%>
            <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Enter User Name"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="loginid">Email:</label>
             <asp:TextBox ID="loginid" runat="server" CssClass="form-control" placeholder="Enter Login ID"></asp:TextBox>
           <%-- <input type="text" class="form-control" runat="server" id="loginid" placeholder="Enter Login ID" name="loginid" required />--%>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <%-- <input type="password" class="form-control" runat="server" id="pwd1" placeholder="Enter password" name="pwd" required />--%>
            <asp:TextBox ID="pwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="remember" id="chkremember" runat="server" />
                Remember me</label>
        </div>
        <asp:Button ID="btnloin" runat="server" CssClass="btn btn-success" Text="Login" OnClick="btnloin_Click" />
        <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-warning" OnClick="btnclear_Click" CausesValidation="false" />
        <asp:Label ID="lblmsg" runat="server" Text="Label" Visible="true"></asp:Label>
    </div>
</asp:Content>

