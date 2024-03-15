<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="New_Login.aspx.cs" Inherits="Login_New_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
     <script>
         function showhidemaster(id,btn) {
             debugger;
             //var id = $("#<%=pwd.ClientID%>");
             var type = $(id).attr("type");
             if (type == "text") {
                 $(id).attr("type", "password");
                 $(btn).children("i").removeClass("fa-eye-slash");
                 $(btn).children("i").addClass("fa-eye");
             }
             else {
                 $(id).attr("type", "text");
                 $(btn).children("i").addClass("fa-eye-slash");
                 $(btn).children("i").removeClass("fa-eye");
             }
             return false;
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
  <h2>Student Login Form</h2>
  
    <div class="form-group">
      <label for="loginid">Email:</label>
      <input type="text" class="form-control" runat="server" id="loginid" placeholder="Enter Login ID" name="loginid" required />
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
     <%-- <input type="password" class="form-control" runat="server" id="pwd1" placeholder="Enter password" name="pwd" required />--%>
        <%--if used clientIdmode=static then pass text box actual id like pwd--%>
        <asp:TextBox ID="pwd" runat="server" CssClass="form-control" TextMode="Password"  placeholder="Enter password" ClientIDMode="Static"></asp:TextBox>
         <asp:LinkButton OnClientClick="return showhidemaster(pwd,this); " runat="server" ID="showHide"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></asp:LinkButton>
    </div>
        <div><h3>Test show hide password...</h3></div>
        <div class="form-group">
             <%--if we don't used clientIdmode=static then pass text box serverside id like ContentPlaceHolder1_txtnewpwd--%>
            <label for="loginid">New Password:</label>
            <asp:TextBox ID="txtnewpwd" runat="server" CssClass="form-control" TextMode="Password"  placeholder="Enter New password"></asp:TextBox>
             <asp:LinkButton OnClientClick="return showhidemaster(ContentPlaceHolder1_txtnewpwd,this); " runat="server" ID="showhidenewpwd"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></asp:LinkButton>
        </div>
        <div class="form-group">
            <label for="loginid">Confirm Password:</label>
            <input type="password" class="form-control" runat="server" id="txtconfpwd" placeholder="Enter Confirm pwd" name="loginid" required />
             <asp:LinkButton OnClientClick="return showhidemaster(ContentPlaceHolder1_txtconfpwd,this); " runat="server" ID="showhideconfpwd"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></asp:LinkButton>
        </div>
        <div><h3>HTML textbox and HTML button show hide...</h3></div>
        <div class="form-group">
             <%--if we used the html textbox and html button when we can used both button name or buttonid like ctl00$ContentPlaceHolder1$htmlpassword, ContentPlaceHolder1_htmlpassword---%>
            <label for="loginid">HTML Password:</label>
            <input type="password" class="form-control" runat="server" id="htmlpassword" placeholder="Enter Confirm pwd" name="htlpwd" required />
            <button onclick="showhidemaster(ContentPlaceHolder1_htmlpassword,this)" type="button" id="showHideHtml"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></button>
        </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember" id="chkremember" runat="server" /> Remember me</label>
    </div>
       <asp:Button ID="btnloin" runat="server" CssClass="btn btn-success" Text="Login" OnClick="btnloin_Click" />
       <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-warning" OnClick="btnclear_Click" CausesValidation="false" />
       <asp:Label ID="lblmsg" runat="server" Text="Label" Visible="false"></asp:Label>
</div>

</asp:Content>

