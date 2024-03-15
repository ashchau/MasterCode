<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteMultichk.aspx.cs" Inherits="Gridview_DeleteMultichk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type = "text/javascript">

    function ConfirmDelete()

    {
        debugger;
       var count = document.getElementById("<%=hfCount.ClientID %>").value;

       var gv = document.getElementById("<%=gvAll.ClientID%>");

       var chk = gv.getElementsByTagName("input");

       for(var i=0;i<chk.length;i++)

       {

            if(chk[i].checked && chk[i].id.indexOf("chkAll") == -1)

            {

                count++;

            }

       }

       if(count == 0)

       {

            alert("No records to delete.");

            return false;

       }

       else

       {

            return confirm("Do you want to delete " + count + " records.");

       }

    }

</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvAll" runat="server" AutoGenerateColumns="false" Font-Names="Arial" Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B" HeaderStyle-BackColor="green" AllowPaging="true" OnPageIndexChanging="OnPaging" DataKeyNames="empid" PageSize="10">

                <Columns>

                    <asp:TemplateField>

                        <HeaderTemplate>

                            <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll(this);" />

                        </HeaderTemplate>

                        <ItemTemplate>

                            <asp:CheckBox ID="chk" runat="server" onclick="Check_Click(this)" />

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField ItemStyle-Width="150px" DataField="empname" HeaderText="Employee Name" />

                    <asp:BoundField ItemStyle-Width="150px" DataField="salary" HeaderText="Salary" />

                    <asp:BoundField ItemStyle-Width="150px" DataField="mobile" HeaderText="Mobile No." />

                </Columns>

                <AlternatingRowStyle BackColor="#C2D69B" />

            </asp:GridView>

            <asp:HiddenField ID="hfCount" runat="server" Value="0" />

            <asp:Button ID="btnDelete" runat="server" Text="Delete Checked Records" OnClientClick="return ConfirmDelete();" OnClick="btnDelete_Click" />
        </div>
    </form>
</body>
</html>
