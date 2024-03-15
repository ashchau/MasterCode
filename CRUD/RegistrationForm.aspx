<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationForm.aspx.cs" Inherits="CRUD_RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" Visible="true">
                <div>
                    <h1>Pannel 1 for details</h1>
                   Name: <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                   Father Name : <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />
                    <img id="img1" runat="server" width="100" height="100" />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="btnupload" runat="server" Text="Upload Image" OnClick="btnupload_Click" />
                </div>
                <div>
                    <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
                    <asp:Button ID="btnnext" runat="server" Text="Next" OnClick="btnnext_Click"/>
                    <asp:Button ID="btnclear" runat="server" Text="Clear" />

                </div>
            </asp:Panel>
        </div>
        <div>
            <asp:Panel ID="Panel2" runat="server" Visible="false">
                <div>
                    <h1>Pannel 2 for address details</h1>
                    Address :<asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                   State : <asp:TextBox ID="txtstate" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"/>
                    <asp:Button ID="btnprevious" runat="server" Text="Previous" OnClick="btnprevious_Click" />

                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
