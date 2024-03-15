<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BankDepositwithoutmaster.aspx.cs" Inherits="Gridview_BankDepositwithoutmaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Deposite</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
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
        </div>
    </form>
    <script type="text/javascript">
    $(function () {
        $("[id*=txtQuantity]").val("0");
    });
    $("body").on("change keyup", "[id*=GridView1][id*=txtQuantity]", function () {
        debugger;
        //Check whether Quantity value is valid Float number.
        var quantity = parseFloat($.trim($(this).val()));
        if (isNaN(quantity)) {
            quantity = 0;
        }
 
        //Update the Quantity TextBox.
        $(this).val(quantity);
 
        //Calculate and update Row Total.
        var row = $(this).closest("tr");
        $("[id*=lblTotal]", row).html(parseFloat($(".price", row).html()) * parseFloat($(this).val()));
 
        //Calculate and update Grand Total.
        var grandTotal = 0;
        $("[id*=lblTotal]").each(function () {
            grandTotal = grandTotal + parseFloat($(this).html());
        });
        $("[id*=lblGrandTotal]").html(grandTotal.toString());
    });
</script>
</body>
</html>
