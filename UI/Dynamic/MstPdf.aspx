<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MstPdf.aspx.cs" Inherits="UI_Dynamic_MstPdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class=" urban-developement-tax">
                            <asp:Label ID="lblHeader" runat="server"></asp:Label></h3>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:Label ID="lblMstPdfTbl" runat="server"></asp:Label>
                                    </div>
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
