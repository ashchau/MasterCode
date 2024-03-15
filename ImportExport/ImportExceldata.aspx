<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportExceldata.aspx.cs" Inherits="ImportExport_ImportExceldata" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <style>
        #loading {
            position: fixed;
            display: block;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            text-align: center;
            opacity: 0.7;
            background-color: #fff;
            z-index: 99;
        }

        #loading-image {
            position: absolute;
            top: 100px;
            left: 240px;
            z-index: 100;
        }
    </style>
 <script>

      $(window).on('load', function () {
            setTimeout(removeLoader, 1000); //wait for page load PLUS two seconds.
            //$('#loading').hide();
        });
        function removeLoader() {
            $("#loading").fadeOut(500, function () {
                // fadeOut complete. Remove the loading div
                $("#loading").hide(); //makes page more lightweight .remove();
            });
        }
 </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="loading">
            <img id="loading-image" src="../images/loaderimg.gif" alt="Loading..." />
        </div>
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:DropDownList ID="ddlOrg" runat="server">
                <asp:ListItem Selected="True" Value="0">&lt;--Select Organization--&gt;</asp:ListItem>
                <asp:ListItem Value="1">Admin</asp:ListItem>
                <asp:ListItem Value="2">Manager</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnupload" runat="server" Text="Import/Upload" OnClick="btnupload_Click" />
            <asp:Button ID="btnimport" runat="server" Text="Import" OnClick="btnimport_Click" />
            <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>
             <asp:Label ID="lblsuccess" runat="server" Text="Label"></asp:Label>
             <asp:Label ID="lblerror" runat="server" Text="Label"></asp:Label>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:DropDownList ID="ddlpdf" runat="server" OnSelectedIndexChanged="ddlpdf_SelectedIndexChanged" AutoPostBack="true">
             
            </asp:DropDownList>
            <asp:GridView ID="GridView2" runat="server"></asp:GridView>
        </div>
        <div>
            <asp:Button ID="btnexportpdf" runat="server" Text="EXPORT PDF" OnClick="btnexportpdf_Click" />
            <asp:Button ID="btnexportexcel" runat="server" Text="EXPORT EXCEL" OnClick="btnexportexcel_Click"/>
        </div>
        <div>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="true">
                 <Columns>
                         <asp:TemplateField HeaderText="Sn.">
                            <ItemTemplate>
                                <asp:Label ID="lblsn" runat="server" Text='<%# Bind("prod_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prod Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                         <asp:TemplateField HeaderText="Prod bind Name">
                            <ItemTemplate>
                                <%# Eval("prod_name")%>
                               <%-- <asp:Label ID="lblpname" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label>--%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="cmbChargE"  runat="server" >
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbChargF" runat="server" >
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prod Price">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("prod_price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <a href='<%# Eval("prod_imgpath") %>'> <asp:Image ID="Image1" runat="server" ImageUrl='<%# "http://localhost:63913" + Eval("prod_imgpath") %>' Height="50PX" Width="50PX" /></a>
                                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Bind("prod_imgpath") %>'>Download IMG</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="true">
                <Columns>
                     <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <a href='<%# Eval("prod_imgpath") %>'> <asp:Image ID="Image1" runat="server" ImageUrl='<%# "http://localhost:63913" + Eval("prod_imgpath") %>' Height="50PX" Width="50PX" /></a>
                                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Bind("prod_imgpath") %>'>Download IMG</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
