<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConvertNumberToword.aspx.cs" Inherits="SalaryConvertIntoWord_ConvertNumberToword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Convert Number to Words in Asp.net</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Value:
            <asp:TextBox ID="txtnumber" runat="server" /><br />
            <asp:Button ID="btnClick" runat="server" Text="Convert" OnClick="btnClick_Click" /><br />
            <label id="lblmsg" runat="server" />
        </div>
        <div>
    Enter Amount :
    <asp:TextBox ID="txtAmount" runat="server" />
    <br />
    <br />
    <asp:Button Text="Get Words" ID="btntoword" runat="server" OnClick="btntoword_Click" />
    <br />
    <br />
    <asp:Label ID="lblResult" runat="server" />
</div>
        <div>
           Date Time : <asp:Label ID="lbltime" runat="server"></asp:Label>
        </div>
        <div>
            <asp:GridView ID="grdage" runat="server" AutoGenerateColumns="true">

            </asp:GridView>
        </div>
    </form>
</body>
</html>
