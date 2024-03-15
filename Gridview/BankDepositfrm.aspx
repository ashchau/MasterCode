<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="BankDepositfrm.aspx.cs" Inherits="Gridview_BankDepositfrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div class=" panel panel-primary">
            <div class="panel-heading">
                <h3>Deposit Form</h3>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                   
                </ContentTemplate>
                <Triggers></Triggers>
            </asp:UpdatePanel>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                            <Columns>
                                 <asp:TemplateField HeaderText="Check">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                    </div>
                    <div>
                        Grand Total:
                        <asp:Label ID="lblGrandTotal" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
    $(function () {
        $("[id*=txtQuantity]").val("0");
    });
    $("body").on("change keyup", "[id*=txtQuantity]", function () {
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
</asp:Content>

