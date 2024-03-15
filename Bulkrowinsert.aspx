<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bulkrowinsert.aspx.cs" Inherits="Bulkrowinsert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <h3>Insert Multiple Record in a SQL Database using ASP.Net application.</h3>
    <div style="padding:10px 0px">
        No of record you want to insert : 
        <asp:TextBox ID="txtNoOfRecord" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnAddRow" runat="server" Text="Add Rows" OnClick="btnAddRow_Click" />
 
    </div>
    <asp:GridView ID="gvContacts" runat="server" AutoGenerateColumns="false" CellPadding="5">
        <Columns>
            <asp:TemplateField HeaderText="SL No.">
                <ItemTemplate>
                    <%#Container.DataItemIndex +1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name">
                <ItemTemplate>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact No">
                <ItemTemplate>
                    <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div style="padding:10px 0px;">
        <asp:Panel ID="Panel1" runat="server" Visible="false">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            &nbsp;<asp:Label ID="lblMsg" runat="server" ></asp:Label>
        </asp:Panel>
    </div>
    <div>
        <b>Database Records</b>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="5">
                <Columns>
                    <asp:TemplateField HeaderText="SL No.">
                        <ItemTemplate>
                            <%#Eval("ID") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <%#Eval("FirstName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                           <%#Eval("LastName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact No">
                        <ItemTemplate>
                            <%#Eval("ContactNo") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
