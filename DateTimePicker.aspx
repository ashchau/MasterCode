<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DateTimePicker.aspx.cs" Inherits="DateTimePicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 8pt;
        }
    </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <link type="text/css" rel="Stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css" />
    <script type="text/javascript">
        $(function () {
            Date.prototype.ddmmyyyy = function () {
                var dd = this.getDate().toString();
                var mm = (this.getMonth() + 1).toString();
                var yyyy = this.getFullYear().toString();
                //return (dd[1] ? dd : "0" + dd[0]) + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + yyyy;
                return  dt.getFullYear() + "-" + ("0" + (dt.getMonth() + 1)).slice(-2) + "-" + ("0" + dt.getDate()).slice(-2) + "T" + ("0" + dt.getHours()).slice(-2) + ":" + ("0" + dt.getMinutes()).slice(-2);
            };
            //https://www.aspsnippets.com/questions/101309/jQuery-DatePicker-validation-Selected-Date-should-be-greater-than-Current-date/
            //https://api.jquery.com/focus/
            $("#datepicker").datepicker({ dateFormat: "dd-mm-yy", minDate: '', maxDate: '0' }).datepicker("setDate", new Date());
            $("#datepicker").on('change', function () {
                var selectedDate = $(this).val();
                var todaysDate = new Date().ddmmyyyy();
                if (selectedDate > todaysDate) {
                    $("#datepicker").focus();
                    alert('Selected date must be greater than today date');
                    $(this).val('');
                }
            });
        });
        //https://www.aspsnippets.com/questions/150150/Validate-date-string-in-ddMMyyyy-format-using-jQuery-maskinput-plugin-ASPNet/
        function Validate() {
            var date = document.getElementById("datepicker").value.split("/");
            var day = date[0];
            var month = date[1];
            var dateString = document.getElementById("datepicker").value;
            var regex = /^(0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])[\/\-]\d{4}$/;
            if (regex.test(dateString) || dateString.length == 0) {
                alert("Please enter correct date");

            }
            if (day > 31) {
                alert("Please enter correct date");
            }
            else
                if (month > 12) {
                    alert("Please enter correct date");
                }
        }
    </script>
    <script>
        function convertDate(date) {
            var d = new Date(date.split("/").reverse().join("-"));
            var dd = d.getDate();
            var mm = d.getMonth() + 1;
            var yy = d.getFullYear();
            var DateAftConv = mm + "/" + dd + "/" + yy;
            return DateAftConv;
        }
        //this script add by ashok 
        $(document).ready(function () {

            //$('#txtPossessionDate').datepicker({ dateFormat: 'dd/mm/yy', autoclose: true }).datepicker("setDate", new Date());
            //$("#txtAllotmentDate").datepicker({ dateFormat: 'dd/mm/yy', minDate: '01/01/1947', maxDate: '0', changeMonth: true, changeYear: true, autoClose: true }).datepicker("setDate", new Date());
            $("#txtPossessionDate").datepicker({ dateFormat: 'dd/mm/yy', minDate: '', maxDate: '0', changeMonth: true, changeYear: true, autoClose: true });
            var a = $('#txtPossessionDate').val();
            $("#txtAllotmentDate").datepicker({ dateFormat: 'dd/mm/yy', minDate: a, maxDate: '', changeMonth: true, changeYear: true, autoClose: true }).datepicker("setDate", new Date());

            $("#txtAllotmentDate").on('change', function () {
                debugger;
                if ($('#txtAllotmentDate').val() != '') {

                    var AllotmentDate = convertDate($('#txtAllotmentDate').val());
                    var allotmentDate = Date.parse(AllotmentDate);

                    var PossessionDate = convertDate($('#txtPossessionDate').val());
                    var possessionDate = Date.parse(PossessionDate);

                    var today = new Date();
                    var val = (today.getMonth() + 1) + "/" + today.getDate() + "/" + today.getFullYear();
                    var todate = Date.parse(val);

                    if (allotmentDate > todate) {
                        $("#lblMessage2").css("display", "inline-block");
                        $("#lblMessage2").addClass("alert alert-danger");
                        $("#lblMessage2").html("Allotment Date Can Not Be Greater Than Current Date");
                        //$("#txtAllotmentDate").focus();
                        $('#txtAllotmentDate').val('');
                        return false;
                    }
                    else {
                        $("#lblMessage2").css("display", "None");
                        $("#lblMessage2").html("");
                    }


                    if (allotmentDate > possessionDate) {
                        $("#lblMessage2").css("display", "inline-block");
                        $("#lblMessage2").addClass("alert alert-danger");
                        $("#lblMessage2").html("Possession Date Can Not Be Less Than Allotment Date");
                        //$("#txtPossessionDate").focus();
                        $('#txtPossessionDate').val('');
                        return false;
                    }
                    else {
                        $("#lblMessage2").css("display", "None");
                        $("#lblMessage2").html("");
                    }
                }
            });


            $("#txtPossessionDate").on('change', function () {
                if ($('#txtAllotmentDate').val() == '') {
                    $("#lblMessage2").css("display", "inline-block");
                    $("#lblMessage2").addClass("alert alert-danger");
                    $("#lblMessage2").html("Select Allotment Date First");
                    //$("#txtAllotmentDate").focus();
                    $('#txtPossessionDate').val('');
                    return false;
                }

                if ($('#txtAllotmentDate').val() != '') {

                    var AllotmentDate = convertDate($('#txtAllotmentDate').val());
                    var allotmentDate = Date.parse(AllotmentDate);

                    var PossessionDate = convertDate($('#txtPossessionDate').val());
                    var possessionDate = Date.parse(PossessionDate);

                    if (allotmentDate >= possessionDate) {
                        $("#lblMessage2").css("display", "inline-block");
                        $("#lblMessage2").addClass("alert alert-danger");
                        $("#lblMessage2").html("Possession Date Can Not Be Less Than or Equal to  Allotment Date");
                        //$("#txtPossessionDate").focus();
                        $('#txtPossessionDate').val('');
                        return false;
                    }
                    else {
                        $("#lblMessage2").css("display", "None");
                        $("#lblMessage2").html("");
                    }
                }
            });

            $('#txtJointName1').keypress(function (e) {
                var id = ('#' + this.id);
                fnNameValidation(e, id);
            });

            $('#txtJointName2').keypress(function (e) {
                var id = ('#' + this.id);
                fnNameValidation(e, id);
            });
        });
    </script>
    
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            From Date:
            <input type="text" id="datepicker" runat="server" onblur="Javascript:Validate(); return false;" />
        </div>
        <div>
            <%-- <input id="txtAllotmentDate" runat="server" />--%>
            Allotment Date :<asp:TextBox ID="txtAllotmentDate" runat="server"></asp:TextBox>
            Possession Date :
            <asp:TextBox ID="txtPossessionDate" runat="server"></asp:TextBox>
            <asp:Label ID="lblMessage2" runat="server"></asp:Label>
        </div>
        
    </form>
</body>
</html>
