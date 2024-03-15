<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="Replacepdf2.aspx.cs" Inherits="Admin_Change_PDF_Replacepdf2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container citybg">
        <div class=" col-sm-10 col-sm-offset-1 col6css">
            <div class="row">
                <div class="mt0">
                   <h1 class="text-center" style="margin-top:0px!important; margin-bottom:0px;"><strong>Replace-PDF</strong></h1>
                    <div class="row">
                        <div class="col-sm-12 text-center" style="margin-bottom:30px; margin-top:30px;">
                            <asp:Label ID="lbl_ErrorMsg" runat="server" Text="" Font-Bold="true" ForeColor="Purple" Font-Size="Medium"></asp:Label>
                            <br />
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Group</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="ddl_Group" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_Group_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="--Select Group--" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Act and By Law"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Application Form"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Balance Sheet"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="BPL List"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Budget"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="E-News Letter"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="Meeting Minutes"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="News"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="Nit-Tender"></asp:ListItem>
                                            <asp:ListItem Value="10" Text="Notices"></asp:ListItem>
                                            <asp:ListItem Value="11" Text="Order and Circulars"></asp:ListItem>
                                            <asp:ListItem Value="12" Text="RTI"></asp:ListItem>
                                            <asp:ListItem Value="13" Text="Ward Map"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Select&nbsp;PDF</label>
                                    <div class="col-sm-9">
                                        <asp:FileUpload ID="fl_uplod" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>

                            
                            <div class="col-sm-4 text-center">
                                <asp:Button Text="Add"     id="btn_Add"    runat="server" CssClass="btn btn-sm btn-success" Width="80px" OnClick="btn_Add_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button Text="Clear"   id="btn_Clear" runat="server" CssClass="btn btn-sm btn-warning"   Width="80px" OnClick="btn_Clear_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button Text="Back"     runat="server" CssClass="btn btn-sm btn-danger"    Width="80px" PostBackUrl="~/Presentation/Admin/SelecttypeNew.aspx" />
                            </div>
                        <div class="col-sm-10" style="margin-top: 50px;font-size: 15px;margin-left: 20px; margin-bottom:30px;">
                           <strong><span style="color:#ff0000">NOTE</span> : <em>PDF replace only if the existing PDF on website & uploded PDE file has same name within the selelcted Group. </em></strong>
                            <br />
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

