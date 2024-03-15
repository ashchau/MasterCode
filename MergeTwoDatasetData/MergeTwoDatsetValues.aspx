<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MergeTwoDatsetValues.aspx.cs" Inherits="MergeTwoDatasetData_MergeTwoDatsetValues" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div>
            <h1>How to Merge Two Dataset Value in a Single Column</h1>
            <hr />
        </div>
        <div>
            <asp:GridView ID="grd" runat="server"></asp:GridView>
        </div>
        <div>
            <asp:DropDownList ID="ddlname" runat="server"></asp:DropDownList>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="lblgrd" runat="server"></asp:Label>
        </div>
        <div>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:Label ID="lblid" runat="server" Text='<%#Eval("empid") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                         <ItemTemplate>
                            <%-- <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>--%>
                              <asp:HyperLink ID="hypLimkname" runat="server" Text='<%#Eval("empname") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.empid", "../Demo.aspx?empid={0}&back=2") %>'></asp:HyperLink>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                         <ItemTemplate>
                            <%-- <asp:Label ID="lblwardno" runat="server" Text='<%#Eval("wardno") %>'></asp:Label>--%>
                              <asp:HyperLink ID="hypLimkward" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.wardno") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.empid", "../Demo.aspx?empid={0}&back=2") %>'></asp:HyperLink>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:Label ID="lblentrydate" runat="server" Text='<%#Eval("entrydate") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:Label ID="lblopeningdatae" runat="server" Text='<%#Eval("openingdate") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
        </div>
    </form>
</body>
</html>
