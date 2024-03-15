<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BindHyplnkBrtagGrdview.aspx.cs" Inherits="MergeTwoDatasetData_BindHyplnkBrtagGrdview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblgrd" runat="server"></asp:Label>
        </div>
        <div>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                 <Columns>
                     <asp:TemplateField HeaderText="Emp Id">
                         <ItemTemplate>
                           <%--  <asp:Label ID="lblid" runat="server" Text='<%#Eval("empid") %>'></asp:Label>--%>
                              <asp:HyperLink ID="hypLimkempid" runat="server" Text='<%#Eval("empid") %>' NavigateUrl='<%#"../Demo.aspx?"+Eval("empid")+"&back=2" %>'></asp:HyperLink>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Emp Name">
                         <ItemTemplate>
                            <%-- <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>--%>
                              <asp:HyperLink ID="hypLimkname" runat="server" Text='<%#Eval("empname") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.empid", "../Demo.aspx?empid={0}&back=2") %>'></asp:HyperLink>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Ward No">
                         <ItemTemplate>
                            <%-- <asp:Label ID="lblwardno" runat="server" Text='<%#Eval("wardno") %>'></asp:Label>--%>
                              <asp:HyperLink ID="hypLimkward" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.wardno") %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.empid", "../Demo.aspx?empid={0}&back=2") %>'></asp:HyperLink>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Entry Date">
                         <ItemTemplate>
                           <%--  <asp:Label ID="lblentrydate" runat="server" Text='<%#Eval("entrydate") %>'></asp:Label>--%>
                             <a href='<%# "../PDF/"+Eval("pdfname") %>' class="group1"><%# Eval("entrydate") %></a>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Opening Date">
                         <ItemTemplate>
                             <asp:Label ID="lblopeningdatae" runat="server" Text='<%#Eval("openingdate") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
        </div>
        <div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="empid">
                        <ItemTemplate>
                            <asp:Label ID="lblempid" runat="server" Text='<%#Bind("empid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="empfname">
                        <ItemTemplate>
                            <asp:Label ID="lblempfname" runat="server" Text='<%#Bind("empfname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="emplname">
                        <ItemTemplate>
                            <asp:Label ID="lblemplname" runat="server" Text='<%#Bind("emplname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="gender">
                        <ItemTemplate>
                            <asp:Label ID="lblgender" runat="server" Text='<%#Eval("gender").ToString()== "Male" ? "1" : "2" %>'></asp:Label>
                             <asp:Label ID="lblgender1" runat="server" Text='<%#Eval("gender1")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="dob">
                        <ItemTemplate>
                            <asp:Label ID="lbldob" runat="server" Text='<%#Bind("dob") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="city">
                        <ItemTemplate>
                            <asp:Label ID="lblcity" runat="server" Text='<%#Bind("city") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="salary">
                        <ItemTemplate>
                            <asp:Label ID="lblsalary" runat="server" Text='<%#Eval("salary")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="mobile">
                        <ItemTemplate>
                            <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("mobile") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <%-- <asp:LinkButton runat="server" Visible='<%# (Eval("PaymentStatusInd").ToString() != "0") || (Eval("Appno").ToString() != "0" && Eval("AppldateInd").ToString() == "0" && Eval("EmddateInd").ToString() == "0") ? true : false %>' CssClass="btn btn-sm btn-info" CommandName="Show" ID="BtnShow"><i class="fa fa-eye"></i>Show</asp:LinkButton>--%>
                             <asp:LinkButton  runat="server" Visible='<%# (Eval("gender1").ToString() == "1") || (Eval("gender1").ToString() == "2" && Eval("gstatus").ToString() != "0") ? true : false %>' CssClass="btn btn-sm btn-info" CommandName="Show" ID="BtnShow"><i class="fa fa-eye"></i>Show</asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
