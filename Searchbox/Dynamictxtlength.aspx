<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dynamictxtlength.aspx.cs" Inherits="Searchbox_Dynamictxtlength" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/jquery.maxlength.min.js"></script>
    <style>
        .required::after {
            content: "*";
            font-weight: bold;
            color: red;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#rdamount').click(function () {
                $('#txtamount').css("display", "block");
                $('#txtper').css("display", "none");
                $('#txtper').val('');
            });
            $('#rdpercentage').click(function () {
                $('#txtamount').css("display", "none");
                $('#txtper').css("display", "block");
                $('#txtamount').val('');
            });
            $("#txtper").keyup(function () {
                $("#txtper").css("background-color", "pink");
                var per = $('#txtper').val();
                if (per > 100) {
                    $('#txtper').focus();
                    $('#txtper').val('');
                    alert("percentage less than 100");
                }
            });
            $("#TextBox1").keyup(function () {
                $("#TextBox1").css("background-color", "pink");
                var per = $('#TextBox1').val();
                if ($("#rdb2").prop("checked")) {

                    if (per > 100) {
                        $('#TextBox1').focus();
                        $('#TextBox1').val('');
                        alert("percentage less than 100");
                    };
                }
            });
            //below script for enter only numeric values under this .numbers class
            $('.numbers').keyup(function () {
                this.value = this.value.replace(/[^0-9\.]/g, '');
            });
        });

    </script>
    <script type="text/javascript">
        //$("document").ready(function () {
        //    $(function () {

        //        $("#txtamount").maxLength({

        //            maxChars: 10

        //        });

        //    });
        //});
    </script>
    <script type="text/javascript">
    //$(function () {
    //    $("input[name='rdamount']").click(function () {
    //        if ($("#rdamount").is(":checked")) {
    //            $("#txtamount").removeAttr("disabled");
    //            $("#txtamount").focus();
    //            $("#txtamt").attr({
    //                "max": 3,        // substitute your own
    //                "min": 2          // values (or variables) here
    //            });
    //        } else {
    //            $("#txtamount").attr("disabled", "disabled");
    //        }
    //    });
    //});
</script>
    <%--<script>
        $(document).ready(function () {
            $("#checkbox_div input:radio:first").click(function () {

                $(function () {

                    $("#txtamount").maxLength({

                        maxChars: 10

                    });

                });

            });

            //$("input:radio:first").prop("checked", true).trigger("click");

        });
    </script>--%>
    <script>
        //$(document).ready(function () {
        //    $("#rdamount").click(function () {
        //        $(function () {

        //            $("#txtamount").maxLength({

        //                maxChars: 10

        //            });

        //        });

        //    });

        //    //$("input:radio:first").prop("checked", true).trigger("click");

        //});
    </script>
    <%-- <script>
        $(document).ready(function () {
            $("#rdpercentage").click(function () {
               $(function () {
                
                $("#txtamount").maxLength({

                    maxChars: 5

                });

            });

            });

            //$("input:radio:first").prop("checked", true).trigger("click");

        });
    </script>--%>
    <script>
        //$(document).ready(function () {
        //    $('#rdamount').on('change', function () {

        //        $(function () {

        //            $("#txtamount").maxLength({

        //                maxChars: 5

        //            });
        //        });
        //    })

        //});
    </script>
    <script>
        //https://stackoverflow.com/questions/25489902/how-can-i-set-maxlength-of-textbox-according-to-radio-button-list-in-js
        function ValidateCCN() {
            var x = document.getElementById('rdb1');
            var y = document.getElementById('TextBox1');
            document.getElementById("TextBox1").value = "";
            $("#lblAmtPer").html("Amount<b class='required' id='bshowStar1' style='display: block'></b>");
            if (x.selectedIndex = "0") { y.maxLength = '9'; }
            //else
            //    { y.maxLength = '2';}
        }
        function ValidateCCN1() {
            var x = document.getElementById('rdb2');
            var y = document.getElementById("TextBox1");
             document.getElementById("TextBox1").value = "";
             $("#lblAmtPer").html("percentage%<b class='required' id='bshowStar1' style='display: block'>*</b>");
            if (x.selectedIndex = "0") { y.maxLength = '5'; }
        }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            debugger;
        $('.Money1').blur(function (e) {
            try {
                var id = ('#' + this.id);
                $(id).popover('destroy');
            } catch (e) { }
        });
        $('.Money1').keypress(function (e) {
            try {
                var id = ('#' + this.id);
                var val = $(id).val();
                var chCode = (e.charCode === undefined) ? e.keyCode : e.charCode;
                var id = ('#' + this.id);


                if (chCode != 46) {
                    if (chCode > 31 && (chCode < 48 || chCode > 57)) {
                        PopOverError(id, 'top', 'Enter Valid Amount');
                        return false; //Non Numeric Value Return Directly;
                    }
                }
                debugger;
                if (val.indexOf(".") != -1 && val.indexOf(".") + 3 == val.length && event.keyCode != 8 && event.keyCode != 17 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 46 && event.keyCode != 9) {
                    PopOverError(id, 'top', 'This Allow Only Amount Ex-1000.20');
                    event.preventDefault();
                    return false;
                }
                debugger;
                if (event.keyCode == 46 && val == "") {
                    PopOverError(id, 'top', 'This Allow Only Amount Ex-1000.20');
                    event.preventDefault();
                    return false;
                }
                if (val.split(".").length > 1 && event.keyCode == 46) {
                    PopOverError(id, 'top', 'This Allow Only Amount Ex-1000.20');
                    event.preventDefault();
                    return false;
                }
                $(id).popover('destroy');
            } catch (e) {

            }
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input id="txtamount" type="text" runat="server" style="display:none" class="numbers" maxlength="9" />
            <input id="txtper" type="text" runat="server" style="display:none" class="numbers" maxlength="5" />
        </div>
        <div id="checkbox_div">
            <asp:RadioButton ID="rdamount" runat="server" GroupName="amount" Text="Amount" />
            <asp:RadioButton ID="rdpercentage" runat="server" GroupName="amount" Text="Percentage"/>
        </div>
        <div>
            <label id="lblAmtPer"></label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="numbers"></asp:TextBox>
           <%-- <asp:RadioButton ID="rdb1" runat="server" GroupName="rd"  />
            <asp:RadioButton ID="rdb2" runat="server" GroupName="rd" />--%>
            
            amount<input type="radio" id="rdb1" name="rd" onchange="ValidateCCN()" />
            per<input type="radio" id="rdb2" name="rd" onchange="ValidateCCN1()" />
        </div>
        <div>
            Mony<asp:TextBox ID="TextBox2" runat="server" CssClass="Money1" TextMode="Number"></asp:TextBox>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" CssClass="grid" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="empid" HeaderText="ID" />
                    <asp:BoundField DataField="empname" HeaderText="Name" />
                    <asp:BoundField DataField="salary" HeaderText="Salary" />
                    <asp:BoundField DataField="mobile" HeaderText="Mobile" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
