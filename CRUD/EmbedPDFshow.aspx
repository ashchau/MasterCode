<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="EmbedPDFshow.aspx.cs" Inherits="CRUD_EmbedPDFshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:LinkButton ID="lnkView" runat="server" Text="View PDF" OnClick="lnkView_Click"></asp:LinkButton>
        <hr />
        <asp:Literal ID="ltEmbed" runat="server" />
    </div>
    <div>
        <h3>Embedding the PDF file Using Object Tag</h3>
        <object data="https://media.geeksforgeeks.org/wp-content/cdn-uploads/20210101201653/PDF.pdf" width="500" height="300"></object>
    </div>
    <div>
          <h3>Embedding the PDF file Using Iframe Tag</h3>
        <iframe src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/20210101201653/PDF.pdf" width="500" height="300"></iframe>
    </div>
    <div>
        <h3>Embedding the PDF file Using embed Tag</h3>
        <embed src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/20210101201653/PDF.pdf" width="500" height="300"/>
    </div>
    <div>
       <p>ry Google Doc Viewer. Just embed an iframe in your page pointing to Google Doc Viewer and specifying the PDF file you want to display. This is the code you should add:</p>
        <iframe src="http://docs.google.com/gview?url=http://infolab.stanford.edu/pub/papers/google.pdf&embedded=true" style="width:500px; height:300px;" frameborder="0"></iframe>
    </div>
    <div class="row">
            <div class="col-md-12">
                <h3 id="HearHeading" class="bg-warning urban-developement-tax"><asp:Label ID="lblHeader"  runat="server"  ></asp:Label></h3>
            </div>
        </div>
    <br/>
    <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblPDFViewer" runat="server"></asp:Label>
                  <%--  <a href="#" target="_blank"></a>--%>
                </div>
            </div>
        </div>
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
        <asp:Button ID="btnpdf" runat="server" Text="Show PDF" OnClick="btnpdf_Click" />
    </div>
</asp:Content>

