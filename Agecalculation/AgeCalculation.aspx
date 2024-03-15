<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgeCalculation.aspx.cs" Inherits="Agecalculation_AgeCalculation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <link type="text/css" rel="Stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css" />
    <script type="text/javascript">
        $(document).ready(function () {
             $("#TextBox1").datepicker({ dateFormat: 'dd/mm/yy', minDate: '', maxDate: '0', changeMonth: true, changeYear: true, autoClose: true });
        });
    </script>
   </head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtdob" runat="server" TextMode="Date" OnTextChanged="txtdob_TextChanged" AutoPostBack="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtage" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtdate" runat="server"></asp:TextBox></td>
                     DOB:<td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
