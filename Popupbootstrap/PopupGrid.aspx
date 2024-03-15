<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="PopupGrid.aspx.cs" Inherits="Popupbootstrap_PopupGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <%-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>--%>
       <script type="text/javascript">
           $(function () {
             $('#btnSubmit').click(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "PopupGrid.aspx/BindDatatable",
                    data: "{ }",
                    dataType: "json",
                    success: function (data) {
                        $('#tblDetails').empty();//protect to bind same data again and again..
                        for (var i = 0; i < data.d.length; i++) {
                            $("#tblDetails").append("<tr><td>" + data.d[i].UserId + "</td><td>" + data.d[i].UserName + "</td><td>" + data.d[i].Location + "</td></tr>");
                            //$("#gvDetails").append("<tr><td>" + data.d[i].UserId + "</td><td>" + data.d[i].UserName + "</td><td>" + data.d[i].Location + "</td></tr>");
                        }
                        console.log(data);
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="gvDetails" runat="server">
            <HeaderStyle BackColor="#DC5807" Font-Bold="true" ForeColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="UserId" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="UserId" Text='<%#Eval("UserId")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UserName" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="UserName" Text='<%#Eval("UserName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Location" Text='<%#Eval("Location")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <table>
            <tbody id="tblDetails"></tbody>
        </table>
        <div>
            <input id="btnSubmit" type="button" value="Submit" class="btn btn-success" />
        </div>
    </div>

</asp:Content>

