<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TypeTable.aspx.cs" Inherits="CRUD_TypeTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/jquery-3.5.1.js"></script>
    <script>
        var mins = 120;
        var secs = mins * 60;
        var currentSeconds = 0;
        var currentMinutes = 0;
        var ourtime;
        function StartCountDown() {
            ourtime = setTimeout(Decrement, 1000);
        }
        function EndContDown() {
            clearTimeout(ourtime);
        }
        $(document).ready(function () {
            StartCountDown();//start the counter down
        });
        function Decrement() {
            currentMinutes = Math.floor(secs / 60);
            currentSeconds = secs % 60;
            if (currentSeconds <= 9) currentSeconds = "0" + currentSeconds;
            secs--;
            document.getElementById("timerText").innerHTML = "Time Remaining :- " + currentMinutes + ":" + currentSeconds;
            if (secs !== -1) {
                setTimeout('Decrement()', 1000)
            }
            else {
                window.location.href="../AdminLogin.aspx?timeout=1"
            }
        }
    </script>
    <script>
         $(document).ready(function () {
             ShowTime();
             validateTime();
        });
        function ShowTime() {
            const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
            ];
            var today = new Date();
            var date = today.getDate() + '-' + (monthNames[today.getMonth()]) + '-' + today.getFullYear();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + ' ' + time;
            document.getElementById("lblTime").innerHTML = dateTime.toString("yyyy-MM-dd");
            window.setTimeout("ShowTime()", 1000);
        }
    </script>
    <script>
        $(document).ready(function () {
            validateTime();
            validateHourTime();
        });
        function validateTime() {
            var timer2 = "00:30";
            var interval = setInterval(function () {
                var timer = timer2.split(':');
                //by parsing integer, I avoid all extra string processing
                var minutes = parseInt(timer[0], 10);
                var seconds = parseInt(timer[1], 10);
                --seconds;
                minutes = (seconds < 0) ? --minutes : minutes;
                seconds = (seconds < 0) ? 59 : seconds;
                seconds = (seconds < 10) ? '0' + seconds : seconds;
                //minutes = (minutes < 10) ?  minutes : minutes;
                $('.countdown').html(minutes + ':' + seconds);
                if (minutes < 0) clearInterval(interval);
                //check if both minutes and seconds are 0
                if ((seconds <= 0) && (minutes <= 0)) clearInterval(interval);
                timer2 = minutes + ':' + seconds;
                if (timer2 == "0:00") {
                   <%-- $("#<%=BtnResendOtp.ClientID%>").removeClass("d-none");--%>
                    $('.countdown').remove();
                }
            }, 1000);
        }
        function validateHourTime() {
            var timer2 = "01:01:30";
            var interval = setInterval(function () {
                debugger;
                var timer = timer2.split(':');
                //by parsing integer, I avoid all extra string processing
                var hours = parseInt(timer[0], 10);

                hours = (minutes < 0 && seconds< 0) ? --hours : hours;
                minutes = (minutes < 0) ? 59 : minutes;
               // --minutes
                minutes = (minutes < 10) ? '00' + minutes : minutes;

                var minutes = parseInt(timer[1], 10);
                var seconds = parseInt(timer[2], 10);
                --seconds;
                minutes = (seconds < 0) ? --minutes : minutes;
                seconds = (seconds < 0) ? 59 : seconds;
                seconds = (seconds < 10) ? '00' + seconds : seconds;
                //minutes = (minutes < 10) ?  minutes : minutes;
                $('.countdownHours').html(hours + ":"+ minutes + ':' + seconds);
                if (minutes < 0) clearInterval(interval);
                //check if both minutes and seconds are 0
                if ((hours <= 0) && (seconds <= 0) && (minutes <= 0)) clearInterval(interval);
                timer2 = hours + ':' + minutes + ':' + seconds;
                if (timer2 == "00:00:00") {
                   <%-- $("#<%=BtnResendOtp.ClientID%>").removeClass("d-none");--%>
                    $('.countdownHours').remove();
                }
            }, 1000);
        }
    </script>
    <script>
        function startTimer(duration, display) {
             debugger;
            var timer = duration,minutes,seconds; //hours
            setInterval(function () {
               // hours = parseInt(timer / 120, 10);
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

              // hours = hours < 10 ? "0" + hours : hours;
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;
                 display.textContent = minutes + ":" + seconds;
               // display.textContent = hours+ ":"+ minutes + ":" + seconds;

                if (--timer < 0) {
                    timer = duration;
                }
            }, 1000);
        }

        window.onload = function () {
            var fiveMinutes =60*5,
                display = document.querySelector('#time');
            startTimer(fiveMinutes, display);
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="col-md-12">
                                <h3>Type table used</h3>
                                <asp:Label ID="timerText" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblTime" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Label1" CssClass="countdown" runat="server" Text=""></asp:Label><br />
                                <asp:Label ID="Label2" CssClass="countdownHours" runat="server" Text=""></asp:Label><br />
                                <asp:Label ID="time"  runat="server" Text=""></asp:Label>
                            </div>
                        </div>
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
                            <div class="col-md-4">         
                               Login Id : <asp:TextBox ID="txtloginid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="col-md-12 text-center">
                                <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnsave_Click" />
                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
