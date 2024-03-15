<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sessiontimer.aspx.cs" Inherits="Sessiontimer_sessiontimer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <div> Enter Values:<asp:TextBox ID="txtname" runat="server"></asp:TextBox></div>
            <div>
                <asp:Button ID="btnsessiontimeout" runat="server" Text="Set Time Out" OnClick="btnsessiontimeout_Click" /><asp:Button ID="btndisplay" runat="server" Text="Session Timeout in 2 MM" OnClick="btndisplay_Click" />
            </div>
            <div>
                <asp:Label ID="lblstime" runat="server" Text="Label"></asp:Label></div>

        </div>
    </form>
</body>
</html>
