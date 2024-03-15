<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fileuploadstatus4.aspx.cs" Inherits="Fileuploadbar_Fileuploadstatus4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Show Loading Image while uploading images using updatepanel</title>
<style type="text/css">
.overlay
{
position: fixed;
z-index: 999;
height: 100%;
width: 100%;
top: 0;
background-color: Black;
filter: alpha(opacity=60);
opacity: 0.6;
-moz-opacity: 0.8;
}
</style>
<script type="text/javascript">
function showProgress() {
var updateProgress = $get("<%= UpdateProgress.ClientID %>");
updateProgress.style.display = "block";
}
</script>
</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel runat="server" ID="updatepanel1" UpdateMode="Conditional">
<ContentTemplate>
<div style="align:center; margin-left:350px; margin-top:200px">
<asp:FileUpload ID="uploadfiles1" runat="server" />
<asp:Button ID="btnUpload" Text="Upload" runat="server" onclick="btnUpload_Click" OnClientClick="showProgress()" /><br />
<asp:Label ID="lblMsg" runat="server"/>
</div>
</ContentTemplate>
<Triggers>
<asp:PostBackTrigger ControlID="btnUpload" />
</Triggers>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="updatepanel1">
<ProgressTemplate>
<div class="overlay">
<div style=" z-index: 1000; margin-left: 350px;margin-top:200px;opacity: 1;-moz-opacity: 1;">
<img alt="" src="../Image/loading.gif" />
</div>
</div>
</ProgressTemplate>
</asp:UpdateProgress>
</form>
</body>
</html>

