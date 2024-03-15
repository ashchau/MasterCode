<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orgchart.aspx.cs" Inherits="UI_Static_orgchart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="main-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h2>
                                    <asp:Label ID="lblcharname" runat="server" CssClass="topTableHeadingE"></asp:Label></h2>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-12 text-center">
                                    <asp:Image ID="imgChar" runat="server" />
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="btnBack" runat="server" CausesValidation="False" CssClass="btn btn-danger" PostBackUrl="~/Fileupload.aspx" SkinID="Button" Text="Back" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
