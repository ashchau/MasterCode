<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Googletranslater.aspx.cs" Inherits="CRUD_Googletranslater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Google Translater</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <style>
        .ui-helper-hidden-accessible{
            visibility:hidden !important;
        }
        .form-control {
    display: block;
    width: 30%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    /*border-radius: 4px;*/
     border-radius: 25px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
    </style>
     <script type="text/javascript">

           $(document).ready(function () {

               $("#txttrans").autocomplete({
                   source: function (request, response) {
                       $.ajax({
                           url: "https://inputtools.google.com/request?text=" + request.term.replaceAll(',', '٬') + "&itc=hi-t-i0-und&num=13&cp=0&cs=0&ie=utf-8&oe=utf-8&app=demopage",
                           type: "POST",
                           dataType: "json",
                           success: function (data) {
                               var mydata = data[1];
                               var mydataWrap = mydata[0];
                               var question = mydataWrap[0];
                               var answers_array = mydataWrap[1];
                               response(answers_array)
                           }
                       });
                   },
               });
                $("#txttranslater").autocomplete({
                   source: function (request, response) {
                       $.ajax({
                           url: "https://inputtools.google.com/request?text=" + request.term.replaceAll(',', '٬') + "&itc=mr-t-i0-und&num=13&cp=0&cs=0&ie=utf-8&oe=utf-8&app=demopage",
                           type: "POST",
                           dataType: "json",
                           success: function (data) {
                               var mydata = data[1];
                               var mydataWrap = mydata[0];
                               var question = mydataWrap[0];
                               var answers_array = mydataWrap[1];
                               response(answers_array)
                           }
                       });
                   },
               });

           });
        </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Google Translate:
            <asp:TextBox ID="txttrans" runat="server" CssClass="form-control"></asp:TextBox>
            Google Translater:
            <asp:TextBox ID="txttranslater" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </form>
</body>
</html>
