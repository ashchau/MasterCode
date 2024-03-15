<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="CheckVowels.aspx.cs" Inherits="Stringprog_CheckVowels" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            debugger;
           //$("#OnloadMOdal").modal('show');
            //$("#ContentPlaceHolder1_btnVCCount").click(function() {
               $("#OnloadMOdal").modal('show');
            //});
        });

        //function showDialog() {
        //     $("#OnloadMOdal").modal('show');
        //}
       
    </script>
    <style>
         /*Modal onload page Style*/
        .modal-header {
            background: #931b2f;
            text-align: center;
        }

        .modal-title {
            color: #ffffff;
            font-weight: 600;
            text-align: center;
        }

        .modal-header .close {
            margin-top: -2px;
            color: #ffffff;
            opacity: 1;
            font-size: 30px;
            transform: rotate(0deg);
            -webkit-transition: .15s linear;
            -o-transition: .15s linear;
            transition: .15s linear;
        }

            .modal-header .close:hover {
                transform: rotate(90deg);
                -webkit-transition: .15s linear;
                -o-transition: .15s linear;
                transition: .15s linear;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel runat="server" ID="uppnl">
        <ContentTemplate>
            <asp:ScriptManager runat="server"  ID="srpt"></asp:ScriptManager>
            <!-- Modal onload page Start --->
        <div class="modal fade" id="OnloadMOdal" tabindex="-1" role="dialog" aria-labelledby="OnloadMOdal" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">मेरा शहर मेरी पहचान</h4>
                    </div>
                    <div class="modal-body">
                        <img src="../images/Ashok.png" class="img-responsive" alt="मेरा शहर मेरी पहचान" />
                    </div>
                </div>
            </div>
        </div>
         <!-- Modal onload page End --->
    <div>
        String name :<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label ID="lblvowels" runat="server"></asp:Label>
        <asp:Button ID="btnvowel" runat="server" Text="GET Vowels Letters" OnClick="btnvowel_Click" />
    </div>
    <div>
        String name 2 :<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label ID="lblvowelcount" runat="server"></asp:Label>
        <asp:Label ID="lblconsonantcount" runat="server"></asp:Label>
        <asp:Button ID="btnVCCount" runat="server" Text="GET Vowels Letters" OnClick="btnVCCount_Click" /> <%-- OnClientClick="showDialog();"--%>
        <%--OnClientClick="showDialog();" this is used for show popup on button click event--%>
    </div>
    <div>
        <asp:DropDownList ID="ddlname" runat="server"></asp:DropDownList>
        <asp:DropDownList ID="ddlid" runat="server"></asp:DropDownList>
    </div>
        </ContentTemplate>
        <Triggers>
            <%--<asp:PostBackTrigger ControlID="btnVCCount"/>--%> <%--if want to forcefully show popup of page load and any button click--%>
        </Triggers>
    </asp:UpdatePanel>
     
</asp:Content>

