<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowHidepassword.aspx.cs" Inherits="Login_ShowHidepassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
    <script>
        $(document).ready(function () {
            debugger;
                         $("#showHide").on('click', function (event) {
                             event.preventDefault();
                             //The event.preventDefault() method stops the default action of an element from happening.
                             if ($('#txtPassword').attr("type") == "text") {
                                 $('#txtPassword').attr('type', 'password');
                                 $('#showHide i').addClass("fa-eye-slash");
                                 $('#showHide i').removeClass("fa-eye");
                             } else if ($('#txtPassword').attr("type") == "password") {
                                 $('#txtPassword').attr('type', 'text');
                                 $('#showHide i').removeClass("fa-eye-slash");
                                 $('#showHide i').addClass("fa-eye");
                             }
                         });
                     });
                 </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
              Password :
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
             <asp:LinkButton runat="server" ID="showHide"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></asp:LinkButton>
        </div>
    </form>
</body>
</html>
