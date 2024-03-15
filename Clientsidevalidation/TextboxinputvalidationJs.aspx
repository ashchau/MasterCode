<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="TextboxinputvalidationJs.aspx.cs" Inherits="Clientsidevalidation_TextboxinputvalidationJs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
          function validatetexbox(evt) {
            myflag = true;
            var vid = document.getElementById(evt.id);
                if(vid.value == "") {
                    vid.style.borderColor = "red";
                    myflag = false;
                }
                else {
                    vid.style.borderColor = "green";
                    myflag = true;
            }
            return myflag;
        }
    </script>
    <script>
        //https://developer.mozilla.org/en-US/docs/Web/API/Element/keydown_event
        //$(document).ready(function () {
        //   const input = document.querySelector("input");
        //    const log = document.getElementById("log");

        //    input.addEventListener("keydown", logKey);

        //function logKey() {
        //    alert('Hi');
        //        log.textContent += ` ${e.code}`;
        //    }
        //});
         
    </script>
    <script>
        function trimNamefunc(evt) {  //use this function dynamically to strim white spac from starting point
            var txtid = evt.id;
            var name = document.getElementById(txtid).value;
            document.getElementById(txtid).value = name.trimStart();
            return true;
        }
        function trimName(evt) {
            var name = document.getElementById('<%= txtname.ClientID%>').value;
            document.getElementById('<%= txtname.ClientID%>').value = name.trimStart();
            return true;
        }
        function alphaOnly(e) {
            var TCode = document.getElementById('<%= txtname.ClientID%>').value;
            //  var regex = new RegExp("^[0-9a-zA-Z \b]+$");
            //vailidation form protec input spacial charactor from stating point and \\
            var regex = new RegExp("^[a-zA-Z,_. '\\\/']*$");
            //var regex = new RegExp("^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$");
            var key = String.fromCharCode(!e.charCode ? e.which : event.charCode);
            if (TCode.length == 0 && e.which == 32) {
                e.preventDefault();
                return false;
            }
            if (regex.test(key)) {
                var CommId = document.getElementById('<%= pnlFailed1.ClientID%>');
                CommId.style.display = "none";
                var lblsuccess = document.getElementById('<%= pnlSuccess.ClientID%>');
                lblsuccess.style.display = "none";
                return true;
            }
            else {
                return false;
            }
            <%--
            var CommId = document.getElementById('<%= pnlFailed1.ClientID%>');
            CommId.style.display = "none";
            var lblsuccess = document.getElementById('<%= pnlSuccess.ClientID%>');
            lblsuccess.style.display = "none";--%>
        }
    </script>
    <script>
        var validNumber = new RegExp(/^\d*\.?\d*$/);
        //validation for input numeric value with . (dot)
        //var lastValid = document.getElementById("<%=txtpf.ClientID%>").value; //Cannot read property 'value' of null [duplicate] below line is solution
        //var lastValid = ((document.getElementById("<%=txtpf.ClientID%>") || {}).value) || "";
        var lastValid = "";
        function validateNumber(elem) {
            if (validNumber.test(elem.value)) {
                lastValid = elem.value;
            }
            else {
                elem.value = lastValid;
            }
        }
        //(?<![\d.])(\d{1,2}|\d{0,2}\.\d{1,2})?(?![\d.])   ^\d{0,1}\d{0,1}\.?\d{0,0}$  ^([1-9]([0-9])(?\.)?|0)(\.[0-9]{1,2})?$
        var validPercentage = new RegExp(/^([1-9.]([0-9.])?|0)(\.[0-9]{1,2})?$/);
        //var lastcharValid = ((document.getElementById("<%=txttds.ClientID%>") || {}).value) || "";
         var lastcharValid = "";
        function validatePerNumber(evt) {
            debugger;
           
            if (validPercentage.test(evt.value)) {
                lastcharValid = evt.value;
            }
            else {
                evt.value = lastcharValid;
            }
        }
    </script>
     <style>
        body{color: #000;overflow-x: hidden;height: 100%;background-image: url("https://i.imgur.com/GMmCQHC.png");background-repeat: no-repeat;background-size: 100% 100%}.card{padding: 30px 40px;margin-top: 60px;margin-bottom: 60px;border: none !important;box-shadow: 0 6px 12px 0 rgba(0,0,0,0.2)}.blue-text{color: #00BCD4}.form-control-label{margin-bottom: 0}input, textarea, button{padding: 8px 15px;border-radius: 5px !important;margin: 5px 0px;box-sizing: border-box;border: 1px solid #ccc;font-size: 18px !important;font-weight: 300}input:focus, textarea:focus{-moz-box-shadow: none !important;-webkit-box-shadow: none !important;box-shadow: none !important;border: 1px solid #00BCD4;outline-width: 0;font-weight: 400}.btn-block{text-transform: uppercase;font-size: 15px !important;font-weight: 400;height: 43px;cursor: pointer}.btn-block:hover{color: #fff !important}button:focus{-moz-box-shadow: none !important;-webkit-box-shadow: none !important;box-shadow: none !important;outline-width: 0}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <label>Name : </label>
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control" onblur="validatetexbox(this)" onkeydown="return trimName(event)" onkeypress="return alphaOnly(event)"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>Address :</label>
                    <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" onblur="validatetexbox(this)" onkeydown="return trimNamefunc(this)"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>City :</label>
                    <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" onblur="validatetexbox(this)" onkeydown="return trimNamefunc(this)"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    demo <asp:TextBox ID="TextBox1" runat="server" onblur="validatetexbox(this)" CssClass="form-control" ></asp:TextBox>
                    <input placeholder="Click here, then press down a key." size="40" />
                    <p id="log"></p>
                </div>
                <div class="col-md-3">
                    <label>Salary :</label>
                    <asp:TextBox ID="txtsalary" runat="server" CssClass="form-control" onkeydown="return trimNamefunc(this)"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>PF % :</label>
                    <asp:TextBox ID="txtpf" runat="server" CssClass="form-control" oninput="validateNumber(this);"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>TDS %:</label>
                    <asp:TextBox ID="txttds" runat="server" CssClass="form-control" oninput="validatePerNumber(this);" ></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="pnlFailed1" runat="server" Text="pnlFailed1"></asp:Label>
                    <asp:Label ID="pnlSuccess" runat="server" Text="pnlSuccess"></asp:Label>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success" />
                </div>
            </div>
            <div class="col-md-12">
                   <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">First name<span class="text-danger"> *</span></label> <input type="text" id="t1" title="Enter number only" name="t1" placeholder="Enter your first name" onblur="validatetexbox(this)"/> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Last name<span class="text-danger"> *</span></label> <input type="text" id="t2" name="t2" placeholder="Enter your last name" onblur="validatetexbox(this)"/> </div>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>

