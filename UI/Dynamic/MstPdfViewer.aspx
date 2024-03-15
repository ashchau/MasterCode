<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MstPdfViewer.aspx.cs" Inherits="UI_Dynamic_MstPdfViewer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <h1>This is the PDF viewer page</h1>
          <div class="row">
            <div class="col-md-12">
                <h3 id="HearHeading" class="bg-warning urban-developement-tax"><asp:Label ID="lblHeader"  runat="server"  ></asp:Label></h3>
            </div>
        </div><br/>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblPDFViewer" runat="server"></asp:Label>
                    <a href="#" target="_blank"></a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
