<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Credit_card.aspx.cs" Inherits="Credit_card_Credit_card" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Credit Card Details Capture using JavaScript</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">    
        function moveFocus(from, to) {
            var length = from.value.length;
            var maxLength = from.getAttribute("maxLength");
            if (length == maxLength) {
                document.getElementById(to).focus();
            }
        };
    </script>
    <script>
        $(document).on('ready', function () {
            $('#TextBox5').on('change keyup', function () {
                if (this.value.length >4) {
                    alert("Four characters detected!");
                }
            });
        });
    </script>
</head>
<body class="container-fluid">
    <form id="form1" runat="server">
        <div id="creditCardDetailsTextboxes" class="jumbotron">
            Enter Card Number:    
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="4" Width="50px" onkeyup="moveFocus(this,'TextBox2')"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" MaxLength="4" Width="50px" onkeyup="moveFocus(this,'TextBox3')"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" MaxLength="4" Width="50px" onkeyup="moveFocus(this,'TextBox4')"></asp:TextBox>
            <asp:TextBox ID="TextBox4" runat="server" MaxLength="4" Width="50px"></asp:TextBox>
        </div>
        <div>
            <asp:TextBox ID="TextBox5" runat="server" MaxLength="4" Width="50px"></asp:TextBox>
        </div>
    </form>
</body>
</html>
