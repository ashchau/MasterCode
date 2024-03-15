<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChosenMultipleselect.aspx.cs" Inherits="Searchbox_ChosenMultipleselect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chosen Multi select</title>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.min.css" />--%>
    <script src="../Scripts/jquery-3.5.1.js"></script>
    <script src="../Scripts/Chosen_script/chosen.jquery.js"></script>
    <link href="../Scripts/Chosen_script/chosen.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('#diagnosis').chosen({
                max_selected_options: 5
            });
             $('#mlist').chosen({
                max_selected_options: 2
            });
        });

        $(document).ready(function () {
            $('#reselVal').click(function () {
                setTimeout(function () {
                    resetFilterValues()
                }, 10);
            })
        });

        function resetFilterValues() {
            $("#diagnosis").val([]).trigger('chosen:updated');
            $("#mlist").val([]).trigger('chosen:updated');
        }


        $("#diagnosis").change(function () {
            //alert("Inside selection Jquery");
            var selected = $('#diagnosis').val();
            //alert(selected);
            document.getElementById("DiagnosisResults").innerHTML = selected;
        });

        $(document).ready(function () {
            $('#submit').click(function () {
                var selected = $('#diagnosis').val();
                alert(selected);
            })
        });


        //Save Value in Hidden
        function displayDiagnosis() {
            var test = document.getElementById("Myobjecttype").innerHTML;

            var selected = $('#diagnosis').val();
            if (test == "") {
                test += selected;
            }
            else {
                test += " (and) ";
                test += selected;
            }

            document.getElementById("Myobjecttype").innerHTML = test;
        }

        function displayDiagnosisValue() {
            var e = document.getElementById("diagnosis");
            var result = e.options[e.selectedIndex].text;
            document.getElementById("Myobjecttype").innerHTML = result;
        }
    </script>
    <style>
        select {
             width: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--https://codepen.io/ruchinarayan/pen/YzNrEJW--%>
            <select id="diagnosis" multiple="multiple">
                <option value="">-- Select --</option>
                <option value="Hypertension1">Hypertension</option>
                <option value="Hyperlipidemia1">Hyperlipidemia</option>
                <option value="Diabetes1">Diabetes</option>
                <option value="Back1">Back pain</option>
                <option value="Anxiety1">Anxiety</option>
                <option value="Allergic1">Allergic rhinitis</option>
                <option value="Reflux1">Reflux esophagitis</option>
            </select>
        </div>
        <div>
            <select  multiple="multiple" id="mlist">
                <option value="Engineering">Engineering</option>
                <option value="Carpentry">Carpentry</option>
                <option value="Plumbing">Plumbing</option>
                <option value="Electical">Electrical</option>
                <option value="Mechanical">Mechanical</option>
                <option value="HVAC">HVAC</option>
            </select>
        </div>
        <div>
            <button id="submit">Display Selected Values</button>
            <input type="button" id="reselVal" onclick="displayDiagnosis()" value="Add Key"/>

            <input type="button" id="reselVal1" onclick="displayDiagnosisValue()" value="Add Value"/>
            <br/>
            <b>Display Diagnosis selection below:</b>

            <div id="DiagnosisResults">
            </div>

            <textarea id="Myobjecttype" name="w3review" rows="4" cols="50"></textarea>

        </div>
    </form>
</body>
</html>
