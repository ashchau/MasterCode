<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="ShowDynamicImg.aspx.cs" Inherits="Clientsidevalidation_ShowDynamicImg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<script type="text/javascript">
  $(document).ready(function(){    
  	var language=$('#h_language').val();
    $("#dynamicimgcontainer").change(function() {
      $('.newHeader').removeClass('showMenu');	
	  $('.smolNav').removeClass('closeNav');
      var selectedLanguage=$(this).val();
        $('#language_popup').modal('show');
           
           $(".btn").click(function(){
              var selectedid=$(this).val();
              if(selectedid){
                  $("#selectedLanguage").val($('#h_language').val());
              }else{
                  window.location.href="http://heritage.ahmedabadcity.gov.in/home/"+selectedLanguage;    
             }      
           });
       });
    $(".close").click(function(){
        $("#selectedLanguage").val($('#h_language').val());
        
    });
});
</script>--%>
     <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

    <script type="text/javascript">  
        $(document).ready(function() {  
            SearchText();  
        });  
        function SearchText() {
            $("#ContentPlaceHolder1_txtEmpName").autocomplete({  
                source: function(request, response) {  
                    $.ajax({  
                        type: "POST",  
                        contentType: "application/json; charset=utf-8",  
                        url: "ShowDynamicImg.aspx/GetEmployeeName",  
                        data: "{'empName':'" + document.getElementById('ContentPlaceHolder1_txtEmpName').value + "'}",  
                        dataType: "json",  
                        success: function(data) {  
                            response(data.d);  
                        },  
                       
                        error: function(result) {  
                            alert("No Match");  
                        }  
                    });  
                }  
            });  
        }  
         function SearchText1() {
            debugger;
             $("#ContentPlaceHolder1_TextBox1").autocomplete({  
                source: function(request, response) {  
                    $.ajax({  
                        type: "POST",  
                        contentType: "application/json; charset=utf-8",  
                        url: "ShowDynamicImg.aspx/GetEmployeeName1",  
                        data: "{'empName':'" + document.getElementById('ContentPlaceHolder1_TextBox1').value + "'}",  
                    //    dataType: "json",  
                        success: function (data) {
                            console.log(data);
                            //response(data.d);  
                            //console.log(data.d.length);
                            //$('#ContentPlaceHolder1_grdsearch').append("<tr><th>Recognition_Type </th><th>Recognition_Number </th></tr>")  
                            // for (var i = 0; i < data.d.length; i++) {  
                            //    debugger;  
                            //     $('#ContentPlaceHolder1_grdsearch').append("<tr><td>" + data.d[i].Heading + "</td><td>" + data.d[i].Subheading + "</td></tr>")
                            // }; 
                            //JSON.stringify(data);
                            var msg = eval('(' + data.d + ')');
                            console.log(msg);
                            for (var i = 0; i <= (msg.length - 1); i++) {
                                tr = $('<tr/>');
                                tr.append("<td class='FirstName'>" + msg[i].Heading + "</td>");
                                tr.append("<td class='LastName'>" + msg[i].Subheading + "</td>");
                                //tr.append("<td class='City'>" + emp.City + "</td>");
                                //tr.append("<td class='ReportsTo'>" + emp.ReportsTo + "</td>");
                                //tr.append("<td>" + "<a Onclick='return false;' class='DeleteCss' href=/Home/DeleteEmployee/" + empid + ">Delete</a>" + " | " + "<a class='EditCss' href=/Home/UpdateEmployee/" + empid + ">Edit</a>" + "</td>");
                                $('#ContentPlaceHolder1_tblEmployee').append(tr);
                            }
                        },  
                       
                        error: function(result) {  
                            alert("No Match");  
                        }  
                    });  
                }  
            });  
         }  
      $(function()  
        {  
               $("#ContentPlaceHolder1_TextBox1").keypress(function(){  
                   //alert("Wow; Its Work!.");
                  SearchText1();
           });  
        }); 
    </script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
         <asp:PlaceHolder ID="dynamicimgcontainer" runat="server">
             <div runat="server" id="dnyimg" class="col-md-12">

             </div>
         </asp:PlaceHolder>
    </div>
     <div>
       Enter employee name New: <asp:TextBox ID="TextBox1" runat="server" Width="160px" />  
    </div>
    <div>
        <table id="tblEmployee" class="table  table-bordered table-hover">
        <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>City</th>
            <th>Report To</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
    </div>
    <div>
       Enter employee name: <asp:TextBox ID="txtEmpName" runat="server" Width="160px" />  
    </div>
    <div>
        <asp:Repeater runat="server" ID="Searchdata">
            <ItemTemplate>
                <div class="item">
                   <%-- <a href='<%# "PDF/"+Eval("pdfname") %>' class="group1"><%# Eval("name") %></a>--%>
                    <asp:Label runat="server" ID="Label1" Text='<%# Eval("empname") %>'></asp:Label><br />
                  <%--  <a href='<%# Eval("Linkulr") %>'>
                           <asp:Label runat="server" ID="lbl_heading" Text='<%# Eval("Heading") %>'></asp:Label><br />
                           <asp:Label runat="server" ID="lbl_subheading" Text='<%# Eval("Subheading") %>'></asp:Label>
                    </a>--%>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
   <div>
       Search:<asp:TextBox ID="txtsearch" runat="server" OnTextChanged="txtsearch_TextChanged" AutoPostBack="true"></asp:TextBox><asp:Label runat="server" ID="Label2"></asp:Label>
       <asp:GridView ID="grdsearch" runat="server" AutoGenerateColumns="false" CssClass="table">
           <Columns>
               <asp:TemplateField HeaderText="Search link" ShowHeader="false">
                   <ItemTemplate>
                       <div>
                           <a href='<%# Eval("Linkulr") %>'>
                           <asp:Label runat="server" ID="lblheading" Text='<%# Eval("Heading") %>'></asp:Label><br />
                           <asp:Label runat="server" ID="lblsubheading" Text='<%# Eval("Subheading") %>'></asp:Label>
                          </a>
                       </div>
                       
                   </ItemTemplate>
               </asp:TemplateField>
           </Columns>
       </asp:GridView>
   </div>
</asp:Content>

