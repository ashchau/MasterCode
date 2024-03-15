<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="ChkenableDisable.aspx.cs" Inherits="Gridview_ChkenableDisable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {

            //model 
            $("#model").click(function () {
                $(".popup").hide();
                return false;
            });

            ////disable or enable button or fileupload on checkbox click
            $(".gridCbk").siblings().attr("disabled", "disabled");
            $(".gridCbk").click(function () {
                let cbk = $(this).children("input[type=checkbox]")[0];
                if (cbk.checked) {
                    $(this).siblings().removeAttr("disabled");
                } else {
                    $(this).siblings().attr("disabled", "disabled");
                }
                 
            });
            //second method
            $(".cbkRow").click(function (e) {
                let cbkRow = e.target.checked
                $(".cbkRow input[type=checkbox]").prop("checked", false)
                $(this).children("input[type=checkbox]").eq(0).prop("checked", cbkRow);
                $(".grdFile").attr("disabled", "disabled");
                //above 4 line used for checked one checkbox at a time and below line used for enable disable fileuploader
                 // console.log(e.target.id);
                  let arrid = e.target.id.split('_');
                  //console.log(e);
                let fileID = arrid[0]+ "_"+ arrid[1]+ "_FileUpload2_" + arrid[3];
                  //let btnDelete = arrid[0] + "_DeleteboxId_" + arrid[2]; //without master
                //how to get the lable value
                let eID = arrid[0] + "_" + arrid[1] + "_lblsn_" + arrid[3];
                var eval = $("#" + eID).text();
                  console.log(eval);
                if (e.target.checked) {
                    $("#" + fileID).removeAttr("disabled");
                   // $("#" + btnDelete).removeAttr("disabled")
                } else {
                    $("#" + fileID).attr("disabled", "disabled");
                   // $("#" + btnDelete).attr("disabled", "disabled");
                }
                 
            });      
        });
    </script>
    <script>
        function DropDown(fid) {
            debugger;
            var PlotType1 = document.getElementById("<%=ddl1.ClientID%>").value;
            var PlotType2 = document.getElementById("<%=ddl2.ClientID%>").value;
            var PlotType3 = document.getElementById("<%=ddl3.ClientID%>").value;
            var PlotType4 = document.getElementById("<%=ddl4.ClientID%>").value;

            $('#ContentPlaceHolder1_hdftxt1').val(PlotType1);
            $('#ContentPlaceHolder1_hdftxt2').val(PlotType2);
            document.getElementById("<%=hdftxt3.ClientID%>").value = PlotType3;
            document.getElementById("<%=hdftxt4.ClientID%>").value = PlotType4;

            var skillsSelect = document.getElementById("<%=ddl1.ClientID%>");
            console.log(skillsSelect);
            var selectedText = skillsSelect.options[skillsSelect.selectedIndex].text;
            console.log(selectedText);

            document.getElementById("<%=ddl1.ClientID%>").style.borderColor = "Lightgray";
            document.getElementById("<%=ddl2.ClientID%>").style.borderColor = "Lightgray";
            document.getElementById("<%=ddl3.ClientID%>").style.borderColor = "Lightgray";
            document.getElementById("<%=ddl4.ClientID%>").style.borderColor = "Lightgray";
          

            if (PlotType1 != "0") {
                if (PlotType1 == PlotType2 || PlotType1 == PlotType3 || PlotType1 == PlotType4) {
                    alert('Priorty already selectd Select other plot type');
                    document.getElementById(fid).value = "0";
                    document.getElementById(fid).style.borderColor = "Red";
                    return false;
                }
                else {
                    document.getElementById("<%=txt1.ClientID%>").value = PlotType1;
                }
            }

            if (PlotType2 != "0") {
                if (PlotType2 == PlotType1 || PlotType2 == PlotType3 || PlotType2 == PlotType4) {
                    alert('Priorty already selectd Select other plot type');
                    document.getElementById(fid).value = "0";
                    document.getElementById(fid).style.borderColor = "Red";
                    return false;
                }
                 else {
                    document.getElementById("<%=txt2.ClientID%>").value = PlotType2;
                }
            }

            if (PlotType3 != "0") {
                if (PlotType3 == PlotType1 || PlotType3 == PlotType2 || PlotType3 == PlotType4) {
                    alert('Priorty already selectd Select other plot type');
                    document.getElementById(fid).value = "0";
                    document.getElementById(fid).style.borderColor = "Red";
                    return false;
                }
                 else {
                    document.getElementById("<%=txt3.ClientID%>").value = PlotType3;
                }
            }

            if (PlotType4 != "0") {
                if (PlotType4 == PlotType1 || PlotType4 == PlotType2 || PlotType4 == PlotType3) {
                    alert('Priorty already selectd Select other plot type');
                    document.getElementById(fid).value = "0";
                    document.getElementById(fid).style.borderColor = "Red";
                    return false;
                }
                 else {
                    document.getElementById("<%=txt4.ClientID%>").value = PlotType4;
                }
            }
        }
    </script>
     <script type="text/javascript">   
         $(document).ready(function () {
             debugger;
            maintainScrollPosition();
        });
        function pageLoad() {
            maintainScrollPosition();
        }
         function maintainScrollPosition() {
             debugger;
            $("#dvScroll").scrollTop($('#<%=hfScrollPosition.ClientID%>').val());
           // alert("hi..");
        }   
        function setScrollPosition(scrollValue) {
            $('#<%=hfScrollPosition.ClientID%>').val(scrollValue);
        }               
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="hfScrollPosition" Value="0" runat="server" />
    <div class="px-5">
        <asp:GridView ID="GridViewEmployee" runat="server" DataKeyNames="empid" AutoGenerateColumns="False"
            Width="90%" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" GridLines="Both" OnRowDataBound="GridViewEmployee_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server" onclick="ShowHideFU(this)"/>
                        <asp:CheckBox ID="CheckBox1" runat="server" onclick="CheckOne(this)"/>
                        <asp:CheckBox ID="chkupload2" runat="server" onclick="ShowHideFileupload(this)" />
                        <asp:CheckBox runat="server" ID="txtchick"  CssClass="cbkRow"  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="File Upload">
                    <ItemTemplate>
                         <asp:CheckBox ID="chkupload" runat="server" CssClass="gridCbk" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="File Upload 2">
                    <ItemTemplate>
                        <asp:FileUpload ID="FileUpload2" runat="server" Enabled="false" CssClass="grdFile" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="sn">
                    <ItemTemplate>
                         <asp:Label ID="lblsn" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="empname" HeaderText="Employee Name" />
                <asp:BoundField DataField="salary" HeaderText="Salary" />
                <asp:BoundField DataField="mobile" HeaderText="Mobile" />
              
            </Columns>
        </asp:GridView>
    </div>
    <div class="px-5" id="dvScroll">
        <div class="row">
             <div class="col-md-12">
                <div class="col-md-3">
                    <ol>
                     <li class="form-control">Plot type 1</li>
                     <li class="form-control">Plot type 2</li>
                     <li class="form-control">Plot type 3</li>
                     <li class="form-control">Plot type 4</li>
                    </ol>
                    
                </div>
                <div class="col-md-3">
                 <asp:DropDownList ID="ddl1" runat="server" CssClass="form-control" onchange="return DropDown('ContentPlaceHolder1_ddl1')"></asp:DropDownList>
                 <asp:DropDownList ID="ddl2" runat="server" CssClass="form-control" onchange="return DropDown('ContentPlaceHolder1_ddl2')"></asp:DropDownList>
                 <asp:DropDownList ID="ddl3" runat="server" CssClass="form-control" onchange="return DropDown('ContentPlaceHolder1_ddl3')"></asp:DropDownList>
                 <asp:DropDownList ID="ddl4" runat="server" CssClass="form-control" onchange="return DropDown('ContentPlaceHolder1_ddl3')"></asp:DropDownList>
                 </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txt1" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="hdftxt1" runat="server" />
                    <asp:TextBox ID="txt2" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="hdftxt2" runat="server" />
                    <asp:TextBox ID="txt3" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="hdftxt3" runat="server" />
                    <asp:TextBox ID="txt4" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="hdftxt4" runat="server" />
                </div>
                <div class="col-md-3">
                     <asp:Button ID="btnsave" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnsave_Click" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="col-3">
                    <label>Selected a particular name from the ddllist </label>
                     <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                </div>
                <div class="col-3">
                    <label>Client Id</label>
                    <asp:TextBox ID="txtcid" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-3">
                    <label>Client Name</label>
                    <asp:TextBox ID="txtcname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-3">
                    <asp:Label ID="lblcount" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
        <asp:GridView ID="grddoc" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
            <Columns>
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:Label ID="lblserno" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                        <asp:HiddenField ID="hdDocid" runat="server" Value='<%#Eval("docid") %>' />
                        <asp:HiddenField ID="hdDocDesc" runat="server" Value='<%#Eval("docname") %>' />
                        <asp:HiddenField ID="hdfmandatory" runat="server" Value='<%#Eval("mandatory") %>' />
                        <asp:CheckBox ID="chkdoc" runat="server" onclick="ShowHideFileupload(this)" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lbldocname" runat="server" Text='<%#Eval("docname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Upload file">
                    <ItemTemplate>
                        <asp:FileUpload ID="FileUploadDoc" runat="server"  CssClass="form-control" Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="col-12 text-center">
            <asp:Button ID="btnsavedoc" runat="server" Text="Submit Records" CssClass="btn btn-success" OnClick="btnsavedoc_Click" />
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <label>Basic</label>
                    <asp:TextBox ID="txtbasic" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtbasic_TextChanged"></asp:TextBox>
                </div>
                 <div class="col-md-3">
                     <label>HRA</label>
                    <asp:TextBox ID="txthra" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txthra_TextChanged"></asp:TextBox>
                </div>
                 <div class="col-md-3">
                     <label>PF</label>
                    <asp:TextBox ID="txtpf" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="col-md-3">
                     Total CTC  : <asp:TextBox ID="txttotal" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:Button ID="btncalculate" runat="server" Text="Calculate" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="col-md-12">
                <asp:GridView ID="grddownload" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                    <Columns>
                        <asp:TemplateField HeaderText="Serno">
                            <ItemTemplate>
                                <asp:Label ID="lblserno" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Application No">
                            <ItemTemplate>
                                <asp:Label ID="lblclientid" runat="server" Text='<%# Eval("clientid")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Doc Name">
                            <ItemTemplate>
                                <asp:Label ID="lbldocname" runat="server" Text='<%#Eval("docname") %>'></asp:Label>
                                <asp:HiddenField ID="hdfdocid" runat="server" Value='<%#Eval("docid") %>' />
                                <asp:HiddenField ID="hdfpath" runat="server" Value='<%#Eval("virtualpath") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                                <asp:HyperLink ID="hylview" runat="server" NavigateUrl='<%#Eval("virtualpath") %>'>View</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Download">
                            <ItemTemplate>
                                <asp:HyperLink ID="hyldownload" runat="server">Download</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <div>
       <%-- <script type="text/javascript"> not working
            $("body").on("click", "[id*=chkSelect]", function () {
                debugger;
                var chk = $("[id*=chkSelect]").is(':checked');
                if (chk == true) {
                    var button = $("[id*=Button1]");
                    console.log(button);
                    button.prop('disabled', false);
                }
                else {
                    var button = $("[id*=Button1]");
                    button.prop('disabled', true);
                }
            });
        </script>--%>
        <script>
            function ShowHideFU(checkbox) {
                //disable or enable button on checkbox click
                debugger
                var chkid = checkbox;
                console.log(chkid);
                var row = $(checkbox).closest("tr")[0];
                var inputcontrol = row.cells[0].children[0];
                var labelcontrol = row.cells[3].children[0];
                //if ($(checkbox).prop('checked') && inputcontrol != null) {
                //    $(inputcontrol).removeAttr("disabled");
                //    alert('checked');
                //}
                //else {
                //    $(inputcontrol).attr('disabled', 'disabled');
                //    $(inputcontrol).val('');
                //    alert('Unchecked');

                //}

                if ($(checkbox).prop('checked') && labelcontrol != null) {
                    $(labelcontrol).removeAttr("disabled");
                }
                else {
                    $(labelcontrol).attr('disabled', 'disabled');
                }
            }
        </script>
        <script>
            //checked one checkbox at a time
            function CheckOne(obj) {
            var grid = obj.parentNode.parentNode.parentNode;
            var inputs = grid.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == "checkbox") {
                    if (obj.checked && inputs[i] != obj && inputs[i].checked) {
                        inputs[i].checked = false;
                    }
                }
            }
        }
       </script>
        <script>
            function ShowHideFileupload(checkbox) {
                //disable or enable button on checkbox click
                debugger
                var chkid = checkbox;
                console.log(chkid);
                var row = $(checkbox).closest("tr")[0];
                //var inputcontrol = row.cells[0].children[0];
                var labelcontrol = row.cells[2].children[0];
                if ($(checkbox).prop('checked') && labelcontrol != null) {
                    $(labelcontrol).removeAttr("disabled");
                }
                else {
                    $(labelcontrol).attr('disabled', 'disabled');
                }
            }
        </script>
    </div>
</asp:Content>

