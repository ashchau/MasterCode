<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="changepdffile.aspx.cs" Inherits="Admin_Change_PDF_changepdffile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Scripts/jquery-3.5.1.js"></script>
        <script src="Scripts/jquery-3.5.1.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
        <link href="Content/bootstrap.css" rel="stylesheet" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" colspan="6" height="25">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" class="topTableHeadingE" colspan="6" height="25">
                <asp:Label ID="lblidentity" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="tabletextE" width="35%">
                <br />
                Select Page name&nbsp; &nbsp;<br />
            </td>
            <td align="left" class="tabletext1">
                <br />
                <asp:DropDownList ID="ddlPage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPage_SelectedIndexChanged"
                    SkinID="ddlEnglish">
                </asp:DropDownList>&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPage"
                    ErrorMessage="Select Page Name" ForeColor="" InitialValue="---Select page name---"
                    SkinID="reqfieldEnglish"></asp:RequiredFieldValidator><br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblError" runat="server" Font-Bold="True" SkinID="lblmessageE" Visible="False"></asp:Label><br />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;<asp:DataGrid ID="grdpdf" runat="server" AutoGenerateColumns="False" BackColor="WhiteSmoke"
                    BorderColor="#404040" GridLines="Horizontal" OnItemCreated="grdpdf_ItemCreated"
                  ShowHeader="False" Width="80%" OnPreRender="grdpdf_PreRender">
                    <Columns>
                        <asp:TemplateColumn HeaderText="Check">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkupload" runat="server" AutoPostBack="false" Width="25px" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="linkname" HeaderText="pagename">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Names="Verdana" Font-Overline="False"
                                Font-Size="12px" Font-Strikeout="False" Font-Underline="False" ForeColor="DimGray"
                                HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Browse">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Top" />
                            <ItemTemplate>
                                <asp:FileUpload ID="Flupload" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="serno" HeaderText="Ser no" Visible="False">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="pageid" HeaderText="Page id" Visible="False">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="pdffilename" HeaderText="File name" Visible="False">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Names="Verdana" Font-Overline="False"
                                Font-Size="14px" Font-Strikeout="False" Font-Underline="False" ForeColor="LightGray"
                                HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="lag" HeaderText="lang" Visible="False"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid></td>
        </tr>
        <tr>
            <td bgcolor="whitesmoke" class="tabletextE" colspan="2" width="100%">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" SkinID="Button"
                    Text="Update" />
                &nbsp; &nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" CausesValidation="False" OnClick="btnBack_Click"
                    SkinID="Button" Text="Back" /></td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="25">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

