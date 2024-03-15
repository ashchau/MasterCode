<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DateTimePicker3.aspx.cs" Inherits="DateTimePicker3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <link type="text/css" rel="Stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css" />
    <script>
         function convertDate(date) {
            var d = new Date(date.split("/").reverse().join("-"));
            var dd = d.getDate();
            var mm = d.getMonth() + 1;
            var yy = d.getFullYear();
            var DateAftConv = mm + "/" + dd + "/" + yy;
            return DateAftConv;
        }
        $(document).ready(function () {
            debugger;
            $("#txtfrom").datepicker({ dateFormat: 'dd/mm/yy', minDate: '', maxDate: '0', changeMonth: true, changeYear: true, autoClose: true });
            var a = $('#txtfrom').val();
            $("#txtto").datepicker({ dateFormat: 'dd/mm/yy', minDate: '0', maxDate: '', changeMonth: true, changeYear: true, autoClose: true });

            $("#txtfrom").on('change', function () {
              
                //var setDate = $(this).val();
                //var todayDate = new Date().ddmmyyyy();
                //if (setDate > todayDate) {
                //    $("#txtfrom").focus();
                //    alert('Selected date must be Less than or Equal to today date');
                //    $(this).val('');
                //}
                if ($('#txtto').val() != '') {

                    var FDate = convertDate($('#txtfrom').val());
                    var FromDate = Date.parse(FDate);

                    var TDate = convertDate($('#txtto').val());
                    var ToDates = Date.parse(TDate);

                    //var today = new Date();
                    //var val = (today.getMonth() + 1) + "/" + today.getDate() + "/" + today.getFullYear();
                    //var todate = Date.parse(val);
                     //if (FDate > TDate) {
                    if (FDate > TDate) {
                        $("#lblMessage2").css("display", "inline-block");
                        $("#lblMessage2").addClass("alert alert-danger");
                        $("#lblMessage2").html("From Date Can Not Be Greater Than To Date");
                        $('#txtfrom').val('');
                        return false;
                    }
                    else {
                        $("#lblMessage2").css("display", "None");
                        $("#lblMessage2").html("");
                    }


                    if (FromDate >= ToDates) {
                        $("#lblMessage2").css("display", "inline-block");
                        $("#lblMessage2").addClass("alert alert-danger");
                        $("#lblMessage2").html("From Date Can Not Be Equal To Date");
                        $('#txtfrom').val('');
                        return false;
                    }
                    else {
                        $("#lblMessage2").css("display", "None");
                        $("#lblMessage2").html("");
                    }
                }
            });


            $("#txtto").on('change', function () {
                debugger;
                if ($('#txtfrom').val() == '') {
                    $("#lblMessage2").css("display", "inline-block");
                    $("#lblMessage2").addClass("alert alert-danger");
                    $("#lblMessage2").html("Select From Date First");
                    $('#txtto').val('');
                    return false;
                }

                if ($('#txtfrom').val() != '') {

                    var AllotmentDate = convertDate($('#txtfrom').val());
                    var allotmentDate = Date.parse(AllotmentDate);

                    var PossessionDate = convertDate($('#txtto').val());
                    var possessionDate = Date.parse(PossessionDate);

                    if (allotmentDate >= possessionDate) {
                        $("#lblMessage2").css("display", "inline-block");
                        $("#lblMessage2").addClass("alert alert-danger");
                        $("#lblMessage2").html("To Date Can Not Be Less Than or Equal to  From Date");
                        $('#txtto').val('');
                        return false;
                    }
                    else {
                        $("#lblMessage2").css("display", "None");
                        $("#lblMessage2").html("");
                    }
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
         <div>
            From Date :<asp:TextBox ID="txtfrom" runat="server"></asp:TextBox>
            To Date :<asp:TextBox ID="txtto" runat="server"></asp:TextBox>
             <asp:Label ID="lblMessage2" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
