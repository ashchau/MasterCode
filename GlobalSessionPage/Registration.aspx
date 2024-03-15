<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="GlobalSessionPage_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card">
        <div class="card-header">
            <h3>Employee Registration</h3>
        </div>
        <div class="card-body">
            <div>
                <asp:Label ID="lblLevel" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblCo_Code" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblCo_Name" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblClient_Id" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblUserId" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <div class="card-footer">
            <asp:Button ID="btnDetails" runat="server" Text="User Details" CssClass="btn btn-primary" OnClick="btnDetails_Click" />
        </div>
    </div>
</asp:Content>

