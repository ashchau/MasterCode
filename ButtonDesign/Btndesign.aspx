<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="Btndesign.aspx.cs" Inherits="ButtonDesign_Btndesign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Content/MyCSS/MyCSSStyle.css" rel="stylesheet" />
 <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"/>
     <%--  <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'/>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <div class="center">
      <button class="btnGo">
        <svg width="180px" height="60px" viewBox="0 0 180 60" class="border">
          <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
          <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
        </svg>
        <span>HOVER ME</span>
      </button>
    </div>
  </div>
    <div>
        <button class="btn btn-1 btn-sep icon-info">Button</button>
<button class="btn btn-2 btn-sep icon-cart">Button</button>
<button class="btn btn-3 btn-sep icon-heart">Button</button>
<button class="btn btn-4 btn-sep icon-send">Button</button>
    </div>
</asp:Content>

