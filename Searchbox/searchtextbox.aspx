<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchtextbox.aspx.cs" Inherits="Searchbox_searchtextbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script>//used without jquery
        function myFunction() {
            debugger;
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                /* td = tr[i].getElementsByTagName("td")[2];*/   /* not works this both td 1 and 2 used for search data matching with two these two rows */
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
    <%--Second method used with jquery--%>
    <script src="../Scripts/jquery-3.5.1.js"></script>
    <script> 
        $(document).ready(function () {
            $("#txtseach").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    //$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)  this line search by all column value
                    $(this).toggle($(this).find('td:eq(0), td:eq(3)').text().toLowerCase().indexOf(value) > -1)//this search by perticular col values
                });
            });
        });
    </script>
    <script>
        function bigImg(x) {
            //x.style.height = "64px";
            //x.style.width = "64px";
             $("#txtshowhide").show("show");
        }

        function normalImg(x) {
            //x.style.height = "32px";
            //x.style.width = "32px";
            $("#txtshowhide").hide("100");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name" />
            <div style="display:none" id="txtshowhide">
                <asp:TextBox ID="txtseach" runat="server" placeholder="Search Box" ToolTip="type a name"  onmouseleave="normalImg(this)"></asp:TextBox>
            </div>
            <span onmouseenter="bigImg(this)"><img src="../Image/Edit.jpg" height="50" width="50" /></span>
            <%--<asp:Label runat="server" ID="lblsearch" onmouseenter="bigImg(this)" Text="Search"></asp:Label>--%>
        </div>
        <div>
            <asp:GridView ID="myTable" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
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
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/PDF/"+Eval("Map") %>'>Map PDF</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
