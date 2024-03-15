<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fileupload.aspx.cs" Inherits="Fileupload" Trace="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File Upload</title>
   <%-- <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .bg-success {
            background-color: #ffc107 !important;
        }
        th {
    text-align: left;
    width: 100px;
}
        td, th {
    padding: 1px;
}
    </style>
<!--This style use for list align horizontal (div list)-->
    <style>
        .table {
            display: table; /* Allow the centering to work */
            margin: 0 auto;
        }

        ul#horizontal-list {
            min-width: 696px;
            list-style: none;
            padding-top: 20px;
        }

            ul#horizontal-list li {
                display: inline;
            }
    </style>
    <script>
        $(document).ready(function () {
            $("#OnloadMOdal").modal('show');

            // Highlight table rows appearing at Odd places
            $("#GridView1 tr:odd").css("background", "yellow");
            // Highlight table rows appearing at even places
            $("#GridView1 tr:even").css("background", "orange");mytable
            //all textbox background color is pink
             $("form :text").css("background", "pink"); 
        })
    </script>
    <%--jQuery Shorthand Syntax work as document.ready ()--%>
    <script>
		$(function(){
			// Highlight table rows appearing at Odd places
            $("#mytable tr:odd").css("background", "Pink");
            // Highlight table rows appearing at even places
            $("#mytable tr:even").css("background", "#cddc39");
			//Event on page click 
            $("p").click(function () {
                $(this).slideUp();
            });
		});
    </script>
    <style>
         /*Modal onload page Style*/
        .modal-header {
            background: #931b2f;
            text-align: center;
        }

        .modal-title {
            color: #ffffff;
            font-weight: 600;
            text-align: center;
        }

        .modal-header .close {
            margin-top: -2px;
            color: #ffffff;
            opacity: 1;
            font-size: 30px;
            transform: rotate(0deg);
            -webkit-transition: .15s linear;
            -o-transition: .15s linear;
            transition: .15s linear;
        }

            .modal-header .close:hover {
                transform: rotate(90deg);
                -webkit-transition: .15s linear;
                -o-transition: .15s linear;
                transition: .15s linear;
            }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
         <!-- Modal onload page Start --->
        <div class="modal fade" id="OnloadMOdal" tabindex="-1" role="dialog" aria-labelledby="OnloadMOdal" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">मेरा शहर मेरी पहचान</h4>
                    </div>
                    <div class="modal-body">
                        <img src="../images/Ashok.png" class="img-responsive" alt="मेरा शहर मेरी पहचान" />
                    </div>
                </div>
            </div>
        </div>
         <!-- Modal onload page End --->
        <div class="container">
            <div class="panel-success">
                <div class="panel-body panel-heading">
                    <h3 style="text-align:center">File Upload Operation</h3>
                    <h3>
                        <asp:Label ID="lblusername" runat="server" Text="Label"></asp:Label></h3>
                    <div class="row" id="rowdiv1">
                        <div class="col-md-2">
                            <asp:Label ID="lblfruitename" runat="server" Text="Label"></asp:Label>
                            <asp:Image ID="imgfruite" runat="server" Width="80px" Height="80px" />
                        </div>
                    </div>
                    <div id="table">
                        <h1>Go Cursor on particular div when you click</h1>
                        <ul id="horizontal-list" ><%--style="list-style-type:circle;" add this property circle list but we need to remove horizontale property--%>
                            <li><a href="#rowdiv1">Div1 |</a></li> 
                            <li><a href="#rowdiv2">Div2 |</a></li> 
                            <li><a href="#rowdiv3">Div3 |</a></li> 
                            <li><a href="#rowdiv4">Div4 |</a></li> 
                            <li><a href="#rowdiv5">Div5 |</a></li>  
                            <li><a href="#rowdiv6">Div6 |</a></li> 
                            <li><a href="#rowdiv7">Div7 |</a></li>
                            <li><a href="UI/Dynamic/MstPdf.aspx?Pageid=31" class="removeunderline">ByLaws/Notification</a></li>
                        </ul>
                        <ul>
                             <li><a data-toggle="collapse" href="#Organization" role="button" aria-expanded="false" aria-controls="Organization">Organization Chart <i class="fa fa-chevron-circle-down"></i></a>
                                <ul class="collapse" id="Organization">
                                    <li><a href="UI/Static/orgchart.aspx?pageid=1">Accounts Section</a></li>
                                    <li><a href="UI/Static/orgchart.aspx?pageid=2">Engineering Section</a></li>
                                    <li><a href="UI/Static/orgchart.aspx?pageid=13">Health Section</a></li>
                                    <li><a href="UI/Static/orgchart.aspx?pageid=14">Law Section</a></li>
                                    <li><a href="UI/Static/orgchart.aspx?pageid=15">Stray Animal Section </a></li>
                                    <li><a href="UI/Static/orgchart.aspx?pageid=16">Revenue Section</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div> 
                <div class="panel-body bg-success">
                  <%--  below div start--%>
                    <div class="row" id="rowdiv2">
                        <div class="col-md-2">
                            <asp:Label ID="lblname" runat="server" Text="Name"></asp:Label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Label ID="Label1" runat="server" Text="File Upload"></asp:Label>
                            <asp:Label ID="lblsize" runat="server"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                            <%--<asp:CustomValidator ID="CustomValidator1" OnServerValidate="ValidateFileSize" ForeColor="Red" runat="server" />--%>
                        </div>
                        <div class="col-md-2">
                            <asp:Label ID="lblmsg" runat="server" Text="File Uploaded" Visible="false"></asp:Label>
                            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px"/>
                        </div>
                    </div>
                    <%--  above div End--%>
                    <div class="row" id="rowdiv3">
                        <div class="col-md-2">
                            <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="btnupload_Click" />
                        </div>
                    </div>
                   <div class="row" id="rowdiv4">
                       <div class="col-md-2">
                            <asp:Label ID="lblproname" runat="server" Text="Product Name"></asp:Label>
                            <asp:TextBox ID="txtproname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Label ID="lblprice" runat="server" Text="Product Price"></asp:Label>
                            <asp:TextBox ID="txtprice" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Label ID="lblimgupload" runat="server" Text="Image Upload"></asp:Label>
                             <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                            <asp:Image ID="Image2" runat="server" Width="100px" Height="100px" />
                            Product id :<asp:TextBox ID="txtid" runat="server"></asp:TextBox><asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                   </div>
                    <div class="row" id="rowdiv5">
                        <div class="col-md-2">
                            <asp:Button ID="btnimgupload" runat="server" Text="Insert" CssClass="btn btn-success" OnClick="btnimgupload_Click"/>&nbsp&nbsp&nbsp
                             <asp:Button ID="btnshowimg" runat="server" Text="Show Data" CssClass="btn btn-success" OnClick="btnshowimg_Click"/>&nbsp&nbsp&nbsp
                            <asp:Button ID="btnshow" runat="server" Text="product Details" CssClass="btn btn-success" OnClick="btnshow_Click" />&nbsp&nbsp&nbsp
                            <asp:Button ID="btnupdateimg" runat="server" Text="Update Image" CssClass="btn btn-success" OnClick="btnupdateimg_Click" />
                        </div>
                        <div  ><%--style="height:200px; overflow:auto; width:300px"--%>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowEditing="GridView1_RowEditing" OnRowDataBound="GridView1_RowDataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit" >
                    <Columns>
                         <asp:TemplateField HeaderText="Sn.">
                            <ItemTemplate>
                                <asp:Label ID="lblsn" runat="server" Text='<%# Bind("prod_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prod Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                         <asp:TemplateField HeaderText="Prod bind Name">
                            <ItemTemplate>
                                <%# Eval("prod_name")%>
                               <%-- <asp:Label ID="lblpname" runat="server" Text='<%# Bind("prod_name") %>'></asp:Label>--%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="cmbChargE"  runat="server" >
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbChargF" runat="server" >
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>




                        <asp:TemplateField HeaderText="Prod Price">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("prod_price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <a href='<%# Eval("prod_imgpath") %>'> <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("prod_imgpath") %>' Height="50PX" Width="50PX" /></a>
                                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Bind("prod_imgpath") %>'>Download IMG</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                        </div>
                        <div>
                            <asp:Repeater runat="server" ID="NewsData">
                                        <ItemTemplate>
                                            <div class="item">
                                                <a href='<%# "PDF/"+Eval("pdfname") %>' class="group1"><%# Eval("name") %></a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                        </div>
                    </div>
                    <div class="row" id="rowdiv6">
                        <div class="col-md-2">
                            Download PDF file :
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <%--<asp:BoundField DataField="id" HeaderText="ID" />
                                    <asp:BoundField DataField="name" HeaderText="Name" />
                                    <asp:BoundField DataField="salary" HeaderText="Salary" />
                                    <asp:BoundField DataField="city" HeaderText="City" />
                                    <asp:BoundField DataField="pdfname" HeaderText="PDF Name" />--%>
                                    <asp:TemplateField HeaderText="ID" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lid" runat="server" Text='<%# Eval("id") %>' ></asp:Label>
                                            
                                        </ItemTemplate>

                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lname" runat="server" Text='<%# Eval("name") %>' ></asp:Label>
                                           
                                        </ItemTemplate>

                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name Link" ItemStyle-Width="150">
                                        <ItemTemplate>
                                         
                                            <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.name") %>' NavigateUrl='<%# DataBinder.Eval(Container,"DataItem.id","Fileuploaddatashow.aspx?id={0}")%>'>HyperLink</asp:HyperLink>
                                        </ItemTemplate>

                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Salary" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lsalary" runat="server" Text='<%# Eval("salary") %>' ></asp:Label>
                                           
                                        </ItemTemplate>

                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lcity" runat="server" Text='<%# Eval("city") %>' ></asp:Label>
                                            
                                        </ItemTemplate>

                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PDF Name" ItemStyle-Width="150">
                                        <ItemTemplate>
                                            <asp:Label ID="lpdfname" runat="server" Text='<%# Eval("pdfname") %>' ></asp:Label>
                                            
                                        </ItemTemplate>

                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Download">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/PDF/"+Eval("pdfname") %>'>Download</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnimgedit" runat="server" Height="25px" ImageUrl="~/Image/editimg.jpg" Width="25px" OnClick="btnimgedit_Click" />
                                            <asp:Label ID="lblstaus" runat="server" Text="Coming soon..." Visible="false" ></asp:Label>
                                            <asp:Button ID="btnedit" runat="server" Text="Edit" OnClick="btnedit_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnimgdelete" runat="server" Height="25px" ImageUrl="~/Image/recycle-bin-icon.jpg" Width="25px" OnClick="btnimgdelete_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Button ID="btnpdf" runat="server" Text="Show" CssClass="btn btn-success" OnClick="btnpdf_Click" />
                             <asp:Button ID="btnerror" runat="server" Text="Error" CssClass="btn btn-danger" OnClick="btnerror_Click"  />
                        </div>
                        
                        <div class="row" id="rowdiv7">
                            <div class="col-md-2">
                                <asp:Label ID="lblid" runat="server" Text="Id"></asp:Label>
                                <asp:TextBox ID="txt_id" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lbl_name" runat="server" Text="Name"></asp:Label>
                                <asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblsalary" runat="server" Text="Salary"></asp:Label>
                                <asp:TextBox ID="txtsalary" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblcity" runat="server" Text="City Name"></asp:Label>
                                <asp:TextBox ID="txtcity" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="lblpdfname" runat="server" Text="PDF Name"></asp:Label>
                                <asp:TextBox ID="txtpdfname" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <br />
                            <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnupdate_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div style="text-align:-webkit-center">
            <table id="mytable">
                <thead>
                    <tr>
                        <th>Name</th>
                         <th>City</th>
                    </tr>
                </thead>
                <tr>
                    <td>Ashok Chauhan</td>
                    <td>Azamgrarh</td>
                </tr>
                <tr>
                    <td>Suman Chauhan</td>
                    <td>Mau</td>
                </tr>
                <tr>
                    <td>Santosh Chauhan</td>
                    <td>Varanasi</td>
                </tr>
            </table>
            <div>
                <p>Click on me and I'll disappear.</p>
                <p>Click on me and I'll disappear.</p>
                <p>Click on me and I'll disappear.</p>
            </div>
        </div>
        Data Reader Bind:<asp:DropDownList ID="ddlreader" runat="server"></asp:DropDownList>
    </form>
</body>
</html>
