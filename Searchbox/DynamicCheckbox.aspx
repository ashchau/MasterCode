<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DynamicCheckbox.aspx.cs" Inherits="Searchbox_DynamicCheckbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="btnckeck" runat="server" Text="Create Checkbox" OnClick="btnckeck_Click" />
        </div>
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </asp:Panel>
        </div>
        <div style="margin:auto; width:50%">
            <table id="tbldynamicform" style="width:55%">
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolder" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
