<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchtextbox2.aspx.cs" Inherits="Searchbox_searchtextbox2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <%--<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../Scripts/Table_Script/jquery.dataTables.css" rel="stylesheet" />
    <script src="../Scripts/Table_Script/jquery.dataTables.min.js"></script>--%>
    <script src="../Scripts/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">
         $(function () {
             debugger;
            $(".grid").DataTable({
                bLengthChange: true,
                lengthMenu: [[10, 30, -1], [10, 30, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true
            });
        });
    </script>
   <%-- <style>
         .table thead tr th {
            background: #931b2f;
            color:blanchedalmond;
        }
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>female</asp:ListItem>
                <asp:ListItem>Male</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="margin-top:30px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid" DataKeyNames="id" EmptyDataText="Data not found..." CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <%--<asp:BoundField DataField="id" HeaderText="ID" />--%>
                    <asp:TemplateField HeaderText="Serial No." ItemStyle-Width="10%">
                        <ItemTemplate>

                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                        </ItemTemplate>
                        <ItemStyle Width="10%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DeveloperName" HeaderText="Developer Name" />
                    <asp:BoundField DataField="SchemeName" HeaderText="Scheme Name" />
                    <asp:BoundField DataField="JdaZone" HeaderText="JDA Zone" />
                    <asp:BoundField DataField="NigamZone" HeaderText="Nigam Zone" />
                    <asp:BoundField DataField="AllotmentList" HeaderText="Allotment List" />
                   <%-- <asp:BoundField DataField="Map" HeaderText="Map" />--%>
                    <asp:TemplateField HeaderText="Map">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%#"~/PDF/"+Eval("Map") %>'>Map PDF
                            </asp:HyperLink>
                            <asp:Label ID="lblmap" runat="server" Text='<%# Eval("Map") %>' Visible="false" ></asp:Label>
                           <a href="#">  <asp:Label ID="lblstaus" runat="server" Text="Coming soon..." Visible="false" ></asp:Label></a>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
