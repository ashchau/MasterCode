<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="LoginwithOTP.aspx.cs" Inherits="Login_LoginwithOTP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header text-center">
                <h3>Login With OTP</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-4">
                            <label>User id/Mobile no </label>
                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                         <asp:Panel ID="PnlPassword" runat="server" Visible="false">
                            <div class="col-4">

                                <div class="form-group row">
                                    <span>
                                        <i class="fa fa-lock"></i>
                                        <asp:TextBox runat="server" ID="txtpassword" MaxLength="6" CssClass="form-control icon-place2" TextMode="Password" placeholder="Enter OTP"></asp:TextBox>
                                    </span>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
             
                  <span id="timerLabel" runat="server"></span>
            </div>
            <div class="card-footer">
                <div class="row text-center">
                    <div class="col-12">
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        <asp:Button ID="btnotp" runat="server" Text="Send OTP" CssClass="btn btn-primary" OnClick="btnotp_Click" />
                        <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-success" OnClick="btnlogin_Click" />
                    </div>
                </div>
               
            </div>
            <div class="row">
                    <asp:Panel ID="pnltime" runat="server" Visible="false">
                        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <b style="color: red;">Time Left :</b>
                                        <asp:Label Style="font-weight: bold; color: red; width: auto; float: none;" ID="Label1" runat="server">180</asp:Label>
                                        <asp:Label Style="font-weight: bold; color: red; width: auto; float: none;" ID="LblSec" runat="server"> Sec</asp:Label>

                                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick">  <%--Interval="1000"--%>
                                        </asp:Timer>
                                        <asp:Button runat="server" ID="btnCancel" Style="font-weight: bold; color: red;" OnClick="btnCancel_Click" Text="Cancel"></asp:Button>

                                    </ContentTemplate>

                                </asp:UpdatePanel>
                    </asp:Panel>
                </div>
        </div>
    </div>
<%--<script type="text/javascript">
    $("#btnotp").click(function () {
        function countdown() {
            alert("test");
            seconds = document.getElementById("timerLabel").innerHTML;
            if (seconds > 0) {
                document.getElementById("timerLabel").innerHTML = seconds - 1;
                setTimeout("countdown()", 1000);
            }
        }
        setTimeout("countdown()", 1000);

    });
    $("#btnCancel").click(function () {
        document.getElementById("Label1").value = "0";
    });
</script>--%>
   <%-- <script type="text/javascript">
        function showAlert()
        {
            alert("This alert is called from Code behind");
        }
        function loadJSFunction() {
            debugger;
            alert("Hi Load JS")
        }
        function loadJSFuncParam(param) {
            alert(param)
        }
    </script>--%>
</asp:Content>

