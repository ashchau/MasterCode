<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Demo.aspx.cs" Inherits="Demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bootstrap Example</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#<%= txtDate.ClientID %>").datepicker();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">

            <div class="panel-success">
                <div class="panel-body panel-heading">
                    <h3 style="text-align: center">Demo for crud operation with all field in asp.net</h3>
                </div>
                <div class="panel-body bg-success">
                    <div class="row">
                        <div class="col-md-2">
                            <asp:Label ID="lblname" runat="server" Text="Name"></asp:Label>
                            <asp:TextBox ID="txtname" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Label ID="lblsurname" runat="server" Text="SurName"></asp:Label>
                            <asp:TextBox ID="txtsurname" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <asp:Label ID="lbladdre" runat="server" Text="Addresss"></asp:Label>
                            <asp:TextBox ID="txtaddre" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <asp:Label ID="lblmobile" runat="server" Text="Mobile"></asp:Label>
                            <asp:TextBox ID="txtmobile" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <asp:Label ID="Label1" runat="server" Text="Pincode"></asp:Label>
                            <asp:TextBox ID="txtpincode" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <div>
                                <asp:Label ID="lblgender" runat="server" Text="Gender"></asp:Label>
                                <br />
                                <asp:RadioButton ID="rb_male" runat="server" Text="Male" GroupName="Gen" />
                                &nbsp&nbsp&nbsp&nbsp
                                <asp:RadioButton ID="rb_female" runat="server" Text="Female" GroupName="Gen" />
                            </div>
                        </div>

                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-3">
                            <div>
                                <asp:Label ID="lblhobby" runat="server" Text="Hobby"></asp:Label>
                                <br />
                                <asp:CheckBox ID="chkfootball" runat="server" Text="Football" AutoPostBack="true" />
                                &nbsp&nbsp&nbsp&nbsp
                                <asp:CheckBox ID="chkchess" runat="server" Text="Chess" AutoPostBack="true" />
                                &nbsp&nbsp&nbsp&nbsp
                                 <asp:CheckBox ID="chkcricket" runat="server" Text="Cricket" AutoPostBack="true" />
                            </div>
                        </div>



                      <%--  <div class="col-md-3">
                            <div>
                                <asp:CheckBoxList ID="chklist" runat="server" AutoPostBack="true">
                                    <asp:ListItem>Hindi</asp:ListItem>
                                    <asp:ListItem>English</asp:ListItem>
                                    <asp:ListItem>Physics</asp:ListItem>
                                    <asp:ListItem>Chemestry</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>--%>

                        <div class="col-md-3">
                            <div>
                                <asp:Label ID="lbldate" runat="server" Text="Submition Date"></asp:Label>
                                <asp:TextBox ID="txtDate" runat="server" />
                            </div>
                        </div>

                      
                    </div>

                    <div class="row">
                          <div class="col-md-2">
                            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnsave_Click" />
                        </div>

                          <div class="col-md-2">
                            <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnupdate_Click" />
                        </div>

                          <div class="col-md-2">
                            <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btndelete_Click" />
                        </div>

                         <div class="col-md-2">
                            <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-danger" OnClick="btnclear_Click" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <asp:Label ID="lblmsg" runat="server" ForeColor="Red"  Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div>

        </div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </form>
</body>
</html>
