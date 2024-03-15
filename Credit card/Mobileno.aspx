<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mobileno.aspx.cs" Inherits="Credit_card_Mobileno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtCreditCardNum" runat="server" Text="1111222233334444" />
            <br />
            <hr />
            <asp:Label ID="lblCreditCardNum" runat="server" />
            <br />
            <asp:Button runat="server" Text="Hide Characters" OnClick="HideCharacters" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                     <asp:TemplateField HeaderText="Sn.">
                            <ItemTemplate>
                                <asp:Label ID="lblsn" runat="server" Text='<%# Bind("empid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Emp Name">
                            <ItemTemplate>
                                <asp:Label ID="lblname" runat="server" Text='<%# Bind("empname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salary">
                            <ItemTemplate>
                                <asp:Label ID="lblsalary" runat="server" Text='<%# Bind("salary") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="lblmobile" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
