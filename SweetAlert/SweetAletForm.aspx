<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SweetAletForm.aspx.cs" Inherits="SweetAlert_SweetAletForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
     <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
   
    <script>
        function fnSave() {
            debugger;
            var ddlcountry = $('#ddlcountry option:selected').val();
            var ddlstate = $('#ddlstate option:selected').val();
            var ddlcity = $('#ddlcity option:selected').val();
            var ddlvillage = $('#ddlvillage option:selected').val();
            if (ddlcountry == 0) {
                  swal({
                            title: "Oops...",
                            text: "Country is Required",
                            //text:"@TempData["msg"]",
                            type: 'info',
                            showCancelButtonClass: "btn-primary",
                            confirmButtonText: 'ok',
                            showCancelButton: true,
                            closeOnConfirm: true,
                            closeOnCancel: true
                   });
            return false
            }
            else if (ddlstate == 0) {
                  swal({
                            title: "Oops...",
                            text: "State is Required",
                            //text:"@TempData["msg"]",
                            type: 'success',
                            showCancelButtonClass: "btn-primary",
                            confirmButtonText: 'ok'
                   });
            return false
            }
            else if (ddlcity == 0) {
                  swal({
                            title: "Oops...",
                            text: "City is Required",
                            //text:"@TempData["msg"]",
                            type: 'error',
                            showCancelButtonClass: "btn-primary",
                            confirmButtonText: 'ok'
                   });
            return false
            }
             else if (ddlvillage == 0) {
                  swal({
                            title: "Oops...",
                            text: "village is Required",
                            //text:"@TempData["msg"]",
                            type: 'warning',
                            showCancelButtonClass: "btn-primary",
                            confirmButtonText: 'ok'
                   });
            return false
            }
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlcountry" runat="server">
                <asp:ListItem Value="0">Select Country</asp:ListItem>
                <asp:ListItem Value="1">India</asp:ListItem>
                <asp:ListItem Value="2">America</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlstate" runat="server">
                <asp:ListItem Value="0">Select State</asp:ListItem>
                <asp:ListItem Value="1">UP</asp:ListItem>
                <asp:ListItem Value="2">Mp</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlcity" runat="server">
                <asp:ListItem Value="0">Select City</asp:ListItem>
                <asp:ListItem Value="1">Azamgarh</asp:ListItem>
                <asp:ListItem Value="2">Indore</asp:ListItem>
            </asp:DropDownList>
             <asp:DropDownList ID="ddlvillage" runat="server">
                <asp:ListItem Value="0">Select Village</asp:ListItem>
                <asp:ListItem Value="1">Riwa</asp:ListItem>
                <asp:ListItem Value="2">Satana</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" OnClientClick="return fnSave()" />
        </div>
    </form>
</body>
</html>
