<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delete_Edit_Multirecord_chk.aspx.cs" Inherits="Gridview_Delete_Edit_Multirecord_chk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type = "text/javascript">

        function checkAll(objRef) {

            var GridView = objRef.parentNode.parentNode.parentNode;

            var inputList = GridView.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {

                //Get the Cell To find out ColumnIndex

                var row = inputList[i].parentNode.parentNode;

                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {

                    if (objRef.checked) {

                        //If the header checkbox is checked

                        //check all checkboxes

                        //and highlight all rows

                        row.style.backgroundColor = "aqua";

                        inputList[i].checked = true;

                    }

                    else {

                        //If the header checkbox is checked

                        //uncheck all checkboxes

                        //and change rowcolor back to original

                        if (row.rowIndex % 2 == 0) {

                            //Alternating Row Color

                            row.style.backgroundColor = "#C2D69B";

                        }

                        else {

                            row.style.backgroundColor = "white";

                        }

                        inputList[i].checked = false;

                    }

                }

            }

        }

    </script> 


    <script type="text/javascript">
            $(document).ready(function(){
                $("#checkall").change(function(){
                   var checked = $(this).is(':checked');
                   if(checked){
                     $("input[name=languages]").each(function(){
                       $(this).prop("checked",true);
                     });
                   }else{
                     $("input[name=languages]").each(function(){
                       $(this).prop("checked",false);
                     });
                   }
               });
    
                $(".checkbox").click(function(){
    
                    if($(".checkbox").length == $(".checkbox:checked").length) {
                 
			            $("#checkall").prop("checked", true);
		            } else {
			            $("#checkall").prop("checked", false);
		            }

                 });
            });
        </script>
    <script type="text/javascript">

        function ConfirmDelete() {

            var count = document.getElementById("<%=hfCount.ClientID %>").value;

        var gv = document.getElementById("<%=GridViewEmployee.ClientID%>");

            var chk = gv.getElementsByTagName("input");

            for (var i = 0; i < chk.length; i++) {
                debugger;
                if (chk[i].checked && chk[i].id.indexOf("chkAll") == -1) {

                    count++;

                }

            }

            if (count == 0) {

                //alert("No records to delete.");
                alert("Select at list one record to delete.");

                return false;

            }

            else {

                return confirm("Do you want to delete " + count + " records.");

            }

        }
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>  
        <table style="border: solid 15px blue; width: 100%; vertical-align: central;">  
            <tr>  
                <td style="padding-left: 50px; padding-top: 20px; padding-bottom: 20px; background-color: skyblue;  
                    font-size: 20pt; color: orangered;">  
                    Delete Multiple Records In Grid View Using Check Box in ASP.NET C#  
                </td>  
            </tr>  
            <tr>  
                <td style="text-align: left; padding-left: 50px; border: solid 1px red;">  
                    <asp:GridView ID="GridViewEmployee" runat="server" DataKeyNames="empid" AutoGenerateColumns="False"  
                        Width="90%" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"  
                        CellPadding="4" GridLines="Both">  
                        <Columns>  
                            <asp:TemplateField HeaderText="Select">
                                <HeaderTemplate>

                                  <%--  second<asp:CheckBox ID="chkAll" runat="server" />--%>
                                   Select all <asp:CheckBox ID="checkAll" runat="server" onclick = "checkAll(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>  
                                    <asp:CheckBox ID="chkSelect" runat="server" onclick="chkSelect_Click(this);" />  
                                </ItemTemplate>  
                            </asp:TemplateField>  
                            <asp:BoundField DataField="empname" HeaderText="Employee Name" />    
                            <asp:BoundField DataField="salary" HeaderText="Salary" />  
                            <asp:BoundField DataField="mobile" HeaderText="Mobile" />  
                            
                        </Columns>  
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />  
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />  
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />  
                        <RowStyle BackColor="White" ForeColor="#003399" />  
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />  
                    </asp:GridView>  
                </td>  
            </tr> 
            <tr><td> <asp:HiddenField ID="hfCount" runat="server" Value="0" /></td></tr>
            <tr>  
                <td align="right">
                    <asp:Label ID="lblmsg" runat="server" Text="lblmsg" Visible="false"></asp:Label></td>
                <td align="right">  
                    <asp:Button ID="btnDeleteRecords" Text="Delete Records" OnClick="btnDeleteRecords_Click"  runat="server" OnClientClick="return ConfirmDelete();" />
                    <asp:Button ID="btncheckall" runat="server" Text="Check All" OnClick="btncheckall_Click" />
                </td>  
            </tr>  
        </table>  
    </div>  
        <div>
            <table>
                <tr><td>
                    <asp:CheckBox ID="select_All" runat="server" Text="Select All" /></td></tr>
                <tr><td>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="Apple" /></td></tr>
                <tr><td>
                    <asp:CheckBox ID="CheckBox3" runat="server" Text="Mango" /></td></tr>
                <tr><td>
                    <asp:CheckBox ID="CheckBox4" runat="server" Text="PineApple" /></td></tr>
                <tr><td>
                    <asp:CheckBox ID="CheckBox5" runat="server" Text="Banana" /></td></tr>
            </table>
        </div>
        <div class='container'>
            <h2>Example2 - With Checkboxes</h2><%--https://makitweb.com/how-to-check-and-uncheck-all-using-jquery-and-javascript/--%>
            <input type="checkbox" id='checkall' />
            Select All<br />
            <input type="checkbox" class='checkbox' name="languages" value="PHP"/>
            PHP<br />
            <input type="checkbox" class='checkbox' name="languages" value="AngularJS" />
            AngularJS<br />
            <input type="checkbox" class='checkbox' name="languages" value="Python" />
            Python<br />
            <input type="checkbox" class='checkbox' name="languages" value="Java" />
            Java<br />
        </div>
        <div>

        </div>
    </form>
</body>
</html>
