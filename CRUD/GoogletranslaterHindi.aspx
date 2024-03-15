<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="GoogletranslaterHindi.aspx.cs" Inherits="CRUD_GoogletranslaterHindi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <%-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <%--<script src="../Scripts/Hiditrasnlate/googleapisjquery.js"></script>--%>
    <script src="../Scripts/Hiditrasnlate/SJuly2020.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txt_SubjShortH" runat="server"></asp:TextBox>
    <script type="text/javascript">
         let mytest = document.getElementById("ContentPlaceHolder1_txt_SubjShortH");//$('#<%=txt_SubjShortH.ClientID%>')
         enableTransliteration(mytest, "hi");
    </script>
    
</asp:Content>

