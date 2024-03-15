<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UseUserControl.aspx.cs" Inherits="UserControl_UseUserControl" %>
<%@ Register Src="~/UserControl/CreateWebUserControl.ascx" TagName="uuc" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title> 
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            
            
           
        });
        function alphabet() {
                debugger;
            var nm = $('#txtmyname').val();
            var comn = $('#commanpgae_txtName').val();
            var comm = $('#txtName').val();
            var cl = document.getElementById('#txtmyname').val();
            }
    </script>
</head>
<body bgcolor="blue">
    <form id="form1" runat="server">
        <div>
            <uc:uuc ID="commanpgae" runat="server" />
        </div>
        <div>
            <asp:Label ID="lblname" runat="server"></asp:Label>
            <asp:Label ID="lblcity" runat="server"></asp:Label>
            <asp:TextBox ID="txtmyname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnsave" runat="server" Text="Submit" OnClick="btnsave_Click" OnClientClick="return alphabet();"/>
        </div>
    </form>
</body>
</html>
