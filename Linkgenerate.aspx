<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Linkgenerate.aspx.cs" Inherits="Linkgenerate" MasterPageFile="~/MyMaster.master" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"> how to add master page in existing page
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
 
    </form>
</body>
</html>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css"
        rel="stylesheet" type="text/css" />
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
           <div>
            <asp:FileUpload ID="FileUploadControl" runat="server" />
            <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" />
            <br />
            <br />
            <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
            <br />
            <asp:Panel ID="Panel1" runat="server"></asp:Panel>
        </div>
 </asp:Content>