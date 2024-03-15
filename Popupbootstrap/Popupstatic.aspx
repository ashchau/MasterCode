<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="Popupstatic.aspx.cs" Inherits="Popupbootstrap_Popupstatic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" crossorigin="anonymous"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <!--for ajax call start -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        $(function () {
            debugger;
            $('#btnSubmit').click(function () {
                var name = $('#txtname').val();
                var subject = $('#txtsubject').val();
                var body = $('#txtbody').val();
                if (name != '' && subject != '' && body) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Popupstatic.aspx/InsertData",
                        data: "{'username':'" + name + "','subj':'" + subject + "','desc':'" + body + "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                $('#txtname').val('');
                                $('#txtsubject').val('');
                                $('#txtbody').val('');
                                $('#lblmsg').html("Details Submitted Successfully");
                                //alert("Details Submitted Successfully");
                                //window.location.reload();
                                //window.location = "http://localhost:51642//Ajaxexample.aspx";
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
                else {
                    alert('Please enter all the fields')
                    return false;
                }
            })
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
        });
    </script>
    <!--for ajax call End-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="container">
	<h2>Disallow Bootstrap Modal to Open on Click Outside Using HTML</h2>
	<button type="button" id="MybtnPreventHTML" class="btn btn-primary" data-target="#MymodalPreventHTML" data-toggle="modal" data-backdrop="static" data-keyboard="false">Open Modal</button>
	<!-- .modal -->
	<div class="modal fade" id="MymodalPreventHTML">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button> 
					<h4 class="modal-title">Add Employee</h4>                                                             
				</div> 
				<div class="modal-body">
					<p>Are you sure you want to Save data?</p><br />
                    Name List :
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                       Name :
                      <input type="text" id="txtname" class="form-control" runat="server" />
                      Subject :
                      <input type="text" id="txtsubject" class="form-control" runat="server" />
                      Body :
                      <textarea id="txtbody" class="form-control" runat="server"></textarea>
                        <label id="lblmsg" runat="server" style="color:green"/><br />
				</div>   
				<div class="modal-footer">
                    <input id="btnSubmit" type="button" value="Submit" class="btn btn-success" />
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnaspsave" runat="server" Text="Asp Save" CssClass="btn btn-info"/>
				</div>
			</div>                                                                       
		</div>                                          
	</div>
</div>


</asp:Content>

