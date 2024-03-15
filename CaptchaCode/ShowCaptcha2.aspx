<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowCaptcha2.aspx.cs" Inherits="CaptchaCode_ShowCaptcha2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtVerify"
                ErrorMessage="You have Entered a Wrong Verification Code!Please Re-enter!!!" OnServerValidate="CAPTCHAValidate"></asp:CustomValidator>

            <asp:Image ID="imCaptcha" ImageUrl="/CaptchaCode/Handler_captcha2.ashx" runat="server" />

            <asp:TextBox ID="txtVerify" runat="server"></asp:TextBox>

            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />

        </div>
    </form>
</body>
</html>
