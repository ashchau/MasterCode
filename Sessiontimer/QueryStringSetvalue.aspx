<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryStringSetvalue.aspx.cs" Inherits="Sessiontimer_QueryStringSetvalue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row col-12">
                <div class="col-md-3">
                   <asp:Label ID="lblfname" runat="server" Text="First Name"></asp:Label>
                    <asp:TextBox ID="txtfname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                   <asp:Label ID="lbllname" runat="server" Text="Last Name"></asp:Label>
                    <asp:TextBox ID="txtlname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <br />
                    <asp:Button ID="btnset" runat="server" Text="Set Values" CssClass="form-control btn-success" OnClick="btnset_Click" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
