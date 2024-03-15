﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fileuplodnew.aspx.cs" Inherits="Fileuploadbar_fileuplodnew" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Upload Files or Images in Asp.net without postback</title>
    <style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }
</style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal = $('<div />');
            modal.addClass("modal");
            $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 200);
    }
    $('form').live("submit", function () {
        ShowProgress();
    });
</script>
</head>
<body>
<form id="form1" runat="server">
<div>
    Country: <asp:DropDownList ID="ddlCountries" runat="server">
    <asp:ListItem Text="All" Value="" />
    <asp:ListItem Text="USA" Value="USA" />
    <asp:ListItem Text="Mumbai" Value="Mumbai" />
    <asp:ListItem Text="France" Value="France" />
    <asp:ListItem Text="India" Value="India" />
</asp:DropDownList>
<asp:Button ID="btnSubmit" runat="server" Text="Load Customers" OnClick="btnSubmit_Click" />
<hr />
<asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="CustomerId" HeaderText="Customer Id" />
        <asp:BoundField DataField="Name" HeaderText="Contact Name" />
        <asp:BoundField DataField="Country" HeaderText="Country" />
    </Columns>
</asp:GridView>
<div class="loading" style="text-align:center">
    Loading. Please wait.<br />
    <br />
    <img src="../loading.gif" alt="Loader" width="50" height="50" />
</div>
   
</div>
</form>
</body>
</html>
