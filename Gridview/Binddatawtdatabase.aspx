<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Binddatawtdatabase.aspx.cs" Inherits="Gridview_Binddatawtdatabase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <title></title>
    <script type="text/javascript">
        function ShowAleart() {
            return confirm("Do you want to Delete? ");
            //alert(result);
        }
    </script>
    <style>
       .table th{
                background-color: burlywood;
                color: cornsilk;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left: 10px; margin-right:10px;">
            <asp:GridView ID="GridView1" runat="server" CssClass="Grid table table-bordered" AutoGenerateColumns="False"
                EmptyDataText="No records has been added." OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting"  >
                <Columns>
                   <%-- <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="120" >
<ItemStyle Width="120px"></ItemStyle>
                    </asp:BoundField>--%>
                    <asp:TemplateField HeaderText="Srno" ItemStyle-Width="50">
                        <ItemTemplate>
                            
                            <%-- <asp:Label ID="lid" runat="server" Text='<%#Container.DataItemIndex +1 %>' ></asp:Label>--%>
                             <asp:Label ID="lserno" runat="server" Text='<%# Eval("SrNo") %>' ></asp:Label>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lname" runat="server" Text='<%# Eval("Name") %>' ></asp:Label>
                                           
                                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_name" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lcontry" runat="server" Text='<%# Eval("Country") %>' ></asp:Label>
                                           
                                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_country" runat="server" Text='<%# Eval("Country") %>'></asp:TextBox>
                        </EditItemTemplate>
                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="152px">
                        <ItemTemplate>
                            <asp:Button ID="btnedit" runat="server" Text="Edit" OnClick="btnedit_Click" />
                            <asp:Button ID="btndel" runat="server" Text="Del" CommandName="Delete" />
                             <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click"  />
                            <asp:LinkButton Text="Edit" runat="server" CssClass="btn btn-primary btn-xs" CommandName="Edit" ><i class="far fa-comment-alt-edit"></i>Edit</asp:LinkButton>
                            <%-- <asp:LinkButton Text="Edit" runat="server" CommandName="Edit" /> --%>
                             <asp:LinkButton Text="Delete" runat="server" CssClass="btn btn-danger btn-xs" OnClick="OnDelete" OnClientClick="return ShowAleart();" ><i class="fa fa-trash" aria-hidden="true"></i> Delete</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton Text="Update" runat="server" OnClick="OnUpdate"><i class="fas fa-pen-nib text-success"></i></asp:LinkButton>
                            <asp:LinkButton Text="Cancel" runat="server" OnClick="OnCancel" /><i class="fas fa-window-close text-danger"></i>
                            <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" /><i class="fas fa-pen-nib text-info"></i>
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                <tr>
                    <td style="padding-bottom: 10px">Name:<br />
                        <asp:TextBox ID="txtName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 10px">Country:<br />
                        <asp:TextBox ID="txtCountry" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                        <asp:Button  ID="btninsert" runat="server" Text="INSERT" OnClick="btninsert_Click"/>
                        <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click1" />
                        <asp:Button ID="btnsaveall" runat="server" Text="Save All" OnClick="btnsaveall_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="SrNo">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="SrNo" Text='<%#Eval("SrNo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lname" runat="server" Text='<%# Eval("Name") %>'></asp:Label>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_name" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lcontry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_country" runat="server" Text='<%# Eval("Country") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actionn">
                        <ItemTemplate>
                            <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" CommandArgument="E" />
                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument="C" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
