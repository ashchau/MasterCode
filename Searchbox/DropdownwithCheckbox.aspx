<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropdownwithCheckbox.aspx.cs" Inherits="Searchbox_DropdownwithCheckbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/Checkbox_Script/jquery.sumoselect.min.js"></script>
    <link href="../Scripts/Checkbox_Script/sumoselect.min.css" rel="stylesheet" />
   <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.css" rel="stylesheet" />--%>
   <%-- <link href="<%= ResolveUrl("~/Content/assets/Script/chosenCss/chosen.css") %>" rel="stylesheet" />--%>
    <script src="../Scripts/Chosen_script/chosen.jquery.js"></script>
    <link href="../Scripts/Chosen_script/chosen.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(<%=lstFruits.ClientID%>).SumoSelect({ selectAll: true });
           <%-- $(<%=lstFruits.ClientID%>).SumoSelect({ selectAll: true , okCancelInMulti: true });--%>
            //okCancelInMulti: true for showingh ok and cancel button on ddl and selectAll: true forshowing selectall
        });
    </script>
    <script>
        //https://davidwalsh.name/jquery-chosen
        $(document).ready(function () {
            $(".chosen").chosen({
                no_results_text: "Record not found :",
                placeholder_text: "Select name",
                search_contains: true,
                disable_search_threshold: 10
            });
        })
    </script>
    <%--Below code  is also work http://dotnetqueries.com/Article/151/how-to-implement-chosen-plugin-with-example --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.chosen-select').chosen();
        });
    </script>
    <style>
        .chosen-container-single .chosen-single {
            height: 40px;
            border: 1px solid #53d120;
            line-height: 35px;
            width:330px;
        }
        .SumoSelect.sumo_lstFruits {
            width: 330px;
        }
    </style>
    <style>
        body {
            color: #000;
            overflow-x: hidden;
            height: 100%;
            background-image: url("https://i.imgur.com/GMmCQHC.png");
            background-repeat: no-repeat;
            background-size: 100% 100%
        }

        .card {
            padding: 30px 40px;
            margin-top: 60px;
            margin-bottom: 60px;
            border: none !important;
            box-shadow: 0 6px 12px 0 rgba(0,0,0,0.2)
        }

        .blue-text {
            color: #00BCD4
        }

        .form-control-label {
            margin-bottom: 0
        }

        input, textarea, button {
            padding: 8px 15px;
            border-radius: 5px !important;
            margin: 5px 0px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            font-size: 18px !important;
            font-weight: 300
        }

            input:focus, textarea:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #00BCD4;
                outline-width: 0;
                font-weight: 400
            }

        .btn-block {
            text-transform: uppercase;
            font-size: 15px !important;
            font-weight: 400;
            height: 43px;
            cursor: pointer
        }

            .btn-block:hover {
                color: #fff !important
            }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0
        }
    </style>
    <script>
        function validatetexbox(evt) {
            myflag = true;
            var vid = document.getElementById(evt.id);
            if (vid.value == "") {
                vid.style.borderColor = "red";
                myflag = false;
            }
            else {
                vid.style.borderColor = "green";
                myflag = true;
            }
            return myflag;
        }
        function validate(val) {
            v1 = document.getElementById("fname");
            v2 = document.getElementById("lname");
            v3 = document.getElementById("email");
            v4 = document.getElementById("mob");
            v5 = document.getElementById("job");
            v6 = document.getElementById("ans");

            flag1 = true;
            flag2 = true;
            flag3 = true;
            flag4 = true;
            flag5 = true;
            flag6 = true;

            if (val >= 1 || val == 0) {
                if (v1.value == "") {
                    v1.style.borderColor = "red";
                    flag1 = false;
                }
                else {
                    v1.style.borderColor = "green";
                    flag1 = true;
                }
            }

            if (val >= 2 || val == 0) {
                if (v2.value == "") {
                    v2.style.borderColor = "red";
                    flag2 = false;
                }
                else {
                    v2.style.borderColor = "green";
                    flag2 = true;
                }
            }
            if (val >= 3 || val == 0) {
                if (v3.value == "") {
                    v3.style.borderColor = "red";
                    flag3 = false;
                }
                else {
                    v3.style.borderColor = "green";
                    flag3 = true;
                }
            }
            if (val >= 4 || val == 0) {
                if (v4.value == "") {
                    v4.style.borderColor = "red";
                    flag4 = false;
                }
                else {
                    v4.style.borderColor = "green";
                    flag4 = true;
                }
            }
            if (val >= 5 || val == 0) {
                if (v5.value == "") {
                    v5.style.borderColor = "red";
                    flag5 = false;
                }
                else {
                    v5.style.borderColor = "green";
                    flag5 = true;
                }
            }
            if (val >= 6 || val == 0) {
                if (v6.value == "") {
                    v6.style.borderColor = "red";
                    flag6 = false;
                }
                else {
                    v6.style.borderColor = "green";
                    flag6 = true;
                }
            }

            flag = flag1 && flag2 && flag3 && flag4 && flag5 && flag6;

            return flag;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" class="form-card">
        <%--onsubmit="event.preventDefault()"   --%>
        <div class="col-md-12 d-flex justify-content-center">
            <div class="col-md-3">
                <label>Used SumoSelect for Checkbox List</label>
                <asp:ListBox ID="lstFruits" runat="server" SelectionMode="Multiple" CssClass="form-control">
                    <%--<asp:ListItem Text="Mango" Value="1" />
                    <asp:ListItem Text="Apple" Value="2" />
                    <asp:ListItem Text="Banana" Value="3" />
                    <asp:ListItem Text="Guava" Value="4" />
                    <asp:ListItem Text="Orange" Value="5" />--%>
                </asp:ListBox>
            </div>
            <div class="col-md-3">
                 <label>Used Choosen js for select</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control chosen-select"></asp:DropDownList>
            </div>
             <div class="col-md-3">
                <label>Used Choosen js for select</label> <%--for chosen bind first index is zero is mandatory eg. <--select emp name--> --%>
                <asp:DropDownList ID="ddlchoosen" runat="server" CssClass="form-control chosen"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:Button ID="save" Text="Submit" runat="server" CssClass="btn btn-info" OnClick="save_Click" />
                <asp:Button ID="btnbulksave" Text="Submit New" runat="server" CssClass="btn btn-info" OnClick="btnbulksave_Click" />
                <asp:Button ID="btnsavestring" runat="server" Text="Search by Group of String value" CssClass="btn btn-warning" OnClick="btnsavestring_Click" />
                Selected List ID :-
                    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-info  mt-4"></asp:GridView>
            </div>
        </div>
        <div class="container-fluid px-1 py-5 mx-auto">
            <div class="row d-flex justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                    <h3>Request a Demo</h3>
                    <p class="blue-text">Just answer a few questions<br />
                        so that we can personalize the right experience for you.</p>
                    <div class="card">
                        <h5 class="text-center mb-4">Powering world-class companies</h5>
                        <div class="form-card">
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">First name<span class="text-danger"> *</span></label>
                                    <input type="text" id="fname" name="fname" placeholder="Enter your first name" onblur="validate(1)" />
                                </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Last name<span class="text-danger"> *</span></label>
                                    <input type="text" id="lname" name="lname" placeholder="Enter your last name" onblur="validate(2)" />
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Business email<span class="text-danger"> *</span></label>
                                    <input type="text" id="email" name="email" placeholder="" onblur="validate(3)" />
                                </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Phone number<span class="text-danger"> *</span></label>
                                    <input type="text" id="mob" name="mob" placeholder="" onblur="validate(4)" />
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Job title<span class="text-danger"> *</span></label>
                                    <input type="text" id="job" name="job" placeholder="" onblur="validate(5)" />
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-12 flex-column d-flex">
                                    <label class="form-control-label px-3">What would you be using Flinks for?<span class="text-danger"> *</span></label>
                                    <input type="text" id="ans" name="ans" placeholder="" onblur="validate(6)" />
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-12 flex-column d-flex">
                                    <label class="form-control-label px-3">My Code use validation by single function<span class="text-danger"> *</span></label>
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">First name<span class="text-danger"> *</span></label>
                                    <input type="text" id="t1" name="t1" placeholder="Enter your first name" onblur="validatetexbox(this)" />
                                </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Last name<span class="text-danger"> *</span></label>
                                    <input type="text" id="t2" name="t2" placeholder="Enter your last name" onblur="validatetexbox(this)" />
                                </div>
                            </div>
                            <div class="row justify-content-between text-left">
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Business email<span class="text-danger"> *</span></label>
                                    <input type="text" id="t3" name="t3" placeholder="" onblur="validatetexbox(this)" />
                                </div>
                                <div class="form-group col-sm-6 flex-column d-flex">
                                    <label class="form-control-label px-3">Phone number<span class="text-danger"> *</span></label>
                                    <input type="text" id="t4" name="t4" placeholder="" onblur="validatetexbox(this)" />
                                </div>
                            </div>
                            <div class="row justify-content-end">
                                <div class="form-group col-sm-6">
                                    <button type="button" class="btn-block btn-primary">Request a demo</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
