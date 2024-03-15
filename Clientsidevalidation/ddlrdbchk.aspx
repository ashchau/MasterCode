<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="ddlrdbchk.aspx.cs" Inherits="Clientsidevalidation_ddlrdbchk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
     <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <script>
        function save() {
            debugger;
            var name = $('#ContentPlaceHolder1_txtname').val();
            var ddl1 = $('#ContentPlaceHolder1_DropDownList1 option:selected').val();
            var ddl2 =$('#ContentPlaceHolder1_DropDownList2 option:selected').val();
            var radio1 = $('#ContentPlaceHolder1_RadioButton1:checked').val();
            var radioexample=$('#<%=RadioButtonList1.ClientID %> input:checked').val()
            var radiolist =$('#ContentPlaceHolder1_RadioButtonList1 input:checked').val();
            var chk1 =$('#ContentPlaceHolder1_CheckBox1 input:checked').val();
            var chklist =$('#ContentPlaceHolder1_CheckBoxList1:checked').val();
            var names = [];
            $('#MyDiv input:checked').each(function() {
                names.push(this.name);
                alert(name);
             });
            var selected = new Array();
            $("input[type=checkbox]:checked").each(function () {
                selected.push(this.value);
            });
            if (selected.length > 0) {
                alert("Selected items: " + selected.join(","));
            }
        }
        function toggle(className, obj) {
            debugger;
            var $input = $(obj);
            if ($input.prop('checked')) $(className).show();  
            else $(className).hide();
        }
        function showhidchk() {
            $('#chkclick').click(function () {
                    if ($(this).is(':checked')) {
                        $('#div1').show();
                       }
                      else {
                        $('#div1').hide();
                    }
            })
        }
    </script>
    <script>
        // $(document).ready(function() {
       
        //     $(":checkbox").click(function (event) {
        //         if ($(this).is(":checked"))
        //             $(".myClass").show();
        //         else
        //             $(".myClass").hide();
        //     });
        //});
        
            $(function () {
                debugger;
                $('#ContentPlaceHolder1_chkclick').click(function () {
                    if ($(this).is(':checked')) {
                        $('#ContentPlaceHolder1_div1').show();
                    }
                    else {
                        $('#ContentPlaceHolder1_div1').hide();
                    }
                })
            })
        

    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            $('input[type="checkbox"]').click(function() {
                var inputValue = $(this).attr("value");
                $("." + inputValue).toggle();
            });
             $('input[type="checkbox"]').click(function() {
                var inputValue = $(this).attr("#ContentPlaceHolder1_check");
                $("." + inputValue).toggle();
            });
        });
    </script>
    <style>
        .myClass {
            color: black;
            display: none;
            margin-top: 20px;
        }
        .box {
            color: black;
            display: none;
            margin-top: 20px;
        }

        .check {
            background: #ffffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
    </div>
    <div>
        <select id="DropDownList1" name="DropDownList1" runat="server"></select>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem Selected="True" Value="0">&lt;--Select Items--&gt;</asp:ListItem>
            <asp:ListItem Value="1">Computer</asp:ListItem>
            <asp:ListItem Value="2">Mobile</asp:ListItem>
            <asp:ListItem Value="3">Electronic</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>
        <asp:RadioButton ID="RadioButton1" runat="server" Text="RadioTest" />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Selected="True" Value="0">Male</asp:ListItem>
            <asp:ListItem Value="1">Female</asp:ListItem>
            <asp:ListItem Value="2">Transant</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <div id="MyDiv">
        <asp:CheckBox ID="CheckBox1" runat="server" Text="CheckboxTest" />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem Selected="True" Value="0">Hindi</asp:ListItem>
            <asp:ListItem Value="1">English</asp:ListItem>
            <asp:ListItem Value="2">Physics</asp:ListItem>
        </asp:CheckBoxList>
    </div>
    <div>
        <hr />
        Check Box Test
        <asp:CheckBox ID="chkclick" runat="server" Text="You have any document" />
        <input type="checkbox" onclick="toggle('.myClass', this)" />
    </div>
    <div id="divaddress" runat="server" class="myClass">
        Name:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        Address:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>
    <div id="div1" runat="server" style="display:none">
        Name1:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        Address1:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" OnClientClick="return save();" />
         <button type="button" id="btnSave" onclick="return save();" class="btn btn-primary m-b-0">Save</button>
    </div>
    <div>
        <div>
        <label><input type="checkbox" name="colorCheckbox" value="check"/> Click on the check box</label>
            checkbox1:<asp:CheckBox ID="check" runat="server" />
    </div>
    <div class="check box">
        
            <fieldset>
                <legend>Personal information:</legend>
                First name:<br/>
                <input type="text" name="firstname"/>
                <br/> Last name:<br/>
                <input type="text" name="lastname"/>
                <br/><br/>
                <input type="submit" value="Submit"/>
            </fieldset>
        
    </div>
    </div>
</asp:Content>

