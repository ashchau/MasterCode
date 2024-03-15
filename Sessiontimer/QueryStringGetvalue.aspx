<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryStringGetvalue.aspx.cs" Inherits="Sessiontimer_QueryStringGetvalue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:Label ID="lblfname" runat="server"></asp:Label>
            <asp:Label ID="lbllname" runat="server"></asp:Label>
        </div>
        <div>
           
        </div>
        <div class="col-md-3">
                    <br />
                    <asp:Button ID="btnback" runat="server" Text="Back" CssClass="form-control btn-info" OnClick="btnback_Click"/>
                    <asp:Button ID="Button1" runat="server" Text="PostBack URL" PostBackUrl="~/Sessiontimer/QueryStringSetvalue.aspx" />
                </div>
    </form>
</body>
</html>
