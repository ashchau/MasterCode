<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myprofile.aspx.cs" Inherits="Clientsidevalidation_myprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title></title>  
    <script>  
        function OnlyNumbers(evt) {  
            var charCode = (evt.which) ? evt.which : evt.keyCode;  
            if (charCode != 46 && charCode > 31  
              && (charCode < 48 || charCode > 57))  
                return false;  
            return true;  
        }  
        function checkEmail(event) {  
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;  
            if (!re.test(event.value)) {  
                alert("Please enter a valid email address");  
                return false;  
            }  
            return true;  
        }  
  
        function chkvalidation(event)  
        {  
            var exitval = false;  
            var rsltcount = 0;  
            var msgtext = "";  
  
            //Age Validation  
            var ageval = document.getElementById("<%= txtAge.ClientID %>").value;  
            var agerslt = false;  
            if (ageval.length > 0)  
            {  
                agerslt = OnlyNumbers(document.getElementById("<%= txtAge.ClientID %>"));  
                if (agerslt == false)  
                {  
                    msgtext = "Invalid age entered.";  
                    rsltcount = 1  
                }  
                else  
                {  
                    if (ageval > 100) {  
                        msgtext = msgtext + "\n Check your entered age.";  
                        rsltcount += 1  
                    }  
                }  
            }  
            else  
            {  
                msgtext =  msgtext + "\n Invalid age or age required.";  
                rsltcount += 1  
            }  
              
            //Mobile Validation  
            var mobileval = document.getElementById("<%= txtMobile.ClientID %>").value;  
            var mobilerslt = false;  
            if (mobileval.length != 10) {  
                msgtext = msgtext + "\n Invalid mobile number or mobile number required";  
                rsltcount += 1  
            }  
            else {  
                mobilerslt = OnlyNumbers(document.getElementById("<%= txtMobile.ClientID %>"));  
                if (mobilerslt == false) {  
                    msgtext = msgtext + "\n Invalid mobile number or mobile number required.";  
                    rsltcount += 1  
                }  
            }  
  
            //Email Validation  
            var emailidval = document.getElementById("<%= txtEmailID.ClientID %>").value;  
            var emailidrslt = false;  
           if (emailidval.length > 1) {  
                    emailidrslt = checkEmail(document.getElementById("<%= txtEmailID.ClientID %>"));  
                if (emailidrslt == false) {  
                    msgtext = msgtext + "\n Invalid email id entered.";  
                    rsltcount += 1  
                }  
            }  
            else {  
               msgtext = msgtext + "\n Email id required.";  
               rsltcount += 1  
            }  
  
            if (rsltcount > 0)
            {
                
                exitval = false;
                alert(msgtext); 
            }  
            else  
            {   
                exitval = true;
                //confirm("Do you want to save...");
                //var userPreference;

                //if (confirm("Do you want to save changes?") == true) {
                //    userPreference = "Data saved successfully!";
                //} else {
                //    userPreference = "Save Cancelled!";
                //}
            }
           // alert(msgtext);  
            return exitval;  
        } 
        //my code
        function validationage() {
            
            //var exitval = false;  
            var rsltcount1 = 0;
            var msg = "";
            var error = document.getElementById("error");
            //Age Validation  
            var ageval = document.getElementById("<%= txtAge.ClientID %>").value;
            var agerslt = false;
            if (ageval.length > 0) {
                agerslt = OnlyNumbers(document.getElementById("<%= txtAge.ClientID %>"));
                if (agerslt == false) {
                    msg = "Invalid age entered.";
                    rsltcount1 = 1
                    alert(msg);
                }
                else {
                    //debugger;
                    if (ageval > 100) {
                        msg = msg + "\n Check your entered age.";
                        rsltcount1 += 1
                        //var error = document.getElementById("error");
                        error.textContent = msg;
                        error.style.color = "Red";
                        //setFocus();
                        //alert(msg);
                        document.getElementById("txtAge").focus();

                    } 
                    else {
                        //debugger;
                        error.textContent = " ";
                    }
                }
            }
            else {
                msg = msg + "\n Invalid age or age required.";
                rsltcount1 += 1
                alert(msg);
            }
             
        }
        // validate mobile number 
        function validationmobile() {
            var msgn = "";
            var error = document.getElementById("error");
            var mobileval = document.getElementById("<%= txtMobile.ClientID %>").value;
           // var mobilerslt = false;
            if (mobileval.length != 10) {
                //debugger;
                msgn = msgn + "\n Invalid mobile number";
                //rsltcount += 1  ;
                error.textContent = msgn;
                error.style.color = "Red";
               
                document.getElementById("txtMobile").focus();
            }
            else {
                error.textContent = " ";
                
            }
        }
        //set focus functin
        function setFocus() {
            document.getElementById("txtAge").focus();
        }

        function removeFocus() {
            document.getElementById("focus").blur();
        }
    </script>  
  <style>
      .txtdisable{
          background-color: #eee;
          opacity: 1;
          cursor:no-drop;
      }
  </style>
</head>  
<body>  
    <form id="form1" runat="server">  
        <div>  
            <table>  
                <tr>  
                    <td>Name  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td>Age  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtAge" runat="server" onkeypress="return OnlyNumbers(event)" MaxLength="3" onblur="validationage()" ></asp:TextBox> 
                         <span id="error"></span>
                    </td>  
                </tr>  
                <tr>  
                    <td>Mobile  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" onkeypress="return OnlyNumbers(event)" onblur="validationmobile()" ></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td>Email ID  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtEmailID" runat="server" placeholder="yourname@server.com" onblur="checkEmail(this)"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td rowspan="1">  
                        <asp:Button ID="btnSubmit" Text="Submit" runat="server"  OnClick="btnSubmit_Click" OnClientClick="return chkvalidation()" />  
                          
                    </td>  
                </tr>  
            </table>  
            <asp:Label ID="lblResultMessage" runat="server" Text=""></asp:Label>
        </div> 
        <div>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true" Text="120" CssClass="txtdisable"></asp:TextBox>
            <asp:Button ID="btntest" runat="server" Text="Get Value" OnClick="btntest_Click" />
        </div>
    </form>  
</body>  
</html>
