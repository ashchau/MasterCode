<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="BankDepositform.aspx.cs" Inherits="Gridview_BankDepositform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--    <script>
        $(document).ready(function () {
            // attach click event handler to checkboxes
            $('#<%=grdamt.ClientID%> input[type="checkbox"]').click(function () {
                // check if any checkbox is checked
                if ($('#<%=grdamt.ClientID%> input[type="checkbox"]:checked').length > 0) {
          // trigger button click event
          $('#<%=grdamt.ClientID%> input[type="submit"]').click();
                }
            });
        });
    </script>--%>
   <%-- <script>
    $(document).ready(function () {
        // Attach click event listener to the 'Edit' link
        $('#<%=grdamt.ClientID%> input[type="checkbox"]').on('click', function (event) {
            event.preventDefault(); // prevent default link behavior

            // Toggle the display property of the textbox
            var textbox = $(this).siblings('.my-textbox');
            textbox.toggle();
        });
        });
        function chkclick(this) {
             $('#<%=grdamt.ClientID%> input[type="checkbox"]').on('click', function (event) {
            event.preventDefault(); // prevent default link behavior

            // Toggle the display property of the textbox
            var textbox = $(this).siblings('.my-textbox');
            textbox.toggle();
        });
        }
</script>--%>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3>Deposit Form</h3>
            </div>
            <div class="panel-body">
                <div>
                    <asp:GridView ID="grdamt" runat="server" AutoGenerateColumns="false"  CssClass="table table-bordered" DataKeyNames="amtid">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkcheck" runat="server" CssClass="checkbox"/>
                                    <asp:Label ID="lblamtlist" runat="server" Text='<%#Eval("amtvalues") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                    <%-- <asp:Label ID="lblnotecount" runat="server" Text='<%#Eval("notecount") %>'></asp:Label>--%>
                                      <asp:TextBox ID="txtcount"  runat="server" CssClass="my-textbox" style="display:block;"></asp:TextBox>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtnoteno" Text='<%#Eval("notecount") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                     <asp:TextBox ID="txtsubtotal"  runat="server"></asp:TextBox>
                                  <%--   <asp:Label ID="lblsubtotal" runat="server" Text='<%#Eval("notesubtotal") %>'></asp:Label>--%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtsubamt" runat="server" Text='<%#Eval("notesubtotal") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnsave_Click" />
                <asp:Label ID="lbltotal" runat="server" Text="" Visible="false"></asp:Label>
            </div>
        </div>
    </div>
     <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            alert('hi');
                $().change(function(){
                   var checked = $(this).is(':checked');
                   if(checked){
                     $('#<%=grdamt.ClientID%> input[type="textbox"]').each(function(){
                       $(this).prop("checked",true);
                     });
                   }else{
                     $('#<%=grdamt.ClientID%> input[type="textbox"]').each(function(){
                       $(this).prop("checked",false);
                     });
                   }
               });
    
            $(".checkbox").click(function () {
                debugger;
                    if($(".checkbox").length == $(".checkbox:checked").length) {
                 
                        $("#checkall").prop("checked", true);
                        $('#<%=grdamt.ClientID%> input[type="textbox"]').prop('disabled', false);
		            } else {
                        $("#checkall").prop("checked", false);
                        $('#<%=grdamt.ClientID%> input[type="textbox"]')..removeAttr('disabled');
		            }

                 });
            });
        </script>
</asp:Content>

