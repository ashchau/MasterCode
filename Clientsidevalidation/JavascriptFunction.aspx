<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JavascriptFunction.aspx.cs" Inherits="Clientsidevalidation_JavascriptFunction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <%-- <script>
        window.addEventListener('load', function () {
            document.getElementById('txtname').value = 'Hello';
            document.getElementById('txtcity').value = 'Azamgarh';
        })
    </script>--%>
    <script>
        $(document).ready(function () {
            $('#txtname').val('Ashok Chauhan');

        })
        //OR use this type also
        $(window).on('load', function () {
            $('#txtcity').val('Mau');
            $('input[type="text"]').css("background", "yellow");//change color by attribute name 
        })
    </script>
    <script type="text/javascript">
        //https://stackoverflow.com/questions/40848551/how-does-adding-string-with-integer-work-in-javascript
        // string + number = concatenated string
        // number + number = the sum of both numbers
        // string - number = the difference between (coerced string) and the number
        window.onload = function () {
            document.getElementById("1").innerHTML = "";            //Output = 
            document.getElementById("2").innerHTML = "" + 1;        //Output =1 
            document.getElementById("3").innerHTML = "" + 1 + 10;   //Output =110 
            document.getElementById("4").innerHTML = "" + 1 + 10 + 2 //Output =1102
            document.getElementById("5").innerHTML = "" + 1 + 10 + 2 - 5 //Output =1097 
            document.getElementById("6").innerHTML = "" + 1 + 10 + 2 - 5 + "8"; //Output 10978 
            document.getElementById("7").innerHTML = "" + 1 + 10 + 2 - 5 + 8;   //Output =1105

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
            </div>
            <div>
                <ol>
                    <li id="1"></li>
                    <li id="2"></li>
                    <li id="3"></li>
                    <li id="4"></li>
                    <li id='5'></li>
                    <li id='6'></li>
                    <li id='7'></li>
                </ol>
            </div>
        </div>
    </form>
</body>
</html>
