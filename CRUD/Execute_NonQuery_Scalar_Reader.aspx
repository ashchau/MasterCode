<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Execute_NonQuery_Scalar_Reader.aspx.cs" Inherits="CRUD_Execute_NonQuery_Scalar_Reader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             ID:<asp:TextBox ID="txtid" runat="server"></asp:TextBox>
           Name : <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
             Salary :<asp:TextBox ID="txtsalary" runat="server"></asp:TextBox>
            Mobile : <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnshow" runat="server" Text="Show" OnClick="btnshow_Click" />
            <asp:Button ID="btninsert" runat="server" Text="Insert" OnClick="btninsert_Click" />
             <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" />
             <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" />
        </div>
    </form>
</body>
</html>
