<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CrudOperation.aspx.cs" Inherits="CrudOperation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bootstrap Example</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <script>
        $(function () {
            $('#TxtDatepicler').datepicker(
            {
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <div class="panel panel-primary">
                <div class="panel-heading text-center">Panel with panel-primary class</div>
                <br />
                <div class="row">
                    <div class="col-md-1">
                        <asp:Label ID="lblid" runat="server" Text="ID"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtid" runat="server" CssClass="form-group"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <asp:Label ID="lblname" runat="server" Text="Name"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-group"></asp:TextBox>
                    </div>

                    <div class="col-md-1">
                        <asp:Label ID="lblsurname" runat="server" Text="Surname"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtsurname" runat="server" CssClass="form-group"></asp:TextBox>
                    </div>

                    <div class="col-md-1">
                        <asp:Label ID="lblmobile" runat="server" Text="Mobile"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtmobile" runat="server" CssClass="form-group"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-1">
                        <asp:Label ID="lbladdress" runat="server" Text="Address"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-1">
                        <asp:Label ID="lblpincode" runat="server" Text="Pincode"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-1">
                        <asp:Label ID="lbldate" runat="server" Text="Date"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="TxtDatepicler" runat="server"  CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <br />
                <div class="row">
                    <div class="col-md-1 text-center">
                        <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnsave_Click" />
                    </div>
                    <div class="col-md-1 text-center">
                        <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btndelete_Click" />
                    </div>

                    <div class="col-md-1 text-center">
                        <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnupdate_Click" />
                    </div>

                    <div class="col-md-1 text-center">
                        <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-dark" OnClick="btnclear_Click" />
                    </div>
                </div>

                <br />
                <asp:Label ID="lblmsg" runat="server" Visible="false" ForeColor="Red"></asp:Label>
            </div>


            <div class="panel panel-primary">
                <div class="panel-heading text-center">Gridview with panel-primary class</div>
                <br />
                <div class="row">
                    <div class="col-md-1">
                        <asp:GridView ID="Gridview1" runat="server" DataKeyNames="id" AutoGenerateColumns="false" OnRowDeleting="Gridview1_RowDeleting" OnRowUpdating="Gridview1_RowUpdating" OnRowEditing="Gridview1_RowEditing">

                            <Columns>
                                <asp:TemplateField HeaderText="Id">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblname1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtname1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Surname">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsurname1" runat="server" Text='<%# Bind("surname") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtsurname1" runat="server" Text='<%# Bind("surname") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Moblie">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmobile1" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtmobile1" runat="server" Text='<%# Bind("mobile") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lbladdress1" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtaddress1" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Pincode">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpincode1" runat="server" Text='<%# Bind("pincode") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtpincode1" runat="server" Text='<%# Bind("pincode") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldate1" runat="server" Text='<%# Bind("Todaydate") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtdate1" runat="server" Text='<%# Bind("Todaydate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkedit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lnkupate" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Container.DataItemIndex %>'></asp:LinkButton>

                                        <asp:LinkButton ID="lnkcancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%#Container.DataItemIndex %>'></asp:LinkButton>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkdelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Container.DataItemIndex %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>


        </div>
    </form>
</body>
</html>
