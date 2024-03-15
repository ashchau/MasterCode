<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calculation.aspx.cs" Inherits="Calculation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="packages/bootstrap.5.0.0-beta2/content/Content/bootstrap.css" rel="stylesheet" />
    <script src="packages/bootstrap.5.0.0-beta2/content/Scripts/bootstrap.js"></script>
    <script src="packages/jQuery.3.5.1/Content/Scripts/jquery-3.5.1.js"></script>
    <script type="text/javascript">
       /* $(document).ready(function () {*/
            function tenfees() {
                var emd = 0, risl = 0, ten = 0;
                var tenfee = document.getElementById("txtamount").value;
                var rislfee = document.getElementById("txtgst").value;
                var emdfee = document.getElementById("txtother").value;
                if (tenfee != "" || tenfee > 0)
                    ten = tenfee;
                if (rislfee != "" || risl > 0)
                    risl = rislfee;
                if (emdfee != "" || emdfee > 0)
                    emd = emdfee;
                document.getElementById("txttotal").value = (parseFloat(ten) + parseFloat(risl) + parseFloat(emd));
            }
        //});
    </script>
    <style>
        .hide{
            cursor: not-allowed;
            background-color: #eee;
            opacity: 1; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- we can use like this in place of onblur- onfocusout="tenfees()" or  onkeyup="tenfees()" there are some difference b/w them--%>
            <table>
                <tr>
                    <td>Tender amount</td>
                    <td>
                        <asp:TextBox ID="txtamount" runat="server" onblur="Javascript:tenfees(); return false;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>GST</td>
                    <td>
                        <asp:TextBox ID="txtgst" runat="server" onblur="Javascript:tenfees(); return false;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Other Charge</td>
                    <td>
                        <asp:TextBox ID="txtother" runat="server" onfocusout="Javascript:tenfees(); return false;"></asp:TextBox>
                    </td>
                </tr>
                <tr><td>Total Amount:</td><td>
                    <asp:TextBox ID="txttotal" runat="server" Font-Bold="true" ForeColor="red" ReadOnly="true"  CssClass=" hide" ></asp:TextBox></td></tr>
            </table>
        </div>
       <%-- <div>
            <a href="https://app.cpcbccr.com/ccr/#/caaqm-dashboard-all/caaqm-landing/" target="_blank">
                                <h4>Continuous Ambient Air</h4>
                                <p>Quality Monitoring Data</p>
            </a>
        </div>--%>
    </form>
</body>
</html>
