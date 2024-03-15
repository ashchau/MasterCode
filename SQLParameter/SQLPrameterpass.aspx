<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SQLPrameterpass.aspx.cs" Inherits="SQLParameter_SQLPrameterpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SQL Parameter</title>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script>
          function DisableButton() {
                var input = document.getElementById("btnsubmit");               
                if (input.type == "submit") {
                    input.disabled = true;                   
                }
          }
          window.onbeforeunload = DisableButton;
    </script>
   

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:DropDownList ID="ddlbindname" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlbindname_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
            </div>
            <div>
                <input type="text" id="tbName" />
                <input type="submit" id="submit" disabled="disabled" />
            </div>
            <div>
                 <input class="input" type="text" placeholder="fill me"/>
                <button class="button">Click Me</button>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
             All Employee :-    <asp:GridView ID="GridView2" runat="server"></asp:GridView>
            </div>
        </div>
        <div>
             <div class="card-body bg-primary">
                            <div class="col-md-4">
                               Name: <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>                         
                            <div class="col-md-4">         
                              Salary:  <asp:TextBox ID="txtsalary" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>                         
                            <div class="col-md-4">         
                              Mobile No. :  <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                 <div>
                     <asp:Button ID="btnsave" runat="server" Text="SQL Out Parameter" OnClick="btnsave_Click" /></div>
               </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $('#tbName').on('input change', function () {
                if ($(this).val() != '') {
                    $('#submit').prop('disabled', false);
                } else {
                    $('#submit').prop('disabled', true);
                }
            });
        });
    </script>
    <script>
        let input = document.querySelector(".input");
        let button = document.querySelector(".button");
        button.disabled = true;
        input.addEventListener("change", stateHandle);

        function stateHandle() {
            if (document.querySelector(".input").value === "") {
                button.disabled = true;
            } else {
                button.disabled = false;
            }
        }
    </script>
</body>
</html>
