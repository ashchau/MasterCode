<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="DatatableFilterdata.aspx.cs" Inherits="CRUD_DatatableFilterdata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="grdemp" runat="server"></asp:GridView>
    </div>
    <div>
        <asp:DropDownList ID="ddlname" runat="server" OnSelectedIndexChanged="ddlname_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
    </div>
</asp:Content>

