<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PDFwithPassword.aspx.cs" Inherits="CRUD_PDFwithPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.5.1.js"></script>
    <script>
        function callAnchorForDownLoadFile() {
            $("#txtfiledownload").click();
        }
        var cnt = 0;
        function call(link) {
            debugger;
            var cancelled = false;
            if (cnt == 1) {
                return;
            }
            if (document.createEvent) {
                var event = document.createEvent("MouseEvents");
                event.initMouseEvent("click", true, true, window,
                    0, 0, 0, 0, 0,
                    false, false, false, false,
                    0, null);
                cnt = 1;
                link.dispatchEvent(event);
                //cancelled = !link.dispatchEvent(event);
            }
            else if (link.fireEvent) {
                cancelled = !link.fireEvent("onclick");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
             <a  id="txtfiledownload" onclick="call(this);" runat="server" visible="true"></a>
        </div>
        <div>
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnconvert" runat="server" Text="PDF Convert" OnClick="btnconvert_Click" />
            <asp:Button ID="btnEncryptPDF" runat="server" Text="PDF password" OnClick="btnEncryptPDF_Click"/>
        </div>
    </form>
</body>
</html>
