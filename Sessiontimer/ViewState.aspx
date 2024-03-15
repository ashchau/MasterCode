<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewState.aspx.cs" Inherits="Sessiontimer_ViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>  
        User Name:-<asp:textbox id="TextBox1" runat="server"></asp:textbox>  
        <br />  
        Password  :-<asp:textbox id="TextBox2" runat="server"></asp:textbox>  
        <br />  
        <asp:button id="btnset" runat="server" onclick="btnset_Click" text="Submit" />  
        <asp:button id="btnget" runat="server" onclick="btnget_Click" text="Restore" />  
    </div> 
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btngetfilename" runat="server" Text="Button" OnClick="btngetfilename_Click" />
            <br />
            <asp:Button ID="btnbindpdf" runat="server" Text="PDF" OnClick="btnbindpdf_Click" />
            <asp:DropDownList ID="ddlpdf" runat="server"></asp:DropDownList>
            <asp:Label runat="server" ID="lblname"></asp:Label>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
         <div style="border-top: none; width: 97%; padding: 5px;">  
            <asp:DataList ID="DataListContent" runat="server" RepeatDirection="Vertical" BorderStyle="None" Style="padding: 0px!important">  
                <%--<ItemTemplate>  
                    <div>  
                        <img src='<%# DataBinder.Eval(Container.DataItem,"Icon") %>' id="ImgIcon" />  
                        <asp:LinkButton ID="ButtonDownload" runat="server" Style="padding-left: 5px; text-decoration: none"  
                            ToolTip="Click here to download" CommandName="Download" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"DownLoadLink") %>'  
                            Text=' <%# DataBinder.Eval(Container.DataItem,"FileName") %>'></asp:LinkButton>  
                        <asp:LinkButton ID="lnkDelete" Text="Delete" CommandArgument='<%# Eval("DownLoadLink") %>'  
                            Style="text-decoration: none; font-size: large; color: red;" runat="server" OnClick="DeleteFile" />  
                    </div>  
                </ItemTemplate>  --%>
            </asp:DataList>  
        </div>  
        <div>
            <asp:DropDownList ID="ddlid" runat="server">
                <asp:ListItem Selected="True" Text="<--Select id-->" Value="0"></asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
               <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlname" runat="server">
                <asp:ListItem Selected="True" Text="<--Select Name-->" Value="0"></asp:ListItem>
                <asp:ListItem Text="ashok" Value="ashok"></asp:ListItem>
                <asp:ListItem Text="kamal" Value="kamal"></asp:ListItem>
                <asp:ListItem>Monika</asp:ListItem>
            </asp:DropDownList>
             <asp:DropDownList ID="ddlsalary" runat="server">
                <asp:ListItem Selected="True" Text="<--Select Salary-->" Value="0"></asp:ListItem>
                <asp:ListItem Text="25000" Value="25000"></asp:ListItem>
                <asp:ListItem Text="15000" Value="15000"></asp:ListItem>
                <asp:ListItem>20000</asp:ListItem>
            </asp:DropDownList>

            <asp:GridView ID="GridView2" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
