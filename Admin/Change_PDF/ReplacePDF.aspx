<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="ReplacePDF.aspx.cs" Inherits="Admin_Change_PDF_ReplacePDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
            <div class="col-md-12">
                <h3 class="bg-warning urban-developement-tax">Replace PDF</h3>
            </div>
        </div><br>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">                   

                <table width="100%">
                    <tr  height="30px">
                        <td width="20%"></td>
                        <td align="left" class="tabletext1" >
                            Page Name <span style="color: #ff0033">*</span></td>
                        <td align="left" colspan="2" style="color: #000000">
                            <asp:DropDownList ID="ddl_PageName" runat="server" CssClass="textbox" 
                                Width="205px" AutoPostBack="True" 
                                onselectedindexchanged="ddl_PageName_SelectedIndexChanged" >
                                <asp:ListItem Selected="True" Value="0">-- Select Page --</asp:ListItem>  
                                
                                <asp:ListItem Value="110">Application Forms</asp:ListItem>     
                                <asp:ListItem Value="111">Auction of Hoarding</asp:ListItem>
                                <asp:ListItem Value="112">Auction of Parking</asp:ListItem>
                                <asp:ListItem Value="113">Auction of Plots</asp:ListItem>
                                <asp:ListItem Value="114">Building Permission</asp:ListItem>
                                <asp:ListItem Value="115">ByLaws/Notification</asp:ListItem>
                                <asp:ListItem Value="116">Change of Land Use</asp:ListItem> 
                                <asp:ListItem Value="117">e-News Letter</asp:ListItem>   
                                <asp:ListItem Value="118">Municipal Act</asp:ListItem>        
                                <asp:ListItem Value="119">Orders & Circular</asp:ListItem>  
                                <asp:ListItem Value="120">Right to Information</asp:ListItem>  
                                <asp:ListItem Value="121">SPIO List Pdf</asp:ListItem>    
                                                 
 

                                <asp:ListItem Value="99">Contact List Pdf</asp:ListItem>   
                                <asp:ListItem Value="100">Our Corporator Pdf</asp:ListItem>                                                               
                                <asp:ListItem Value="101">NitTender Pdf</asp:ListItem>  
                                <asp:ListItem Value="102">Balnce Sheet Pdf</asp:ListItem>          
                                <asp:ListItem Value="103">Budget Pdf</asp:ListItem>           
                                <asp:ListItem Value="104">Imp-Notices Pdf</asp:ListItem>         
                                <asp:ListItem Value="105">NEWS Pdf</asp:ListItem>   
                                                          
                            </asp:DropDownList>
                            <%-- <asp:RequiredFieldValidator ID="ReqFdValidLang" runat="server" ControlToValidate="ddl_PageName" CssClass="error" ErrorMessage="Required  " InitialValue="0"></asp:RequiredFieldValidator></td> --%>
                    </tr>

<%--                <tr colspan="2">
                        <td width="20%"></td>
                        <td align="left" class="tabletext1">
                            Link Name <span style="color: #ff0033">*</span></td>
                        <td align="left" colspan="2" style="color: #000000">
                            <asp:TextBox ID="txt_LnkNm" runat="server" Width="200px" TextMode="MultiLine" ></asp:TextBox></td>
                    </tr>
                    <tr colspan="2">
                        <td width="20%"></td>
                        <td align="left" class="tabletext1">
                            Display Status</td>
                        <td align="left" colspan="2">
                            <asp:DropDownList ID="ddl_Status" runat="server" CssClass="textbox" Width="205px" Enabled="false">
                                <asp:ListItem Selected="True" Value="True">Display</asp:ListItem>
                                <asp:ListItem Value="False">Not Display</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>--%>

                    <tr colspan="2" height="30px" class="uploadfile">
                        <td width="20%"></td>
                        <td align="left" class="tabletext1">
                            Upload File</td>
                        <td align="left" colspan="2">
                            <asp:FileUpload ID="Flupload" runat="server" Width="288px" /></td>
                    </tr>
                    <tr colspan="2" height="30px">
                        <td align="center" class="error" colspan="100%">
                            <asp:Label ID="lblError" runat="server" CssClass="error" Font-Bold="True" ForeColor="Red"></asp:Label>      
                        </td>
                    </tr>
                    <tr colspan="2" height="30px">
                        <td align="center" class="error" colspan="3">
                            <asp:Button ID="btt_add" runat="server" Text="Update" Width="100px" onclick="btt_add_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btt_Clear" runat="server" Width="100px" Text="Clear" onclick="btt_Clear_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btt_Exit" runat="server" Text="<< Back" Width="100px" onclick="btt_Exit_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btn_Logout" runat="server" Text="Logout" Width="100px" PostBackUrl="~/Admin/AdminSection/Default.aspx" />
                        </td>
                    </tr>
                    <tr colspan="2" height="20px">
                        <td align="center" class="error" colspan="3">
                            <br />      
                        </td>
                    </tr>
                </table>

                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
</asp:Content>

