<%@ Page Title="" Language="C#" MasterPageFile="~/Login/MasterLogin.master" AutoEventWireup="true" CodeFile="Student_Registration.aspx.cs" Inherits="Login_Student_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .float
        {
            float:right;
        }
    </style>
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script type="text/javascript">
    function ShowPopUp() {
        return confirm("Do you want to Logout? ");
        //alert(result);
    }
</script>
    <script>
        // Disable form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Get the forms we want to add validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
  <h2>Student Registration Form</h2>
  <div>
      <%--<asp:Panel ID="Panel1" runat="server" >
      <div> <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Login/logout.jpg" Width="60px" CssClass="float" OnClick="ImageButton1_Click" CausesValidation="false" /></div></asp:Panel>--%>
      <input id="Logout" type="submit" class="btn btn-warning float" value="Logout" onserverclick="ImageButton1_Click" runat="server" formnovalidate onclick="return ShowPopUp();" />
      <asp:Label ID="lblusername" runat="server" Text="Label"></asp:Label></div>
  <%--<form action="/action_page.php" class="needs-validation" novalidate>--%>
 
      <div class="form-group">
      <label for="fsname">Fist Name:</label>
      <input type="text" class="form-control" id="fsname" placeholder="Enter first Name" name="fsname" required runat="server"/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     
    <div class="form-group">
      <label for="lsname">Last Name:</label>
      <input type="text" class="form-control" id="lsname" placeholder="Enter Last Name" name="lsname" runat="server" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="fathername">Father Name:</label>
      <input type="text" class="form-control" id="fathername" placeholder="Enter Father Name" name="fathername" runat="server" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="mobileno">Mobile No:</label>
      <input type="text" class="form-control" id="mobileno" placeholder="Enter Mobile No." name="mobileno" runat="server" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="emailid">Email ID:</label>
      <input type="text" class="form-control" id="emailid" placeholder="Enter Email ID" name="emailid" runat="server" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="Loginid">Student Login ID:</label>
      <input type="text" class="form-control" id="loginid" placeholder="Enter Login ID" name="loginid" runat="server" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="Loginid">Password:</label>
      <input type="password" class="form-control" id="pws" placeholder="Enter Password " name="pws" runat="server" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="Loginid">Entry Date:</label>
      <input type="text" class="form-control" id="entyrdate" placeholder="Enter Entry Date" name="entyrdate" runat="server" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>    
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" runat="server" required/> I am agree.
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this checkbox to continue.</div>
      </label>
    </div>
    <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click" />
        <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
  <%--</form>--%>
</div>
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
</asp:Content>

