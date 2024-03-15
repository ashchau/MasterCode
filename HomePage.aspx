<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
     <style>
        tbody > tr > td, thead > tr > th {
            color: #01064b;
        }

        /*.other-links {
            border-color: #000000;
        }*/
        /*this is used for butten size*/ 
        table .btn {
            padding: 2px 5px;
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
         /*.h2{
             font-size:16px;
             margin-top:1px;
             margin-bottom:1px;
         }*/
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>

        <div class="container">
            <div class="row">
                <div class="panel panel-primary text-center">
                    <div class="panel-heading">
                         <h3 class="panel-title">This is home page</h3>
                    </div>
                   
                </div>
                <div class="panel ">
                    <div>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">My Contact</a></li>
                            <li><a href="#">My Gallery</a></li>
                            <li><a href="#">My Site Map</a></li>
                            <li><a href="Popupbootstrap/Popupundergrid.aspx">PopupUnderGrid</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label ID="luser" runat="server" Text="Label"></asp:Label><br />
                        <asp:Label ID="lmobile" runat="server" Text="Label"></asp:Label><br />
                        <asp:Label ID="lfrndname" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>

            </div>
        </div>
    </div>
 <div class="container">
    <div class="row">
        <div class="col-md-12 col-sm-6 text-center">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">This is the design page Demo</h3>
                </div>
                <div class="panel-body"><%--panel body start--%>
                    <div class="col-md-4 text-center">
                        <div class="other-links">
                            <h2 >दुकाने / कियोस्क वर्ल्ड </h2>
                        </div>
                        <div>
                            <table class="table table-bordered">
                                <tbody>
                                    <tr style="font-weight:bold">
                                        <td>Serial No.</td><td>Name</td><td>Details</td>
                                    </tr>
                                    <tr><td>1</td><td>Ashok Chauhan</td><td>Oswal computer</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="other-links">
                            <h2 >दुकाने / कियोस्क वर्ल्ड </h2>
                        </div>
                        <div>
                            <table class="table table-bordered">
                                <tbody>
                                    <tr style="font-weight:bold">
                                        <td>Serial No.</td><td>Name</td><td>Details</td>
                                    </tr>
                                    <tr><td>1</td><td>Ashok Chauhan</td><td><a href="PDF/filesearch.pdf" class="btn btn-danger">View Details</a></td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="other-links">
                            <h2 >दुकाने / कियोस्क वर्ल्ड </h2>
                        </div>
                        <div>
                            <table class="table table-bordered">
                                <tbody>
                                    <tr style="font-weight:bold">
                                        <td>Serial No.</td><td>Name</td><td>Details</td>
                                    </tr>
                                    <tr><td>1</td><td>Ashok Chauhan</td><td><a href="PDF/filesearch.pdf" class="btn btn-primary">View Details</a></td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> <%--panel body End--%>
            </div>
        </div>

    </div>
</div>
</asp:Content>

