<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimerHours.aspx.cs" Inherits="Timer_TimerHours" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <style>
body{
    text-align: center;
    background: #00ECB9;
  font-family: sans-serif;
  font-weight: 100;
}
h1{
  color: #396;
  font-weight: 100;
  font-size: 40px;
  margin: 40px 0px 20px;
}
 #clockdiv{
    font-family: sans-serif;
    color: #fff;
    display: inline-block;
    font-weight: 100;
    text-align: center;
    font-size: 30px;
}
#clockdiv > div{
    padding: 10px;
    border-radius: 3px;
    background: #00BF96;
    display: inline-block;
}
#clockdiv div > span{
    padding: 15px;
    border-radius: 3px;
    background: #00816A;
    display: inline-block;
}
smalltext{
    padding-top: 5px;
    font-size: 16px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Countdown Clock</h1>
<div id="clockdiv">
  <div>
    <span class="days" id="day"></span>
    <div class="smalltext">Days</div>
  </div>
  <div>
    <span class="hours" id="hour"></span>
    <div class="smalltext">Hours</div>
  </div>
  <div>
    <span class="minutes" id="minute"></span>
    <div class="smalltext">Minutes</div>
  </div>
  <div>
    <span class="seconds" id="second"></span>
    <div class="smalltext">Seconds</div>
  </div>
</div>
  
<p id="demo"></p>
        </div>
        <script>
  
var deadline = new Date("dec 31, 2023 15:37:25").getTime();
  
var x = setInterval(function() {
  
var now = new Date().getTime();
var t = deadline - now;
var days = Math.floor(t / (1000 * 60 * 60 * 24));
var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60));
var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
var seconds = Math.floor((t % (1000 * 60)) / 1000);
document.getElementById("day").innerHTML =days ;
document.getElementById("hour").innerHTML =hours;
document.getElementById("minute").innerHTML = minutes; 
document.getElementById("second").innerHTML =seconds; 
if (t < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "TIME UP";
        document.getElementById("day").innerHTML ='0';
        document.getElementById("hour").innerHTML ='0';
        document.getElementById("minute").innerHTML ='0' ; 
        document.getElementById("second").innerHTML = '0'; }
}, 1000);
</script>
    </form>
</body>
</html>
