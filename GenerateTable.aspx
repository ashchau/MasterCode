<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateTable.aspx.cs" Inherits="GenerateTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generate Table</title>
    <link rel = "icon" href ="PDF/Ashok.png" type = "image/x-icon">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
   <%-- for panel design--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />--%>
    <%-- datetime picker script start --%>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/themes/south-street/jquery-ui.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://keith-wood.name/js/jquery.validate.js"></script>
    <script type="text/javascript" src="http://keith-wood.name/js/jquery.ui.datepicker.validation.js"></script>
    <script type="text/javascript">
        //https://social.msdn.microsoft.com/Forums/en-US/360778f6-d8fc-4efd-bdde-fab2329a8e5c/how-to-validate-date-time-texbox-with-date-picker?forum=aspmvc
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    Dateofbirth: {
                        required: true,
                        dpDate: true,
                    }
                }
            });
            
            $("input[name='Dateofbirth']").datepicker({

                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                minDate: '',
                maxDate: '0',
            }).datepicker("setDate", new Date());
            //this is another method
            $("#mydate").datepicker({ dateFormat: "dd-mm-yy", minDate: '', maxDate: '0', changeMonth: true, changeYear: true }).datepicker("setDate", new Date());
       
             //this is another method
             $('#txttoday').datepicker();
             $('#txttoday').datepicker('setDate', 'today');
        });
      //var currentDate = new Date();  
            //$("#Dateofbirth").datepicker("setDate",currentDate);
       
    </script>
    <script>
         function EnterEvent(e, ctrl) {
                if ($(ctrl).val().length == 4) {
                    __doPostBack('<%=TextBox1.Text%>', "change");
                }
            }
    </script>
    <%-- End script --%>
    <style>
        .textcolor
        {
            background-color:yellow;
            color:forestgreen;
            
        }
        .textheight{
            width:50%;
        }
        table{
            /*border:double;*/
        }
        tbody{
            text-align:center;
            /*border:dotted;
            border-color:aqua;*/
        }
        tbody tr td{
            width:100px;
            color:burlywood;
        }
    </style>
    <style>
        /*tbody > tr > td, thead > tr > th {
            color: #01064b;
        }*/

       table tbody tr th {
            background: #f0d5d4;
            text-align:center;
            color:#931b2f;
        }
        table tbody tr th:first-child{
            text-align:left;
        }
        table tbody tr td:first-child{
            text-align:left;
        }

        .other-links {
            float: left;
            position: relative;
            width: 100%;
            /*border: solid 1px #d1d1d1;*/
            border: solid 1px #000000;
            padding: 10px;
            background: linear-gradient( 119.54deg,#000046 0%,#1CB5E0 100%);
            color: #fff;
        }

            .other-links h2 {
                font-size: 13px;
                font-weight: 600;
                margin: 0 0;
            }
/*the below style use for readonly textbox values*/
        .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
            cursor: not-allowed;
            background-color: #eee;
            opacity: 1;
            width:260px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h2 class="panel-title text-center">DateTimePicker Example</h2>
                        </div>
                        <div class="panel panel-body"><%--this class is used for showing panel frame border--%>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    Current date:<input id="Dateofbirth" runat="server" type="text" class="form-control" style="width: 260px" />
                                </div>
                                <div class="col-md-4">
                                    Mydate:<asp:TextBox ID="mydate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div>
                                    Today date :<asp:TextBox ID="txttoday" runat="server" CssClass="form-control" Width="260px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    Text change :<asp:TextBox ID="txtFourC" CssClass="form-control" runat="server" OnTextChanged="txtFourC_TextChanged" AutoPostBack="true" MaxLength="4" Width="260px"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    second:<asp:TextBox ID="TextBox1" CssClass="form-control" ClientIDMode="Static" runat="server" onkeypress="return EnterEvent(event,this)" AutoPostBack="true" MaxLength="4" Width="260px"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    Search:<asp:TextBox ID="txtid" runat="server" CssClass="form-control" Width="260px"></asp:TextBox>
                                    <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" CssClass="btn btn-warning" />
                                </div>
                            </div>
                        </div>
                       
                    </div> <%--Main div panel--%>
                </div>
            </div>

        </div>
        <div style="margin-left:10px">
            <%--https://www.maps.ie/create-google-map/--%>
            <%--https://www.youtube.com/watch?v=QrqMDoi_lBs--%>
            <%--https://www.google.com/maps/--%>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-6 text-center">
                    <div class="panel panel-primary text-center">
                        <div class="panel-heading">
                            <h3 class="panel-title">Generate Table</h3>
                        </div><br />
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <asp:TextBox ID="txtledger" runat="server" CssClass="form-control"></asp:TextBox>
                               
                            </div>
                            <div class="col-md-4">
                                 <asp:Button ID="btnledger" runat="server" Text="Show Ledger" CssClass="btn btn-info" OnClick="btnledger_Click" />
                            </div>
                        </div>
                        <br /><br />
                        <div class="panel panel-body">
                            <div class="col-md-12">
                                <div class="other-links" id="divledger" runat="server" visible="false">
                                    <h2>Ledger Details</h2>
                                </div>
                            </div>
                            <div class="col-md-12"><%--ledger code--%>
                                <div class="col-md-12 text-center">
                                    <div class="col-md-12">
                                        <asp:Label ID="lblemp" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><%--Main div--%>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-md-4">
                        <iframe src="https://www.google.com/maps/d/embed?mid=183xgy9xi-1UDyWHQSrDqZkZ8XdjjWBUU&ehbc=2E312F" width="340" height="280"></iframe>
                    </div>
                    <div class="col-md-4">
                       <%-- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/time--%>
                        <label for="appt-time">Choose an appointment time: </label>
                        <input id="appt-time" type="time" name="appt-time" />
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lbltable" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>
