<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Practice </title>

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />
    <%--<script type="text/javascript">  on page load this event fire
                    window.onload = function () {
                       
                        swal({
                            title: "Alert Message Title",
                            text: "Email has been sent successfully.",
                            //text:"@TempData["msg"]",
                            type: 'info',
                            showCancelButtonClass: "btn-primary",
                            confirmButtonText: 'ok'
                        });
                    };

                </script>--%>
   <%-- <script type="text/javascript">  on button click this popup open
    $(document).ready(function () {
        $("#btnlogin").click(function () {
            //swal("email sent");
            swal({
                title: "Alert Message Title",
                text: "Email has been sent successfully.",
                type: 'info',
                showCancelButtonClass: "btn-primary",
                confirmButtonText: 'ok'
            });
        })
    })
</script>--%>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            user-select: none;
        }

        .bg-img {
            background: url('bg.jpg');
            height: 100vh;
            background-size: cover;
            background-position: center;
        }

            .bg-img:after {
                position: absolute;
                content: '';
                top: 0;
                left: 0;
                height: 100%;
                width: 100%;
                background: rgba(0,0,0,0.7);
            }

        .content {
            position: absolute;
            top: 50%;
            left: 50%;
            z-index: 999;
            text-align: center;
            padding: 60px 32px;
            width: 370px;
            transform: translate(-50%,-50%);
            background: rgba(255,255,255,0.04);
            box-shadow: -1px 4px 28px 0px rgba(0,0,0,0.75);
        }
            .content header {
                color: white;
                font-size: 33px;
                font-weight: 600;
                margin: 0 0 35px 0;
                font-family: 'Montserrat',sans-serif;
            }

        .field {
            position: relative;
            height: 45px;
            width: 100%;
            display: flex;
            background: rgba(255,255,255,0.94);
        }

            .field span {
                color: #222;
                width: 40px;
                line-height: 45px;
            }

            .field input {
                height: 100%;
                width: 100%;
                background: transparent;
                border: none;
                outline: none;
                color: #222;
                font-size: 16px;
                font-family: 'Poppins',sans-serif;
            }

        .space {
            margin-top: 16px;
        }

        .show {
            position: absolute;
            right: 13px;
            font-size: 13px;
            font-weight: 700;
            color: #222;
            display: none;
            cursor: pointer;
            font-family: 'Montserrat',sans-serif;
        }

        .pass-key:valid ~ .show {
            display: block;
        }

        .pass {
            text-align: left;
            margin: 10px 0;
        }

            .pass a {
                color: white;
                text-decoration: none;
                font-family: 'Poppins',sans-serif;
            }

            .pass:hover a {
                text-decoration: underline;
            }

        .field input[type="submit"] {
            background: #3498db;
            border: 1px solid #2691d9;
            color: white;
            font-size: 18px;
            letter-spacing: 1px;
            font-weight: 600;
            cursor: pointer;
            font-family: 'Montserrat',sans-serif;
        }

            .field input[type="submit"]:hover {
                background: #2691d9;
            }

        .login {
            color: white;
            margin: 20px 0;
            font-family: 'Poppins',sans-serif;
        }

        .links {
            display: flex;
            cursor: pointer;
            color: white;
            margin: 0 0 20px 0;
        }

        .facebook, .instagram {
            width: 100%;
            height: 45px;
            line-height: 45px;
            margin-left: 10px;
        }

        .facebook {
            margin-left: 0;
            background: #4267B2;
            border: 1px solid #3e61a8;
        }

        .instagram {
            background: #E1306C;
            border: 1px solid #df2060;
        }

        .facebook:hover {
            background: #3e61a8;
        }

        .instagram:hover {
            background: #df2060;
        }

        .links i {
            font-size: 17px;
        }

        i span {
            margin-left: 8px;
            font-weight: 500;
            letter-spacing: 1px;
            font-size: 16px;
            font-family: 'Poppins',sans-serif;
        }

        .signup {
            font-size: 15px;
            color: white;
            font-family: 'Poppins',sans-serif;
        }

            .signup a {
                color: #3498db;
                text-decoration: none;
            }

                .signup a:hover {
                    text-decoration: underline;
                }
    </style>
    
    <style type="text/css">
        .fixhead {
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 999;
            box-shadow: 0px 0px 10px 0px;
        }
        </style>
     <script>
            const pass_field = document.querySelector('.pass-key');
            const showBtn = document.querySelector('.show');
            showBtn.addEventListener('click', function () {
                if (pass_field.type === "password") {
                    pass_field.type = "text";
                    showBtn.textContent = "HIDE";
                    showBtn.style.color = "#3498db";
                } else {
                    pass_field.type = "password";
                    showBtn.textContent = "SHOW";
                    showBtn.style.color = "#222";
                }
            });
        </script>
     <script>
        $(document).ready(function () {
            $("#showHide").on('click', function (event) {
                event.preventDefault();
                if ($('#txt_password').attr("type") == "text") {
                    $('#txt_password').attr('type', 'password');
                    $('#showHide i').addClass("fa-eye-slash");
                    $('#showHide i').removeClass("fa-eye");
                } else if ($('#txt_password').attr("type") == "password") {
                    $('#txt_password').attr('type', 'text');
                    $('#showHide i').removeClass("fa-eye-slash");
                    $('#showHide i').addClass("fa-eye");
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container fixhead" id="fixhead">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4">
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">About</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-img">
            <div class="content">
                <header>Login Form</header>

                <div class="field">
                    <span class="fa fa-user"></span>
                    <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"  placeholder="Email"></asp:TextBox>
                   <%-- <input type="text" id="txtusername" placeholder="Email" runat="server" />--%>
                </div>
                <div class="field space">
                    <span class="fa fa-lock"></span>
                     <asp:TextBox ID="txtpassword" runat="server" class="pass-key" CssClass="form-control" TextMode="Password"  placeholder="Password"></asp:TextBox>
                    <%-- <input type="password" id="" class="pass-key" placeholder="Password" runat="server" />--%>
                    <%--<input type="password" id="txt_password" class="pass-key" placeholder="Password" runat="server" />--%>
                    <span class="show">SHOW</span>
                </div>
                <div class="pass">
                    <a href="#">Forgot Password?</a>
                </div>
                <div class="field">

                    <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-success" OnClick="btnlogin_Click" />
                </div>

                <div class="login">Or login with</div>
                <div class="links">
                    <div class="facebook">
                        <i class="fab fa-facebook-f"><span>Facebook</span></i>
                    </div>
                    <div class="instagram">
                        <i class="fab fa-instagram"><span>Instagram</span></i>
                    </div>
                </div>
                <div class="signup">
                    Don't have account?
          <a href="#">Signup Now</a>
                </div>
            </div>
        </div>
           <div class="container">
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <h3>This is Panel Heading</h3>
                        <br />
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-1">
                                <asp:Label ID="lblusername" runat="server" Text="User Name"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_username" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-md-1">
                                <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:TextBox ID="txt_password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                             <div class="col-1">
                                     <asp:LinkButton runat="server" ID="showHide"><i class="fa fa-lg fa-eye" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" aria-hidden="true"></i></asp:LinkButton>
                                </div>
                            <div class="col-md-2">
                                <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <asp:Label ID="lblIPAddress" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="lblIPAdd" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
