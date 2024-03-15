<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="LoginLockeAccount.aspx.cs" Inherits="Login_LoginLockeAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
        $(document).ready(function () {
            $("input:text,form").attr("autocomplete", "off"); /*prevent autocomplete textbox values*/
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>How to Locck Account for 15 minutes for 3 time attemps wrong password</h1>
    <div class="container">
        <div class="row">
            <div class="row-cols-md-2">
                <asp:Label ID="lblLockmsg" runat="server" ></asp:Label>
            </div>
            <div class="row-cols-md-2">
                <asp:Label ID="lblname" runat="server" Text="User Name"></asp:Label>
                <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="row-cols-md-2">
                <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-success" Text="Login" OnClick="btnlogin_Click" />
            </div>
            <div class="row-cols-md-2">
                <asp:Label ID="lblmsg" runat="server"  ></asp:Label>
            </div>
        </div>

    </div>
</asp:Content>

