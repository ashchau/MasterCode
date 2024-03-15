<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="PopupGrid_2.aspx.cs" Inherits="Popupbootstrap_PopupGrid_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/bootstrap.js"></script>
           
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <style>
         /*.asphidden[readonly], fieldset[readonly] .asphidden {
            cursor: not-allowed;
        }*/
         /*The above css used for asp textbox for readonly property it's work as disable property */
        .asphidden[disabled], fieldset[disabled] .asphidden {
            cursor: not-allowed;
        }

        .asphidden[disabled], .asphidden[readonly], fieldset[disabled] .asphidden {
            background-color: #eee;
            opacity: 1;
        }
        .asphidden {
            height: 30px;
            padding: 5px 5px;
            line-height: 30px;
        }
    </style>
    <script type="text/javascript">  
        $(document).ready(function () {
            $("#btnSubmit").click(function () {
                $.ajax
                    ({
                        type: "POST", contentType: "application/json; charset=utf-8",
                        url: "PopupGrid_2.aspx/BindCustomers",
                        data: "{}",
                        dataType: "json",
                        success: function (result) {
                            $("#tblDetails").empty();//this is to empty the table when click multiple time submit button.
                            for (var i = 0; i < result.d.length; i++) {
                                $("#tblDetails").append("<tr><td>" + result.d[i].CustomerID + "</td><td>" + result.d[i].Name + "</td><td>" + result.d[i].Mobile + "</td><td>" + result.d[i].City + "</td></tr>");
                            }
                            console.log(result);

                        },

                        error: function (result) {
                            alert("Error");
                        }
                    });
            });

        });
    </script>
 <%-- Script for show datetime on with input name on aleart--%>
    <script type="text/javascript">  
        function ShowCurrentTime() {
            //debugger;
            $.ajax({
                type: "POST",
                url: "PopupGrid_2.aspx/GetCurrentTime",
                data: '{name: "' + $("#<%=txtUserName.ClientID%>")[0].value + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function OnSuccess(response) {
            alert(response.d);
        }
    </script>
    <%-- Script for convert fahrenheit to celsius vs --%>
    <script type="text/javascript">
        function FahrenHeit() {
            debugger;
            $.ajax({
                type: "POST",
                url: "PopupGrid_2.aspx/FahrenheitToCelsius",
                data: '{fahrenheit: "' + $("#<%=txtFahrenheit1.ClientID%>")[0].value + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess1,
                failure: function (data) {
                    alert(data.d);
                }
            });
        }
        function OnSuccess1(data) {
            //$('#txtCelsius1').val(data.d);  //it's not work
            $('#' + '<%= txtCelsius1.ClientID%>').val(data.d); 
           // alert(data.d);
            //console.log(data);
        }
        $(document).ready(function () {
            //
            
            $('#' + '<%= txtFahrenheit1.ClientID%>').keyup(function () {
                 $("input").css("background-color", "yellow"); //THIS IS USE FOR COLOR ALL TEXTBOX ON KEYUP ()
                if ($('#' + '<%= txtFahrenheit1.ClientID%>').val().length == 0) {
                    $('#' + '<%= txtCelsius1.ClientID%>').val('');
                }
                $.ajax({
                    type: "POST",
                    url: "PopupGrid_2.aspx/FahrenheitToCelsius",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ 'fahrenheit': $('#' + '<%= txtFahrenheit1.ClientID%>').val() }),
                    success: function (data) {
                        // $('#txtCelsius1').val(data.d);   //it's not work
                        $('#' + '<%= txtCelsius1.ClientID%>').val(data.d);
                    }
                });
            });
            //
            $('#' + '<%= txtCelsius2.ClientID%>').keyup(function () {
                if ($('#' + '<%= txtCelsius2.ClientID%>').val().length == 0) {
                    $('#' + '<%= txtFahrenheit2.ClientID%>').val('');
                }
                $.ajax({
                    type: "POST",
                    url: "PopupGrid_2.aspx/CelsiusToFahrenheit",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ 'celsius': $('#' + '<%= txtCelsius2.ClientID%>').val() }),
                    success: function (data) {
                        console.log(data);
                        // $('#txtFahrenheit2').val(data.d);
                        $('#' + '<%= txtFahrenheit2.ClientID%>').val(data.d);
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table style="background-color: yellow; border: solid 5px red; width: 100%" align="center">  
                                <tr>  
                                    <td style="background-color: orangered; padding: 2px; text-align: center; color: white; font-weight: bold; font-size: 14pt;">Showing Data Using jQuery, JSON & AJAX Call</td>  
                                </tr>  
                                <tr>  
                                    <td>  
                                        <%--<button id="btnShowData" runat="server">Get Data</button>  --%>
                                         <input id="btnSubmit" type="button" value="Submit" class="btn btn-success" />
                                            <br/>  
                                            <br/>  
                                            <%--<form id="form1" runat="server" style="background-color:deepskyblue; padding:5px;">  --%>
                                             <asp:GridView ID="gvData" runat="server" CellPadding="4" ShowHeaderWhenEmpty="true" ForeColor="White" Width="100%">  
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                                                    <RowStyle BackColor="#EFF3FB" />  
                                                </asp:GridView> 
                                                 
                                           <%--</form>  --%>
                                    </td>  
                                </tr>  
                             </table>  
         </div>  
        <div>
         <table>
            <tbody id="tblDetails"></tbody>
        </table>
         </div>
    <div>
        <div>  
    Your Name :  
    <asp:textbox id="txtUserName" runat="server" CssClass="asphidden" ReadOnly="true" ></asp:textbox>  
            <input  type="text" id="txtname" runat="server" disabled="disabled" class="asphidden"/>
    <input id="btnGetTime" type="button" value="Show Current Time" onclick="ShowCurrentTime()" />  
</div> 
    </div>
        <div>
    </div>
     <div id="MainDialog" title="Temperature Converter">  
        <table width="100%">  
            <tr>  
                 <td><label>Fahrenheit : </label></td>  
                 <td><asp:TextBox ID="txtFahrenheit1" runat="server" ></asp:TextBox></td>  
            </tr>  
            <tr>  
                 <td><label>Celsius : </label></td>  
                 <td><asp:TextBox ID="txtCelsius1" runat="server" CssClass="text ui-widget-content ui-corner-all" title="Enter Customer Full Name" ></asp:TextBox></td>  
            </tr>  
            <tr>  
                <td><input id="fahrenheit" type="button" value="Fahrenheit To Celsius" onclick="FahrenHeit()" /> </td>
                <td colspan="2"><hr /></td>  
            </tr>  
            <tr>  
                 <td><label>Celsius : </label></td>  
                 <td><asp:TextBox ID="txtCelsius2" runat="server" CssClass="text ui-widget-content ui-corner-all" title="Enter Customer Full Name"></asp:TextBox></td>  
            </tr>  
            <tr>  
                 <td><label>Fahrenheit : </label></td>  
                 <td><asp:TextBox ID="txtFahrenheit2" runat="server" CssClass="text ui-widget-content ui-corner-all" title="Enter Customer Full Name"></asp:TextBox></td>  
            </tr>  
        </table>  
    </div>  
</asp:Content>

