<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GST.aspx.cs" Inherits="GST" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <%-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <script src="packages/jQuery.3.5.1/Content/Scripts/jquery-3.5.1.min.js"></script>
        <script type="text/javascript">
          $(document).ready(function () {
            $(function () {
                $("[id*=txtQuantity]").val("0");
            });
            $("body").on("change keyup", "[id*=txtQuantity]", function () {

                var quantity = parseFloat($.trim($(this).val()));
                if (isNaN(quantity)) {
                    quantity = 0;
                }

                $(this).val(quantity);
                var row = $(this).closest("tr");
                $("[id*=lblTotal]", row).html(parseFloat($(".price", row).html()) * parseFloat($(this).val()));

                var grandTotal = 0;
                $("[id*=lblTotal]").each(function () {
                    grandTotal = grandTotal + parseFloat($(this).html());
                });
                $("[id*=lblGrandTotal]").html(grandTotal.toString());
            });
          });
        </script>

    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        table {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border: 1px solid #ccc;
            }
    </style>

    

</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Item" HeaderText="Item" />
                <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-CssClass="price" />
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        Grand Total:
    <asp:Label ID="lblGrandTotal" runat="server" Text="0"></asp:Label>
               
    </form>
</body>
</html>
