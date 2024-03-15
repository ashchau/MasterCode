<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridOnRowcommand.aspx.cs" Inherits="Gridview_GridOnRowcommand" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
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
    <script>
        $(document).ready(function () {
            //$("#showHide").on('click', function (event) {
            //    event.preventDefault();
            //    if ($('#txtPassword').attr("type") == "text") {
            //        $('#txtPassword').attr('type', 'password');
            //        $('#showHide i').addClass("fa-eye-slash");
            //        $('#showHide i').removeClass("fa-eye");
            //    } else if ($('#txtPassword').attr("type") == "password") {
            //        $('#txtPassword').attr('type', 'text');
            //        $('#showHide i').removeClass("fa-eye-slash");
            //        $('#showHide i').addClass("fa-eye");
            //    }
            //});
        });
    </script>
     <script>
         function showhide(id, btn) {
             debugger
             var type = $(id).attr("type");
             if (type == "text") {
                 $(id).attr("type", "password");
                 $(btn).children("i").removeClass("fa-eye-slash");
                 $(btn).children("i").addClass("fa-eye");
             }
             else {
                 $(id).attr("type", "text");
                 $(btn).children("i").addClass("fa-eye-slash");
                 $(btn).children("i").removeClass("fa-eye");
             }
             return false;
         }
    </script>
    <script>
        function requiredfield(txtid) {
            var txtname = $(txtid).val();
            if (txtname == '') {
               $(txtid).trigger('blur');
                alert('please fill the name');
            }
            //return false;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left:10px; margin-right:10px;">
            <div>
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                    <tr>
                        <td style="padding-bottom: 10px">Name:<br />
                            <asp:TextBox ID="txtName" runat="server" onfocusout="requiredfield(this)"/>  <%--onfocusout--%>
                           htmname: <input type="text" id="txtn" onfocusout="requiredfield(this)" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-bottom: 10px">Country:<br />
                            <asp:TextBox ID="txtCountry" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
                            <asp:Button  ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel_Click" />
                        <%--<asp:Button ID="btnupdate" runat="server" Text="Update"  />
                        <asp:Button ID="btnsaveall" runat="server" Text="Save All"  />--%>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
               
                UserId :
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                 <asp:LinkButton OnClientClick="return showhide(txt_name,this); " runat="server" ID="btnshow"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></asp:LinkButton>
                Password :
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
               <%-- <asp:LinkButton  runat="server" ID="LinkButton3"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></asp:LinkButton>--%>
                <asp:LinkButton OnClientClick="return showhide(txtPassword,this); " runat="server" ID="showHide"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></asp:LinkButton>

               <%-- <button onclick="showhide(txtPassword,showHide)" type="button" id="showHide1"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></button>--%>

                <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-success btn fa-xs" />
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="SrNo" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="SrNo" Text='<%#Eval("CustomerId")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Serno">
                            <ItemTemplate>
                                <asp:Label ID="serno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
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
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary btn fa-xs" CommandName="E" CommandArgument='<%#Eval("CustomerId")%>'><i class="far fa-comment-alt-edit"></i>Edit</asp:LinkButton>
                                 <asp:LinkButton Text="Delete" runat="server" CssClass="btn btn-danger btn-xs" CommandName="D" CommandArgument='<%#Eval("CustomerId")%>' OnClientClick="return ShowAleart();" ><i class="fa fa-trash" aria-hidden="true"></i> Delete</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-info btn fa-xs" CommandName="C" ><i class="fas fa-pen-nib "></i>Cancel</asp:LinkButton>
                                <%--<asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" CommandArgument="E" />--%>
                                <%--<asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument="C" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div>
                    <asp:Label ID="lblmsg" runat="server" Text='GridView1.Rows.Count.ToString();'></asp:Label>
                </div>
                <div>
                    <a class="cls_copy_pg_action copyAction copy-action-btn" data-value="THIS TEXT WILL BE COPIED"> <i class="far fa-copy"></i> Copy</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
