<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DateTimepicker2.aspx.cs" Inherits="DateTimepicker2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Date time</title>
     <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>--%>
    <script src="Datepicker_JS/index.js"></script>
    <link type="text/css" rel="Stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/start/jquery-ui.css" />
    
    <script>
        $(function () {
            Date.prototype.ddmmyyyy = function () {
                var dd = this.getDate().toString();
                var mm = (this.getMonth() + 1).toString();
                var yyyy = this.getFullYear().toString();
                return (dd[1] ? dd : "0" + dd[0]) + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + yyyy;
                //return dt.getFullYear() + "-" + ("0" + (dt.getMonth() + 1)).slice(-2) + "-" + ("0" + dt.getDate()).slice(-2) + "T" + ("0" + dt.getHours()).slice(-2) + ":" + ("0" + dt.getMinutes()).slice(-2);
            };
             
    </script>
    <script>
            $(document).ready(function(){
                 $("#txtdate").datepicker({ dateFormat: "dd-mm-yy", minDate: '', maxDate: '0' }).datepicker("setDate", new Date());
            });
    </script>
    <script>
             $('.datepickerAll').keypress(function (e) {
            try {
                $(id).popover('destroy');
                var chCode = (e.charCode === undefined) ? e.keyCode : e.charCode;
                var id = ('#' + this.id);
                if (chCode > 31 && (chCode < 48 || chCode > 57)) {
                    PopOverError(id, 'top', 'Enter Valid Key For Date.');
                    return false; //Non Numeric Value Return Directly;
                }
                else {
                    if ($(id).val() === undefined) {
                        event.preventDefault();
                        return;
                    }
                    if (e.key == "/") {
                        PopOverError(id, 'top', 'This Key Is Invalid!');
                        event.preventDefault();
                        return false;
                    }
                    if (e.keyCode != 8) {

                        var DateVal = $(id).val();
                        if (e.keyCode == 191) {
                            var corr = DateVal.slice(0, DateVal.lastIndexOf("/"));
                            PopOverError(id, 'top', 'Enter Valid Date!');
                            $(id).val(corr);
                            event.preventDefault();
                            return false;
                        }

                        if ($(id).val().length == 2) {
                            if ($(id).val() < 1 || $(id).val() > 31) {
                                $(id).val("")
                                PopOverError(id, 'top', 'Enter Valid Day!');
                                event.preventDefault();
                                return false;
                            }
                            $(id).val($(id).val() + "/");
                        } else if ($(id).val().length == 5) {
                            var month = $(id).val().substring(3, 6);
                            if (month < 1 || month > 12) {
                                var corr = $(id).val().replace("/" + month, "");
                                $(id).val(corr);
                                PopOverError(id, 'top', 'Enter Valid Month!');
                                event.preventDefault();
                                return false;
                            }
                            $(id).val($(id).val() + "/");
                        } else if ($(id).val().length == 10) {
                            var Inputyear = $(id).val().substring(6, 11);
                            var NowYear = new Date().getUTCFullYear();
                            if (Inputyear < 1900 || Inputyear > NowYear) {
                                var corr = $(id).val().replace(Inputyear, "");
                                $(id).val(corr);
                                PopOverError(id, 'top', 'Enter Valid Year!');
                                event.preventDefault();
                                return false;
                            }
                        }
                        else { $(id).popover('destroy'); }
                    }
                }
            } catch (e) { }
        });
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtdate" CssClass="datepicker" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox1" CssClass="datepickerAll" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="amount">Date</label>
            <input type="text" id="date" />
            <input type="text" id="datenew" />
            <small>Enter date as  Day / Month / Year</small>
        </div>
        <div id="result"></div>
    </form>
    <script>
            var date1 = document.getElementById('date');
            var date2 = document.getElementById('datenew');
            //console.log(date);
            blurtext(date1);
            inputtext(date1);
            blurtext(date2);
            inputtext(date2);
            function checkValue(str, max) {
                if (str.charAt(0) !== '0' || str == '00') {
                    var num = parseInt(str);
                    if (isNaN(num) || num <= 0 || num > max) num = 1;
                    str = num > parseInt(max.toString().charAt(0)) && num.toString().length == 1 ? '0' + num : num.toString();
                };
                return str;
            };

            function inputtext(date) {
               date.addEventListener('input', function (e) {
                this.type = 'text';
                var input = this.value;
                if (/\D\/$/.test(input)) input = input.substr(0, input.length - 3);
                var values = input.split('/').map(function (v) {
                    return v.replace(/\D/g, '')
                });
                if (values[0]) values[0] = checkValue(values[0], 31);
                if (values[1]) values[1] = checkValue(values[1], 12);
                //if (values[0]) values[0] = checkValue(values[0], 12);  mm/dd/yyy
                //if (values[1]) values[1] = checkValue(values[1], 31);
                var output = values.map(function (v, i) {
                    return v.length == 2 && i < 2 ? v + ' / ' : v;
                });
                this.value = output.join('').substr(0, 14);
            });
            }
            function blurtext(date) {
                date.addEventListener('blur', function (e) {
                this.type = 'text';
                var input = this.value;
                var values = input.split('/').map(function (v, i) {
                    return v.replace(/\D/g, '')
                });
                var output = '';

                if (values.length == 3) {
                    var year = values[2].length !== 4 ? parseInt(values[2]) + 2000 : parseInt(values[2]);
                    var month = parseInt(values[0]) - 1;
                    var day = parseInt(values[1]);
                    var d = new Date(year, month, day);
                    if (!isNaN(d)) {
                        document.getElementById('result').innerText = d.toString();
                        var dates = [d.getMonth() + 1, d.getDate(), d.getFullYear()];
                        output = dates.map(function (v) {
                            v = v.toString();
                            return v.length == 1 ? '0' + v : v;
                        }).join(' / ');
                    };
                };
                this.value = output;
            });
            }
            

           
    </script>
</body>
</html>
