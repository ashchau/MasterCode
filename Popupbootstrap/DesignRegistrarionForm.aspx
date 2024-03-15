<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DesignRegistrarionForm.aspx.cs" Inherits="Popupbootstrap_DesignRegistrarionForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>CardesignForm</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /*this style for show/hide dropdown list hover the button*/
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

                .dropdown-content a:hover {
                    background-color: #f1f1f1
                }

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
    <style>
        /*how to fix the header or navbar */
        .fixhead {
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 999;
            box-shadow: 0px 0px 10px 0px;
        }

        .fixhead2 {
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 3;
            box-shadow: 0px 0px 10px 0px;
        }
        /*how to fix the size of a div */
        div.ex1 {
            width: 500px;
            margin: auto;
            border: 3px solid #73AD21;
        }

        div.ex2 {
            max-width: 500px;
            margin: auto;
            border: 3px solid #73AD21;
        }
        /* How to first letter of the text show large... */
        p::first-letter {
            color: #ff0000;
            font-size: xx-large;
        }
        /* How to color first Line of the paragraph */
        p::first-line {
            color: #0000ff;
            font-variant: small-caps;
        }
        /* How to first letter of the text show large..by using class eg.intro is a class name */
        p.intro::first-letter {
            color: #007bff;
            font-size: 200%;
        }
        /*The ::before pseudo-element can be used to insert some content before the content of an element.*/
        h3::before {
            content: url(../../images/smiley.gif);
        }
        /*The ::after pseudo-element can be used to insert some content after the content of an element.*/
        h4::after {
            content: url(../../images/smiley.gif);
        }
        /*The ::marker pseudo-element selects the markers of list items.*/
        ::marker {
            color: red;
            font-size: 23px;
        }
        /*The ::selection pseudo-element matches the portion of an element that is selected by a user. if we used without h3 then it's effect on whole page.*/
        h3::selection {
            color: red;
            background: yellow;
        }

        img {
            opacity: 0.5;
        }

            img:hover {
                opacity: 1.0;
            }
        /*ul.nav li:hover > ul.dropdown-menu {
    display: block;
}*/
        /* The navigation bar */
        .navbar {
            /*overflow: hidden;*/
            /*background-color: #e73562;*/
            /*position: fixed;*/ /* Set the navbar to fixed position */
            /*top: 0;*/ /* Position the navbar at the top of the page */
            /*width: 100%;*/ /* Full width */
        }
        /*.navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.navbar a:hover {
  background: #ddd;
  color: black;
}*/
        .main {
            padding: 16px;
            margin-top: 100px;
            height: 1500px; /* Used in this example to enable scrolling */
        }
        /*div:nth-child(3)
{
background:green;
}*/
    </style>
    <style>
        /*The text-shadow property adds shadow to text.*/
        #h3text {
            text-shadow: 5px 5px 5px red;
            text-transform: uppercase;
            transform:rotate(10deg);
        }
        #h3text {
            animation: mymove 5s infinite;
        }

        @keyframes mymove {
            50% {
                text-shadow: 10px 20px 30px blue;
            }
        }
    </style>
    <style>
        #myDIV {
            margin: auto;
            border: 1px solid black;
            width: 200px;
            height: 100px;
            background-color: coral;
            color: white;
            animation: divmove 5s infinite;
        }

        @keyframes divmove {
            50% {
                transform: rotate(360deg);
            }
        }
    </style>
    <style>
/*The transition-delay Property*/
        .textboxexpend {
            width: 300px;
            height: 50px;
            background: yellow;
            transition-property: width;
            transition-duration: 1s;
            transition-delay: 0s;
        }

            .textboxexpend:hover {
                width: 500px;
            }
    </style>
    <style>
/*user select property Note. user unable to select text from this div id */
        #h3text {
            -webkit-user-select: none; /* Safari */
            -ms-user-select: none; /* IE 10 and IE 11 */
            user-select: none; /* Standard syntax */
        }
    </style>
   <%-- <style>
        .consumer-content h4 {
    background: #ff7e00;
    border-radius: 8px 8px 0px 0px;
    text-transform: uppercase;
    color: #fff;
    font-family: 'Oswald', sans-serif;
    font-size: 1.2em;
    min-height: 24px;
    margin: 0px;
    padding: 12px;
}
.h4, h4 {
    font-size: 18px;
}
        .consumer-list {
    padding: 0 12px;
}
        .consumer-content.box-min-height {
            min-height: 348px !important;
        }

        .consumer-content {
            background: #fff;
            padding: 0px;
            margin-bottom: 22px;
            border-radius: 7px;
            min-height: 245px;
        }
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="fixhead">
            <div class="navbar">
                <%-- Use any of the .bg-color classes to change the background color of the navbar (.bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger, .bg-secondary, .bg-dark and .bg-light)--%>
                <nav class="navbar navbar-expand-sm bg-primary navbar-dark" style="width: 100%">
                    <!-- Brand -->
                    <a class="navbar-brand" href="#">Logo</a>

                    <!-- Links -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link 1</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link 2</a>
                        </li>

                        <!-- Dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Dropdown link
                            </a>
                            <div class="dropdown-menu dropdown-content">
                                <a class="dropdown-item" href="#">Link 1</a>
                                <a class="dropdown-item" href="#">Link 2</a>
                                <a class="dropdown-item" href="#">Link 3</a>
                            </div>
                        </li>
                    </ul>
                </nav>

            </div>
        </div>

        <div class="container fixhead2" style="padding-top: 60px">
            <div class="btn-group">
                <button type="button" class="btn btn-primary">Apple</button>
                <button type="button" class="btn btn-primary">Samsung</button>
                <div class="btn-group">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        Sony
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Tablet</a>
                        <a class="dropdown-item" href="#">Smartphone</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container main">
            <p>How to first letter of the text show large...How to first letter of the text show large...How to first letter of the text show large...How to first letter of the Only color effect on first line other line text are same...</p>
            <p class="intro">This is an introduction.</p>
            <div class="card">
                <div id="myDIV" style="text-align: center">
                    <h3>Welcome to the  animation World </h3>
                </div>
                <div id="h3text" style="text-align: center">
                    <h3>Text animation test</h3>
                </div>
                <div class="card-header text-center bg-primary">
                    <h3>Student Registration Form</h3>
                </div>
                <div class="card-body">
                    <div class="alert alert-success">
                        <strong>Success!</strong> Indicates a successful or positive action.
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-3">
                            <asp:Label ID="lblname" runat="server">Fname</asp:Label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control textboxexpend" autocomplete="off"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:Label ID="Label1" runat="server">Lname</asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control textboxexpend" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div>
                        <div class="ex1">
                            <asp:CheckBox ID="chkhindi" runat="server" Text="Hindi" />
                            <asp:CheckBox ID="chkenglish" runat="server" Text="English" />
                        </div>
                        <br />
                        <div class="ex2">
                            <asp:RadioButton ID="rdbmale" runat="server" Text="Male" GroupName="gender" />
                            <asp:RadioButton ID="rdbfemale" runat="server" Text="Female" GroupName="gender" />
                        </div>
                    </div>
                    <br />
                    <div class="card">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><a href="#">Cras justo odio</a></li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                    <div class="card">
                        <ul>
                            <li>Coffee</li>
                            <li>Tea</li>
                            <li>Milk</li>
                        </ul>
                        <ol>
                            <li>First</li>
                            <li>Second</li>
                            <li>Third</li>
                        </ol>
                    </div>
                    <div>
                        <h1>The colgroup element</h1>

                        <table>
                            <colgroup>
                                <%--<col span="2" style="background-color: red" />--%>
                                <col span="1" style="background-color: red" />
                                <col span="1" style="background-color: pink" />
                                <col style="background-color: yellow" />
                            </colgroup>
                            <tr>
                                <th>ISBN</th>
                                <th>Title</th>
                                <th>Price</th>
                            </tr>
                            <tr>
                                <td>3476896</td>
                                <td>My first HTML</td>
                                <td>$53</td>
                            </tr>
                            <tr>
                                <td>5869207</td>
                                <td>My first CSS</td>
                                <td>$49</td>
                            </tr>
                        </table>
                    </div>
                    <div class="text-center">
                        <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-primary" />
                        <asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="btn btn-info" />
                        <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-success" />
                        <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-danger" />
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-3">
                            <iframe width="250" height="315" src="https://www.youtube.com/embed/tgbNymZ7vqY"></iframe>
                        </div>
                        <div class="col-md-3">
                            <iframe width="250" height="315" src="https://www.youtube.com/embed/tgbNymZ7vqY?autoplay=1&mute=1"></iframe>
                            <%--YouTube - Autoplay + Muted--%>
                        </div>
                        <div class="col-md-3">
                            <iframe width="250" height="315" src="https://www.youtube.com/embed/tgbNymZ7vqY?playlist=tgbNymZ7vqY&loop=1"></iframe>
                            <%-- YouTube - Loop--%>
                        </div>
                        <div class="col-md-3">
                            <iframe width="250" height="315" src="https://www.youtube.com/embed/tgbNymZ7vqY?controls=0"></iframe>
                            <%--YouTube - Controls--%>
                        </div>

                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-3">
                            <%-- Note: Chromium browsers do not allow autoplay in most cases. However, muted autoplay is always allowed.--%>
                            <video width="250" height="315" autoplay="autoplay" muted="muted">
                                <source src="https://www.w3schools.com/html/movie.mp4" type="video/mp4" />
                                <source src="movie.ogg" type="video/ogg" />
                            </video>
                        </div>
                        <div class="col-md-3">
                            <video width="250" height="315" autoplay="autoplay" controls="controls">
                                <source src="https://www.w3schools.com/html/movie.mp4" type="video/mp4" />
                                <source src="movie.ogg" type="video/ogg" />
                            </video>
                        </div>
                        <div class="col-md-3">
                            <video width="250" height="315" controls="controls">
                                <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4" />
                                <source src="movie.ogg" type="video/ogg" />
                            </video>
                        </div>
                        <div class="col-md-3">
                            <audio controls="controls" autoplay="autoplay" muted="muted">
                                <source src="https://www.w3schools.com/html/horse.ogg" type="audio/ogg" />
                                <source src="horse.mp3" type="audio/mpeg" />
                                Your browser does not support the audio element.
                            </audio>
                        </div>
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-4">
                            <img src="../../images/img_forest.jpg" alt="Forest" width="170" height="100" /></div>
                        <div class="col-md-4">
                            <img src="../../images/img_mountains.jpg" alt="Mountains" width="170" height="100" /></div>
                        <div class="col-md-4">
                            <img src="../../images/img_5terre.jpg" alt="Italy" width="170" height="100" /></div>
                    </div>
                </div>
                <div class="card-footer bg-warning text-center">
                    <div>
                        <h4>@Coppy Rights -2022</h4>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
