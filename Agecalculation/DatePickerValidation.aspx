<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DatePickerValidation.aspx.cs" Inherits="Agecalculation_DatePickerValidation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'rel='stylesheet' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"> </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script>
		<script>
			$(document).ready(function() {

				$(function() {
					$("#my_date_picker1").datepicker({});
				});

				$(function() {
					$("#my_date_picker2").datepicker({});
				});

				$('#my_date_picker1').change(function() {
					startDate = $(this).datepicker('getDate');
					$("#my_date_picker2").datepicker("option", "minDate", startDate);
				})

				$('#my_date_picker2').change(function() {
					endDate = $(this).datepicker('getDate');
					$("#my_date_picker1").datepicker("option", "maxDate", endDate);
				})
			})
		</script>
    <style>
		.ui-datepicker {
			width: 12em;
		}
		h1{
			color:green;
		}
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>GeeksforGeeks birthday date should not be greater than today date validation in javascript</h1>
            Start Date:
		<input type="text" id="my_date_picker1" runat="server" />
            End Date:
		<input type="text" id="my_date_picker2" />
        </div>
    </form>
</body>
</html>
