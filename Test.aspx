<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <%--  <script src="Scripts/jquery-3.5.1.min.js"></script>  
    <script src="Scripts/bootstrap-datepicker.min.js"></script>
   
    <link href="Content/bootstrap.css" rel="stylesheet" />--%>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css" rel="stylesheet" type="text/css" />


    <script>
        $(function () {
            $('#txtDatePicker').datepicker(
            {
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
        })
    </script>
    <script>
        $(function () {
            $('#txtDatePick').datepicker(
            {
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
        })
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <div class="panel-Heading" style="color: aqua;">
                <h3>Insert Data </h3>
            </div>
            <div class="panel panel-primary">
                <div class="col-md-12">


                    <div class="col-md-2">
                        <asp:Label ID="lblname" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                    </div>

                    <div class="col-md-2">
                        <asp:Label ID="lbladd" runat="server" Text="Address"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtaddresss" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>


                </div>


                <br />
                <div class="col-md-2">
                    <asp:Label ID="Label1" runat="server" Text="Gender"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:RadioButton ID="rbmale" runat="server" GroupName="gen" Text="Male" />&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rbfemale" runat="server" Text="Female" GroupName="gen" />
                </div>

                <br />

                <div class="col-md-12">
                    <div class="col-md-2">
                        <asp:Label ID="lblclass" runat="server" Text="Class"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtclass" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <asp:Label ID="lblpincode" runat="server" Text="Pincode"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <asp:Label ID="lblage" runat="server" Text="Age"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtage" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-md-2">
                        <asp:Label ID="lblsubject" runat="server" Text="Subject"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:TextBox ID="txtsubt" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <asp:Label ID="lblhobby" runat="server" Text="Hobby"></asp:Label>
                    </div>
                    <br />
                    <div class="col-md-3">
                        <asp:CheckBox ID="Footbal_chk" runat="server" Text="Football" />&nbsp;&nbsp;
                            <asp:CheckBox ID="Crici_chk" runat="server" Text="Cricket" />&nbsp;&nbsp;
                            <asp:CheckBox ID="Chess_chk" runat="server" Text="Chess" />
                    </div>
                </div>
                <br />
                <div>
                    <asp:TextBox ID="txtDatePicker" runat="server" PlaceHolder="dd/MM/yyyy" autocomplete="off"></asp:TextBox>
                </div>

                <div>
                    <asp:TextBox ID="txtDatePick" runat="server" PlaceHolder="dd/MM/yyyy" autocomplete="off"></asp:TextBox>
                </div>

               

                <br />
                <div>
                    <asp:Label ID="lblmsg" runat="server" Visible="false" BackColor="Red"></asp:Label>
                </div>
                <br />
                <div class="col-md-12">
                    <div class="">
                        <asp:Button ID="btnsave" runat="server" Text="Save Data" CssClass="btn btn-success" OnClick="btnsave_Click" />
                        <asp:Button ID="btndelete" runat="server" Text="DeleteData" CssClass="btn btn-danger" OnClick="btndelete_Click" />
                        <asp:Button ID="btnupdate" runat="server" Text="Update Data" CssClass="btn btn-primary" OnClick="btnupdate_Click" />
                        <asp:Button ID="btnclear" runat="server" Text="Clear Textbox" CssClass="btn btn-info" OnClick="btnclear_Click" />
                    </div>
                </div>



            </div>
        </div>
        <div>
            <div class='item'>
                <div class='col-md-12 marB5'>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=4734_247.pdf&Header=Jodhpur News'>SARKARI BHUMI PAR NAGAR VIKAS NYAS KE PAS LAGA LOK SANGIT MASURIYA COLONY, BALDEV NAGAR, JODHPUR TELICOM TOWER KE NIRMAN KI SUCHNA BABAT</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=2627_246.pdf&Header=Jodhpur News'>BIRMRAM S/O SHRI BHURARAM MAKAN NO. 990/944, RAM MOHALLA, NAGOURI GATE KE BAHAR, JODHPUR TELICOM TOWER KI SUCHNA BABAT</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=4731_245.pdf&Header=Jodhpur News'>SHRI HARI KISHAN SAIN S/O SHRI JETHARAM SAIN HOUSE NO. 20/24, BLOCK NO. 02, CHOPASANI HOUSING BOARD, JODHPUR TELICOM TOWER KI SUCHNA BABAT</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=838_244.pdf&Header=Jodhpur News'>SARKARI BHOOMI PAR, E.N.T. HOSPITAL KE PASS, MAKAN NO. 11/1012 KE SAMNE, CHOPASANI HOUSING BOARD, JODHPUR PAR MOBILE TOWER KE NIRMAN OR STHAPIT KARNE HETU</a> </div>
                </div>
            </div>
            <div class='item'>
                <div class='col-md-12 marB5'>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=620_243.pdf&Header=Jodhpur News'>SARKARI BHOOMI PAR, SARWAJANIK  SHOUCHALAYA KE PASS, UMAID STADIUM, JODHPUR PAR MOBILE TOWER KE NIRMAN OR STHAPIT KARNE HETU</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=841_242.pdf&Header=Jodhpur News'>SHRI SHYAM SINGH S/O LAXMAN SINGH, PATTA NO. 11/31-32, MISAL NO. 95/31-32, BAI JI KA TALAB, JODHPUR PAR MOBILE TOWER KE NIRMAN OR STHAPIT KARNE HETU</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=835_241.pdf&Header=Jodhpur News'>SARKARI BHOOMI PAR, DIVAIDAR KE UPAR. AGRAWALON KI BAGICHI PAR MOBILE TOWER KE NIRMAN OR STHAPIT KARNE HETU</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=MADHUBAN_240.pdf&Header=Jodhpur News'>सरकारी भूमी पर मकान नं. 1/81 के पीछे मधुबन, जोधपुर  पर मोबाइल टॉवर के निर्माण व स्थापित करने हेतु आम सूचना</a> </div>
                </div>
            </div>
            <div class='item'>
                <div class='col-md-12 marB5'>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=PABUPURA_239.pdf&Header=Jodhpur News'>श्री विरेन्द्र प्रसाद पुत्र श्री बद्रीप्रसाद, प्लॉट नं. 01 खसरा नं.  632 सेक्टर डी पाबूपुरा, जोधपुर पर मोबाइल टॉवर के निर्माण व स्थापित करने हेतु आम सूचना</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=MASURIYA_238.pdf&Header=Jodhpur News'>सरकारी भूमी पर सरकारी स्कूल के पास बाबा रामदेव मंदिर रोड मसूरिया, जोधपुर पर मोबाइल टॉवर के निर्माण व स्थापित करने हेतु आम सूचना</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=Swachh Rating Framework_2022_237.pdf&Header=Jodhpur News'>Swachh Rating Framework_2022</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=??????? ????????? ?????? ?????? 28-02-2022_236.pdf&Header=Jodhpur News'>सालावास सीवरेज ट्रीटमेंट से उपचारित जल के उपयोग की नीलामी सूचना</a> </div>
                </div>
            </div>
            <div class='item'>
                <div class='col-md-12 marB5'>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=aam suchna (1)_235.pdf&Header=Jodhpur News'>सरकारी भूमि पर रोड़ डिवाइडर के ऊपर एम्स हॉस्पीटल गेट नं. 04 के सामने बासनी जोधपुर पर मोबाइल टावर के निर्माण व स्थापित करने बाबत आम सूचना</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=aam suchna_234.pdf&Header=Jodhpur News'>टैलीकाॅम टावर के उपर टेलीग्राफ अवसंरचना के निर्माण स्थापना के लिए आम सूचना</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=corr 1608_233.pdf&Header=Jodhpur News'>संशोधित ई निविदा सूचना नंबर 1573</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=corrig 11851_232.pdf&Header=Jodhpur News'>CORRIGENDUM OF NIT NO. 11851</a> </div>
                </div>
            </div>
            <div class='item'>
                <div class='col-md-12 marB5'>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=3 (1)_231.pdf&Header=Jodhpur News'>105 यूनिपोल (विज्ञापन पट्ट) की पृथक पृथक नीलामी के नियम व शर्ते</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=2 (1)_230.pdf&Header=Jodhpur News'>27 यूनिपोल (विज्ञापन पट्ट) की नीलामी एक समुह में नियम व शर्ते</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=1 (2)_229.pdf&Header=Jodhpur News'>पोल/खम्भों (रोड लाइट) पर विज्ञापन पट्ट (छोटे हार्डिंग्स) लगाने की शर्ते</a> </div>
                    <div class='col-sm-12 col-xs-12 marB5 fa fa-hand-o-right' style='font-size: 14px; color: red'><a href='Presentation/MasterForms/MstPdfViewer.aspx?Pageid=1&PdfName=advertisement_228.pdf&Header=Jodhpur News'>नगर निगम जोधपुर द्वारा सार्वजनिक स्थलों पर विज्ञापन के लिए विज्ञापन पट्टो (यूनिपोलो) की नीलामी (खुली बोली)</a> </div>
                </div>
            </div>
            <ol class='carousel-indicators carousel-indicators-jmc'>
                <li data-target='#myCarousel' data-slide-to='0' class='active'></li>
                <li data-target='#myCarousel' data-slide-to='1'></li>
                <li data-target='#myCarousel' data-slide-to='2'></li>
                <li data-target='#myCarousel' data-slide-to='3'></li>
                <li data-target='#myCarousel' data-slide-to='4'></li>
            </ol>
        </div>

    </form>
</body>
</html>
