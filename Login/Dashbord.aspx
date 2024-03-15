<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="Dashbord.aspx.cs" Inherits="Login_Dashbord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%-- <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <script type="text/javascript">
        function googleTranslateElementInit() {
            setCookie('googtrans', '/en/hi', 1);
            new google.translate.TranslateElement({ pageLanguage: 'ES', layout: google.translate.TranslateElement.InlineLayout.SIMPLE }, 'google_translate_element');
        }
        function setCookie(key, value, expiry) {
            var expires = new Date();
            expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
            document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
        }
    </script>--%>
    <style>
        .float
        {
            float:right;
        }
    </style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    function ShowPopUp() {
        return confirm("Do you want to Logout? ");
        //alert(result);
    }
</script>
    <%-- Script for show time formate --%>
    <script>

        setInterval(displayTime, 1000);
        function displayTime() {
            var dt = new Date();
            var ap = "AM"
            var dd = ((dt.getDate().toString().length) == 1) ? '0' + (dt.getDate()) : (dt.getDate());
            var MM = ((dt.getMonth().toString().length) == 1) ? '0' + (dt.getMonth() + 1) : (dt.getMonth() + 1);
            var YYYY = dt.getFullYear();
            var hh = dt.getHours();
            var ss = ((dt.getSeconds().toString().length) == 1) ? '0' + (dt.getSeconds()) : (dt.getSeconds());
            var mm = ((dt.getMinutes().toString().length) == 1) ? '0' + (dt.getMinutes()) : (dt.getMinutes());

            if (hh >= 12) {
                ap = "PM";
            }
            if (hh > 12) {
                hh = hh - 12;
            }
            var HH = ((hh.toString().length) == 1) ? '0' + (hh) : (hh);
            var datetime = dd + "-" + MM + "-" + YYYY + "&nbsp;&nbsp;&nbsp;&nbsp;" + HH + ":" + mm + ":" + ss + " " + ap;
            document.getElementById("timers").innerHTML = datetime;
        }

        function Clear() {

            $("#txtCurrentPassword").val('');
            $("#txtNewpassword").val('');
            $("#txtReEntryPassword").val('');

        }
        function ClearField() {

            $("#TxtMobile").val('');
            $("#TxtNewPWD").val('');
            $("#TxtReNewPWD").val('');

        }

        function openModal() {
            alert("Kye problem hai....");
            $('[id*=changePassword]').modal('show');
        }

        function HidePop() {
            alert("Kye problem hai....");
            $('[id*=changePassword]').modal('hide');
        }

        //backdrop remove

        function backdropremove() {
         
            $('.modal').remove();
            $('.modal-backdrop').remove();
            $('body').removeClass("modal-open");
        }
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
      <div> <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Login/logout.jpg" Width="60px" CssClass="float" OnClick="ImageButton1_Click" CausesValidation="false" OnClientClick="return ShowPopUp();" /></div>
    <div>
        <h3> <asp:Label ID="lblusername" runat="server" Text="Label"></asp:Label></h3>
        <label id="timers"></label>
        <%--<div id="google_translate_element"></div>--%>
    </div>
    <div class="container">
  <h2>Student Login Form</h2>
  
    <div class="form-group">
      <label for="loginid">Email:</label>
      <%--<input type="text" class="form-control" runat="server" id="loginid" placeholder="Enter Login ID" name="loginid" required />--%>
        <asp:TextBox ID="loginid" runat="server" CssClass="form-control" placeholder="Enter Login ID" ></asp:TextBox>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
     <%-- <input type="password" class="form-control" runat="server" id="pwd1" placeholder="Enter password" name="pwd" required />--%>
        <asp:TextBox ID="pwd" runat="server" CssClass="form-control" TextMode="Password"  placeholder="Enter password"></asp:TextBox>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember" id="chkremember" runat="server" /> Remember me</label>
    </div>
       <asp:Button ID="btnloin" runat="server" CssClass="btn btn-success" Text="Login" OnClick="btnloin_Click" />
       <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-warning" OnClick="btnclear_Click" CausesValidation="false" />
       <asp:Label ID="lblmsg" runat="server" Text="Label" Visible="false"></asp:Label>
</div>
</asp:Content>

