<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gridbind.aspx.cs" Inherits="Popupbootstrap_Gridbind" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Asp.net Bind Data to Gridview using JQuery or JSON</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            debugger;
            $('#btnSubmit').click(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Gridbind.aspx/BindDatatable",
                    data: "{}",
                    dataType: "json",
                    success: function (data) {
                        $("#gvDetails").empty();
                        var tblhead = "<thead class='head'><tr><th>Id</th><th>Name</th><th>Location</th><th>PDF</th></tr></thead>";
                        $("#gvDetails").append(tblhead);
                        for (var i = 0; i < data.d.length; i++) {
                            // $("#gvDetails").append("<tr><td>" + data.d[i].UserId + "</td><td>" + data.d[i].UserName + "</td><td>" + data.d[i].Location + "</td></tr>");
                            $("#gvDetails").append("<tr><td>" + data.d[i].UserId + "</td><td>" + data.d[i].UserName + "</td><td>" + data.d[i].Location + "</td><td>" +  "<a href='../PDF/" +  data.d[i].pdf + " 'class='tender' target='_blank'>Download</a>" + "</td></tr>");
                        }
                    },
                    error: function (result) {
                        alert("Error");
                    }
                });
            });
        });
    </script>
    <style type="text/css">
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        .head{
            background-color:chartreuse;
           color:red;
          text-decoration-color:yellow;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvDetails" runat="server" ShowHeaderWhenEmpty="true">
            <HeaderStyle BackColor="#DC5807" Font-Bold="true" ForeColor="White" />
           <%-- <Columns>
                <asp:TemplateField HeaderText="UserId" Visible="true">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="UserId1" Text='<%#Eval("UserId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UserName" Visible="true">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="UserName1" Text='<%#Eval("UserName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location" Visible="true">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Location1" Text='<%#Eval("Location")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="PDF" Visible="true">
                    <ItemTemplate>
                       <a href="#">PDF</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>--%>
        </asp:GridView>
        <div>
            <input id="btnSubmit" type="button" value="Submit" class="btn btn-success" />
        </div>
         <div>
         <table>
             <%--<thead><tr><th>Id</th><th>Name</th><th>Location</th></tr></thead>--%>
            <tbody id="tblDetails"></tbody>
        </table>
         </div>
    </form>
</body>
</html>
