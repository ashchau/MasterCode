<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sessiontimer2.aspx.cs" Inherits="Sessiontimer_sessiontimer2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!--<asp:ModalPopupExtender> </asp:ToolkitScriptManager> TagPrefix="asp" must match with above TagPrefix name u can define any name eg CC1 etc.-->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function SessionExpireAlert(timeout) {
            var seconds = timeout / 1000;
            document.getElementsByName("secondsIdle").innerHTML = seconds;
            document.getElementsByName("seconds").innerHTML = seconds;
            setInterval(function () {
                seconds--;
                document.getElementById("seconds").innerHTML = seconds;
                document.getElementById("secondsIdle").innerHTML = seconds;
            }, 1000);
            setTimeout(function () {
                //Show Popup before 20 seconds of timeout.
                $find("mpeTimeout").show();
            }, timeout - 20 * 1000);
            setTimeout(function () {
                window.location = "Expired.aspx";
            }, timeout);
        };
        function ResetSession() {
            //Redirect to refresh Session.
            window.location = window.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            <h3>Session Idle:&nbsp;<span id="secondsIdle"></span>&nbsp;seconds.</h3>
            <asp:LinkButton ID="lnkFake" runat="server" />
            <asp:ModalPopupExtender ID="mpeTimeout" BehaviorID="mpeTimeout" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkFake"
                OkControlID="btnYes" CancelControlID="btnNo" BackgroundCssClass="modalBackground" OnOkScript="ResetSession()">
            </asp:ModalPopupExtender>
            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                <div class="header">
                    Session Expiring!
                </div>
                <div class="body">
                    Your Session will expire in&nbsp;<span id="seconds"></span>&nbsp;seconds.<br />
                    Do you want to reset?
                </div>
                <div class="footer" align="right">
                    <asp:Button ID="btnYes" runat="server" Text="Yes" CssClass="yes" />
                    <asp:Button ID="btnNo" runat="server" Text="No" CssClass="no" />
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
