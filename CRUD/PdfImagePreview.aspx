<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="PdfImagePreview.aspx.cs" Inherits="CRUD_PdfImagePreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"/>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
    #dialog img{
        width:510px !important;
        height:510px !important;
    }
    h2 {
        border: 10px dotted black;
        border-color:deeppink;
        font-size: 50px;
        font-weight: 900px;
        background-image: url(/Image/banana.jpg);
        background-repeat: repeat-x;
        background-position:center;
       -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        -webkit-animation: animate 15s linear infinite;
    }
    @-webkit-keyframes animate {
        0% {
            background-position: left 0 top 50px;
        }

        20% {
            background-position: left 800px top -50px;
        }

        40% {
            background-position: left 1800px top -60px;
        }

        60% {
            background-position: left 2400px top -80px;
        }

        80% {
            background-position: left 3400px top -50px;
        }

        100% {
            background-position: left 4400px top 50px;
        }
    }
    h2::selection{
        color:red;
        background-color:yellow
    }
    h1{
        font-weight:700;
        position:absolute;
        text-shadow: 2px 2px 5px red;
    }
/* line under text slid*/
    h1::after{
        content:"";
        position:absolute;
        left:0;
        bottom:0;
        height:3px;
        width:0%;
        background-color:aqua;
        transition:all ease 1s;
    }
    h1:hover::after{
        width:100%;
    }
/*circle image border*/
    #imgcircle{
        height:150px;
        width:150px;
        border-radius:50%;
        background:linear-gradient(rgb(255,174,0),orange,rgb(255,32,69),purple,blue);
        padding:10px;
    }
    #imgcircle img{
        height:100%;
        width:100%;
        object-fit:cover;
        border-radius:50%;
    }
    /*set slider color and with , also in gridview*/
   body::-webkit-scrollbar{
       background-color:transparent;
       width:10px;
   }
   body::-webkit-scrollbar-thumb{
       background:linear-gradient(rgb(255,174,0),orange,rgb(255,32,69),purple,blue);
       border-radius:20px;
   }
   #dvScroll::-webkit-scrollbar{
       background-color:transparent;
       width:10px;
   }
   #dvScroll::-webkit-scrollbar-thumb{
       background:linear-gradient(rgb(255,174,0),orange,rgb(255,32,69),purple,blue);
       border-radius:20px;
   }
   /*on button hover show button shadow*/
  .btn:hover {
      /*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*/
      box-shadow: 5px 5px 5px 5px rgba(61 185 43 / 57%),0 17px 50px 0 rgba(0,0,0,0.19);
  }
  /*how to show search icon on textbox*/
    .searchtxt {
        padding: 10px;
        border: 1px solid read;
        border-radius: 5px;
        background-image: url(/images/search_icon.png);
        background-repeat: no-repeat;
        background-size: 30px 30px;
        background-position: right center;
        padding-right: 45px;
        font-size: 16px;
    }
    .glowing-textbox{
        /*width:200px;
        height:8px;
        padding:10px;
        margin-top:20px;*/
        border-radius:10px;
        box-shadow:0 0 10px rgb(0,255,72);
        transition:box-shadow 0.5s ease-in-out;
    }
    .glowing-textbox:focus{
        box-shadow: 0 0 20px rgba(0,0,255,0.9);
        animation:glow 1s infinite alternate;
    }
    @keyframes glow {
       0%{
           box-shadow:0 0 20px rgb(255,174,0);
       }
    }
</style>
    <script type="text/javascript">
        funtion msg()
        {
            var v = confirm("Are u sure?");
            if (v == true) {
                alert("ok");
            }
            else {
                alert("cancel");
            }
        }
    </script>
    <script type="text/javascript">
    
    $(function () {
       // window.document.body.style.cursor = "wait";
        $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 600,
            title: "Zoomed Image"
        });
        $("[id*=gvImages] img").click(function () {
            $('#dialog').html('');
            $('#dialog').append($(this).clone());
            $('#dialog').dialog('open');
        });
        // $("#dialog1").dialog({
        //    autoOpen: false,
        //    modal: true,
        //    height: 600,
        //    width: 600,
        //    title: "Show Grid"
        //});
        // $("[id*=gvImages]").click(function () {
        //    $('#dialog1').html('');
        //    $('#dialog1').append($(this).clone());
        //    $('#dialog1').dialog('open');
        //});
    });
</script>
    <script>
      $(function () {
          LoadAllScript();
      });
     function showpnl() {
         $("#pnldate").attr("style", "display:block");
         return false;
     }
     function LoadAllScript() {
          $(".datecalendar").datepicker();
       }
  </script>
    <script>
        function showAadhar(evt) {
            debugger;
            if (evt.files && evt.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#ContentPlaceHolder1_ImgAadhar').attr('src', e.target.result)
                    $('#<%=Img1.ClientID%>').css("display", "");
                   // $('#<%=Img1.ClientID%>').css("display","block");
                    $('#ContentPlaceHolder1_Img1').attr('src', e.target.result)
                }
                filerdr.readAsDataURL(evt.files[0]);
            }
        }
    </script>
    <script type="text/javascript">

        function showPAN(input) {
            debugger;
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    //  $('#ImgPAN').attr('src', e.target.result);
                    $('#ContentPlaceHolder1_ImgPAN').attr('src', e.target.result)
                }
                filerdr.readAsDataURL(input.files[0]);
            }
            var fi = document.getElementById('ContentPlaceHolder1_UplImgPAN');
            var str1 = 'This File Size is : ';
            // Check if any file is selected.
            if (fi.files.length > 0) {
                for (var i = 0; i <= fi.files.length - 1; i++) {
                    var fsize = fi.files.item(i).size;
                    var file = Math.round((fsize / 2048));
                    // The size of the file.
                    if (file >= 2048) {

                        window.location = "#";
                        $('#<%=pnlmsg.ClientID%>').show();
                        $('#<%=pnlmsg.ClientID%>').focus();
                        $('#<%=pnlmsg.ClientID%>').addClass('alert alert-danger')
                        $('#<%=lblMsgs.ClientID%>').html("File too Big of Pan No(Image), please select a file less than 2mb");
                        $('#<%=lblStrong.ClientID%>').html("Error !!! ");
                        document.getElementById('PanSize').innerHTML = '<b>' + str1 + file + '</b> KB';

                        $('#ContentPlaceHolder1_ImgPAN').attr('src', '#');
                        $(input).val('');
                        return false;
                    }
                    else {
                        $('#<%=pnlmsg.ClientID%>').removeClass();
                        $('#<%=lblMsgs.ClientID%>').html('');
                        $('#<%=lblStrong.ClientID%>').html('');
                        document.getElementById('PanSize').innerHTML = '<b>' + str1 + file + '</b> KB'; return false;
                    }
                }
            }
        }
    </script>
    <script type="text/javascript">

        function showmyPAN(mypan) {
            debugger;
            if (mypan.files && mypan.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#ContentPlaceHolder1_ImgPAN').attr('src', e.target.result)
                    //file size check section start
                    var fi = document.getElementById(mypan.id);
                    var str1 = 'This File Size is : ';
                    if (fi.files.length > 0) {
                        for (var i = 0; i <= fi.files.length - 1; i++) {
                            var fsize = fi.files.item(i).size;
                            var file = Math.round((fsize / 2048));
                            if (file >= 2048) {
                                window.location = "javascript:void(0);";
                                $('#<%=pnlmsg.ClientID%>').show();
                                $('#<%=pnlmsg.ClientID%>').focus();
                                $('#<%=pnlmsg.ClientID%>').addClass('alert alert-danger')
                                $('#<%=lblMsgs.ClientID%>').html("File size is : " +(file / 1024).toFixed(2)+", please select a file less than 2 MB");
                                $('#<%=lblStrong.ClientID%>').html("Error !!! ");
                                document.getElementById('PanSize').innerHTML = '<b>' + str1 + (file / 1024).toFixed(2) + '</b> MB';
                                $('#ContentPlaceHolder1_ImgPAN').attr('src', '#');
                                $('#<%=ImgPAN.ClientID%>').css("display", "none");
                                $(mypan).val('');
                                return false;
                            }
                            else {
                                $('#<%=pnlmsg.ClientID%>').removeClass();
                                $('#<%=lblMsgs.ClientID%>').html('');
                                $('#<%=lblStrong.ClientID%>').html('');
                                $('#<%=ImgPAN.ClientID%>').css("display", "block");
                                document.getElementById('PanSize').innerHTML = '<b>' + str1 +
                                +(file/1024).toFixed(2) + '</b> MB'; return false;
                            }
                        }
                    }
                    //file size check section End
                }
                filerdr.readAsDataURL(mypan.files[0]);
            }
           
        }
    </script>
    <script>
        function ShowHideFU(checkbox) {
            var row = $(checkbox).closest("tr")[0];
            var inputcontrol = row.cells[2].children[0];
            var inputcontrolbtn = row.cells[2].children[2];
            var labelcontrol = row.cells[3].children[0];
            var divcontrol = $('#ContentPlaceHolder1_mainImg1');
            if ($(checkbox).prop('checked') && inputcontrol != null) {
                $(inputcontrol).removeAttr("disabled");
                $(inputcontrolbtn).removeAttr("disabled");
            }
            else {
                $(inputcontrol).attr('disabled', 'disabled');
                $(inputcontrolbtn).attr('disabled', 'disabled');
                $(inputcontrol).val('');
                divcontrol.attr("src", "");
                //for clear the scan image
                $(row.cells[2].children[4]).val('');
                $(row.cells[2].children[4]).attr('src', '');
                $(row.cells[2].children[5]).text('');
                $(row.cells[2].children[6]).val('');
            }

            if ($(checkbox).prop('checked') && labelcontrol != null) {
                $(labelcontrol).removeAttr("disabled");
            }
            else {
                $(labelcontrol).attr('disabled', 'disabled');
            }
        }
        function Showimage(btncontrol) {
            debugger;
            var row = $(btncontrol).closest("tr")[0];
            var Headercontrol = row.cells[1].children[0];
            var inputcontrol = row.cells[2].children[0];
            console.log(inputcontrol);
            var scanImage = row.cells[2].children[0]; //For scan Image
            var HdfScanImage = $(scanImage).val(); //For scan Image
            var lblStatus = row.cells[2].children[5]; //For scan Image
            var status = row.cells[2].children[6]; //For scan Image
            var PDFImgInd =2 //row.cells[4].children[1].value;
            var divcontrol = $('#ContentPlaceHolder1_mainImg1');
            var divcontrolifrmPDF = $('#ContentPlaceHolder1_ifrmPDF');

            //if ($(inputcontrol).val() != "") {
            //    $(scanImage).val('');
            //    $(scanImage).attr('src', '');
            //    $(HdfScanImage).val('');
            //    $(HdfScanImage).attr('src', '');
            //    $(lblStatus).text('');
            //    $(status).val('');
            //}
       

           if (inputcontrol.files.length > 0) {
                if (PDFImgInd == "2") {
                    divcontrolifrmPDF.attr("src", URL.createObjectURL(inputcontrol.files[0]));
                    $('#ContentPlaceHolder1_mainImg1').css("display", "none")
                    $('#ContentPlaceHolder1_ifrmPDF').css("display", "block");
                }
                else if (PDFImgInd == "1") {
                    divcontrol.attr("src", URL.createObjectURL(inputcontrol.files[0]));
                    $('#ContentPlaceHolder1_mainImg1').css("display", "block")
                    $('#ContentPlaceHolder1_ifrmPDF').css("display", "none");
                }
                $('#myModal').modal('show');
            }
            else {
                $('#myModal').modal('hide');
                divcontrol.attr("src", "");
                $('#ContentPlaceHolder1_lblMsg').html('Please Select File.');
                $('#ContentPlaceHolder1_lblMsg').addClass('alertMsg failed');
            }
        }
    </script>
    <script type="text/javascript"> 
        $(document).ready(function () {
            maintainScrollPosition();
        });
        function pageLoad() {
            maintainScrollPosition();
        }
        function maintainScrollPosition() {
            $("#dvScroll").scrollTop($('#<%=hfScrollPosition.ClientID%>').val());
        }   
            function setScrollPosition(scrollValue) {
            $('#<%=hfScrollPosition.ClientID%>').val(scrollValue);
        }               
    </script>
    <style type="text/css">
        .divcss {
            overflow-y: scroll;
            height: 130px;
            width: 350px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>show file</h3>
       <div class="modal fade " id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 750px; height: 551px;">
                    <div class="modal-header">
                        <div class="modal-title">
                            <asp:Label ID="lblHeaderName" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
                            <a href="#" id="btnclose" class="text-right pull-right" data-dismiss="modal">&times</a>
                        </div>
                    </div>
                    <div class="modal-body image">
                        <asp:Panel runat="server" ID="html123">
                            <div class="mainImgDiv">
                                <img src="#" id="mainImg1" style="display: none" alt="Select Document" runat="server" data-id="" class="zoom mainImgDiv" />
                                <iframe runat="server" style="display: none" id="ifrmPDF" width="718px" height="400px" src=""></iframe>
                            </div>
                        </asp:Panel>

                    </div>
                </div>

            </div>
        </div>
       <div class="panel">
        <div class="panel-heading bg-primary text-center">
            <h3>Upload file preview</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="btnupload" runat="server" Text="Upload Image" OnClick="btnupload_Click" />
                        <input type="button" value="delete record" onclick="msg()"/>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvImages_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Image Id" />
                                <asp:BoundField DataField="imgname" HeaderText="Name" />
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                                        <asp:HyperLink ID="HyperLink1" runat="server">View</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-3">
                        <div id="imgcircle">
                             <img src="../Images/ashok.png" />
                        </div>
                          <h1>Ashok chauhan</h1>
                          <div id="dialog" style="display: none"></div>
                          <div id="dialog1" style="display: none"></div>
                    </div>
                </div>
                <div class="col-md-12">
                    <h2>How to save the binary data and  get it </h2>
                 
                     <hr />
                </div>
                <div class="col-md-12">
                    <div class="col-md-4">
                        <asp:FileUpload ID="UpLImgAadhar" runat="server" onchange="showAadhar(this);" />
                        <h6 style="margin-left: 10px;"><span id="size"></span></h6>
                    </div>
                    <div class="col-md-4">
                        <img src="#" id="ImgAadhar" runat="server" style="margin-left: 40px; height: 90px; width: 90px;" />
                    </div>
                    <div class="col-md-4">
                        <img src="#" id="Img1" runat="server" style="margin-left: 40px; height: 200px; width: 200px; display:none;" />
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-4">
                        <asp:FileUpload ID="UplImgPAN" runat="server" onchange="showmyPAN(this);" />
                         <h6 style="margin-left: 10px;"><span id="PanSize"></span></h6>
                    </div>
                    <div class="col-md-3">
                         <img src="#" id="ImgPAN" runat="server" style="margin-left: 40px; height: 90px; display:none;" />
                    </div>
                    <div class="col-md-3" id="pnlmsg" runat="server">
                        <asp:Label ID="lblMsgs" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblStrong" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-6">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                            <Columns>
                                <asp:TemplateField HeaderText="Sreno">
                                    <ItemTemplate>
                                       <asp:CheckBox ID="chkdocument" onclick="ShowHideFU(this)" runat="server" />
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("empid") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblid" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblname" runat="server" Text='<%#Eval("empname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Uploadfile">
                                    <ItemTemplate>
                                         <asp:FileUpload ID="fu" accept="image,.pdf" disabled="disabled" class="btn btn-primary btn-xs" runat="server" />
                                          <asp:RegularExpressionValidator Display="Dynamic" ID="rexp" runat="server" ControlToValidate="fu" ForeColor="Red" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx|.pdf|.png|.jpg|.jpeg)$"></asp:RegularExpressionValidator>
                                      <%--  <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                         <a runat="server" id="btnPreview" class="btn btn-info btn-sm-pdng" onclick="Showimage(this)" disabled="disabled">Preview</a>
                                        <asp:HiddenField ID="hdnismg" runat="server" Value='<%#Eval("scanimgind") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-6">
                       <%-- <iframe src="#" width="500" height="300"></iframe>--%>
                    </div>
                </div>
                <div class="col-md-12">
                   <p>Maintain scroll position of Gridview inside div on postback</p>
                    <asp:HiddenField ID="hfScrollPosition" Value="0" runat="server" />
                    <div id="dvScroll" class="divcss" onscroll="setScrollPosition(this.scrollTop);">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                        <Columns>
                            <asp:TemplateField HeaderText="Customer id">
                                <ItemTemplate>
                                    <asp:Label ID="lblid" runat="server" Text='<%#Eval("CustomerId") %>'></asp:Label>
                                    <asp:Label ID="lblserno" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                               <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                               <asp:TemplateField HeaderText="Country">
                                <ItemTemplate>
                                    <asp:Label ID="lblcountry" runat="server" Text='<%#Eval("Country") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Country">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hyledit" runat="server" CssClass="btn btn-info">Edit</asp:HyperLink>
                                    <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-danger" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </div>
                </div>
                <div class="col-md-12" id="libload">
                    <div class="col-md-6">
                        <asp:TextBox ID="txteffect" runat="server" CssClass="form-control glowing-textbox"></asp:TextBox><br />
                        <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control searchtxt glowing-textbox"></asp:TextBox><br />
                        <asp:TextBox ID="txtdate1" runat="server" CssClass="form-control datecalendar"></asp:TextBox>
                        <asp:Button ID="btnshow" runat="server" Text="Show" CssClass="btn btn-success" OnClick="btnshow_Click"/>
                    </div>
                    <div class="col-md-6" id="pnldate" style="display:block;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" Visible="false">
                            <ContentTemplate>
                                <script type="text/javascript">
                                    Sys.Application.add_load(LoadAllScript)
                                </script>
                                <asp:TextBox ID="txtdate2" runat="server" CssClass="form-control datecalendar"></asp:TextBox>
                            </ContentTemplate>
                            <Triggers></Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnpreview" runat="server" CssClass="btn btn-info" Text="Preview" />
        </div>
    </div>
</asp:Content>

