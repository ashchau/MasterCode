<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="Timepicker.aspx.cs" Inherits="Admin_Timepicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script type="text/javascript">
        var dt = new Date();

        //Adding +1 to months
        var Fromdatetime = dt.getFullYear() + "-" + ("0" + (dt.getMonth() + 1)).slice(-2) + "-" + ("0" + dt.getDate()).slice(-2) + "T" + ("0" + dt.getHours()).slice(-2) + ":" + ("0" + dt.getMinutes()).slice(-2);

        //Using attr 
        $('#FromDate').attr('value', Fromdatetime);
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
          
        <input id="FromDate" runat="server" name="FromDate" style="width:30%" type="datetime-local"/>
        <asp:TextBox ID="datetimepicker" runat="server" ClientIDMode="Static"></asp:TextBox>
       Test<asp:TextBox ID="datetimepicker2" runat="server" ClientIDMode="Static" CssClass="timepicker"></asp:TextBox>
        TestNew<asp:TextBox ID="TextBox1" runat="server" ClientIDMode="Static" CssClass="example"></asp:TextBox>
        <input type="text" name="time" data-provide="timepicker"  id="time" class="form-control" placeholder="Start Time" value="" />
        <asp:Button ID="btngettime" runat="server" Text="Getdatetime" OnClick="btngettime_Click" />
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"/>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
     <script>
        $(document).ready(function () {
            
         })
         //$(function () {
         //    $('#datetimepicker').datetimepicker({
         //   format: 'HH:mm'
         //   });
            // $('#datetimepicker2').datetimepicker({
            //format: 'MM/DD/YYYY HH:mm'
            // });

         $('.timepicker').timepicker({
             format: 'HH:mm',
             //use24HourClock:true,
              //showMeridian: false ,
             //scrollDefault:"18:00",

                dynamic: false,
                dropdown: true,
                scrollbar: true
               
            });
         //})
         $(".example").timepicker({

             ampmText: { am: "am", pm: "pm", AM: "AM", PM: "PM" },

             hourHeaderText: "hour",

             minHeaderText: "min",

             okButtonText: "&#10004;",

             cancelButtonText: "&#10005;"

         });

       
     </script>
</asp:Content>

