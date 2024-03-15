<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AutoCompleteSearchTextboxValue.aspx.cs" Inherits="Searchbox_AutoCompleteSearchTextboxValue" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%-- <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css"rel="stylesheet" type="text/css" />--%>
    <%--<script>
        /* To Disable Inspect Element */
        $(document).bind("contextmenu", function (e) {
            e.preventDefault();
        });
         /* To Disable f12 press button false */
        $(document).keydown(function (e) {
            if (e.which === 123) {
                return false;
            }
        });
    </script>--%>
    <script> 
        /** 
         * Disable right-click of mouse, F12 key, and save key combinations on page 
         */
        document.addEventListener("contextmenu", function (e) {
            e.preventDefault();
        }, false);
        document.addEventListener("keydown", function (e) {
            //document.onkeydown = function(e) { 
            // "I" key 
            if (e.ctrlKey && e.shiftKey && e.keyCode == 73) {
                disabledEvent(e);
            }
            // "J" key 
            if (e.ctrlKey && e.shiftKey && e.keyCode == 74) {
                disabledEvent(e);
            }
            // "S" key + macOS 
            if (e.keyCode == 83 && (navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey)) {
                disabledEvent(e);
            }
            // "U" key 
            if (e.ctrlKey && e.keyCode == 85) {
                disabledEvent(e);
            }
            // "F12" key 
            if (event.keyCode == 123) {
                disabledEvent(e);
            }
            // "C" key 
            if (e.ctrlKey && event.keyCode == 67) {
                disabledEvent(e);
            }
        }, false);
        function disabledEvent(e) {
            if (e.stopPropagation) {
                e.stopPropagation();
            } else if (window.event) {
                window.event.cancelBubble = true;
            }
            e.preventDefault();
            return false;
        }</script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>How to bind Name with State and how to protect right,F12,Inspect function</h1>
            <hr />
            <asp:DropDownList ID="combobox" runat="server"></asp:DropDownList>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <asp:Button ID="btnsavelistitems" runat="server" Text="SaveListItems" OnClick="btnsavelistitems_Click" />
        </div>
        <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <asp:TextBox ID="txtContactsSearch" runat="server"></asp:TextBox>
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="SearchCustomers"
            MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
            TargetControlID="txtContactsSearch" FirstRowSelected="false">
        </cc1:AutoCompleteExtender>
    </div>
    </form>
</body>
</html>
