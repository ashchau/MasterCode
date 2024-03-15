<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menubar.aspx.cs" Inherits="Login_Menubar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .fixhead {
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 999;
    box-shadow: 0px 0px 10px 0px;
}
        #menuid {
            background-color: green;
            /*position:fixed;
            width:100%*/
        }

            div a {
                text-decoration: none;
                color: white;
                font-size: 20px;
                padding: 15px;
                display: inline-block;
            }

        ul {
            display: inline;
            margin: 0;
            padding: 0;
        }

            ul li {
                display: inline-block;
            }

                ul li:hover {
                    background: #555;
                }

                    ul li:hover ul {
                        display: block;
                    }

                ul li ul {
                    position: absolute;
                    width: 200px;
                    display: none;
                }

                    ul li ul li {
                        background: #555;
                        display: block;
                    }

                        ul li ul li a {
                            display: block !important;
                        }

                        ul li ul li:hover {
                            background: #666;
                        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <div id="menuid" class="fixhead">
                <a href="#">Useless Link</a>
                <ul>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Link</a>
                        <ul class="dropdown-menu">
                            <li class="dropdown"><a href="#">Link 1</a></li>
                            <li class="dropdown"><a href="#">Link 2</a></li>
                            <li class="dropdown"><a href="#">Link 3</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container" style="padding:30px">
            <div class="card">
                <div class="card-header bg-primary">
                    <h3>Student Registration Form</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                        </div>
                        <div>
                            <p>
                                Definition and Usage
The :hover selector is used to select elements when you mouse over them.

Tip: The :hover selector can be used on all elements, not only on links.

Tip: Use the :link selector to style links to unvisited pages, the :visited selector to style links to visited pages, and the :active selector to style the active link.

Note: :hover MUST come after :link and :visited (if they are present) in the CSS definition, in order to be effective
                                Definition and Usage
The :hover selector is used to select elements when you mouse over them.

Tip: The :hover selector can be used on all elements, not only on links.

Tip: Use the :link selector to style links to unvisited pages, the :visited selector to style links to visited pages, and the :active selector to style the active link.

Note: :hover MUST come after :link and :visited (if they are present) in the CSS definition, in order to be effectiveDefinition and Usage
The :hover selector is used to select elements when you mouse over them.

Tip: The :hover selector can be used on all elements, not only on links.

Tip: Use the :link selector to style links to unvisited pages, the :visited selector to style links to visited pages, and the :active selector to style the active link.

Note: :hover MUST come after :link and :visited (if they are present) in the CSS definition, in order to be effective
                                                                Definition and Usage
The :hover selector is used to select elements when you mouse over them.

Tip: The :hover selector can be used on all elements, not only on links.

Tip: Use the :link selector to style links to unvisited pages, the :visited selector to style links to visited pages, and the :active selector to style the active link.

Note: :hover MUST come after :link and :visited (if they are present) in the CSS definition, in order to be effective
                                Definition and Usage
The :hover selector is used to select elements when you mouse over them.

Tip: The :hover selector can be used on all elements, not only on links.

Tip: Use the :link selector to style links to unvisited pages, the :visited selector to style links to visited pages, and the :active selector to style the active link.

Note: :hover MUST come after :link and :visited (if they are present) in the CSS definition, in order to be effectiveDefinition and Usage
The :hover selector is used to select elements when you mouse over them.

Tip: The :hover selector can be used on all elements, not only on links.

Tip: Use the :link selector to style links to unvisited pages, the :visited selector to style links to visited pages, and the :active selector to style the active link.

Note: :hover MUST come after :link and :visited (if they are present) in the CSS definition, in order to be effective
                            </p>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-info">
                    <div class="text-center">
                        <h3>Coppy Rights 2022..</h3>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
