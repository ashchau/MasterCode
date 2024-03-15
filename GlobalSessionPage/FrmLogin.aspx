<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="FrmLogin.aspx.cs" Inherits="GlobalSessionPage_FrmLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card">
        <div class="card-header">
            <h3>Admin Login</h3>
        </div>
        <div class="card-body">
            <div class="form-group">
                <div>
                    <label>User Id : </label>
                    <asp:DropDownList ID="ddllevel" runat="server" CssClass="form-control">
                         <asp:ListItem Value="0">Select Level</asp:ListItem>
                        <asp:ListItem Value="1">Admin</asp:ListItem>
                        <asp:ListItem Value="2">Super Admin</asp:ListItem>
                        <asp:ListItem Value="3">User</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label>User Id : </label>
                    <asp:TextBox ID="txtuserid" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label>User Password : </label>
                    <asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Panel class="alert alert-danger mb0 smlPadding100" Visible="false" ID="error_div" runat="server"><i class="fa r fa-info-circle"></i> <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </asp:Panel>
            </div>
        </div>
        <div class="card-footer">
            <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnlogin_Click" />
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-info" OnClick="btnsubmit_Click" />
            <asp:Button ID="btnloginnew" runat="server" Text="Login New" CssClass="btn btn-info" OnClick="btnloginnew_Click"/>
        </div>
    </div>
</asp:Content>

