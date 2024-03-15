<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EncryptUrl.aspx.cs" Inherits="EncryptDeycrypt_EncryptUrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            Name:
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" Text="Ashok chauhan" />
        </td>
    </tr>
    <tr>
        <td>
            Technology:
        </td>
        <td>
            <asp:DropDownList ID = "ddlTechnology" runat="server">
                <asp:ListItem Text="ASP.Net" Value = "ASP.Net" />
                <asp:ListItem Text="PHP" Value = "PHP" />
                <asp:ListItem Text="JSP" Value = "JSP" />
            </asp:DropDownList>
        </td>
    </tr>
</table>
<hr />
<asp:Button ID="btnsubmit" Text="Submit" runat="server" OnClick ="btnsubmit_Click" />
        </div>
    </form>
</body>
</html>
