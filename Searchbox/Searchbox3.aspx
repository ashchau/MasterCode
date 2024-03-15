<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Searchbox3.aspx.cs" Inherits="Searchbox_Searchbox3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search TextBox</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $(".grid").DataTable({
                bLengthChange: true,
                lengthMenu: [[10, 30, -1], [10, 30, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:GridView ID="GridView1" runat="server" CssClass="grid" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="empid" HeaderText="ID" />
                        <asp:BoundField DataField="empname" HeaderText="Name" />
                        <asp:BoundField DataField="salary" HeaderText="Salary" />
                        <asp:BoundField DataField="mobile" HeaderText="Mobile" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
