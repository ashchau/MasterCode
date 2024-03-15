﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="Popuplogin.aspx.cs" Inherits="Popuplogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
    <script>
        function openForm() {
            document.getElementById("myForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("myForm").style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="form-container">
        <div>
            User Name :
            <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
            Password :
            <asp:TextBox ID="txtpsw" runat="server"></asp:TextBox>
            <asp:Button ID="btnsignin" runat="server" Text="Login" CssClass="btn" OnClick="btnsignin_Click" />
          
        </div>

    </div>
    <button class="open-button" onclick="openForm()">Open Form</button>
    <div class="form-popup" id="myForm">
        <form class="form-container">
            <div class="form-container">

                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" required runat="server" id="txt_email" />
                 <%--<asp:TextBox ID="txtname" runat="server"></asp:TextBox>--%>
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" required runat="server" id="txt_psw" />
                <%--<asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>--%>
                  <asp:Button ID="btnlogin" runat="server" Text="Login1" OnClick="btnlogin_Click" CssClass="btn" />
                <button type="submit" class="btn" onserverclick="btnlogin_Click" runat="server">Login</button>
                
                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>

            </div>
        </form>
    </div>
</asp:Content>

