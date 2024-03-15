<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="ImportExport_Download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function download(file, text) {
            debugger;
                //creating an invisible element
                var element = document.createElement('a');
                element.setAttribute('href',
                'data:text/plain;charset=utf-8, '
                + encodeURIComponent(text));
                element.setAttribute('download', file);
             
                // Above code is equivalent to
                // <a href="path of file" download="file name">
             
                document.body.appendChild(element);
             
                //onClick property
                element.click();
             
                document.body.removeChild(element);
            }
             
            // Start file download.
            document.getElementById("btn")
            .addEventListener("click", function() {
                // Generate download of hello.txt
                // file with some content
                var text = document.getElementById("text").value;
                var filename = "GFG.txt";
             
                download(filename, text);
            }, false);
        function btnclickme() {
            //download(file, text)
            debugger;
           // alert('Ashok');
            var el = document.getElementById('ContentPlaceHolder1_hrt');
            if (el) {
                el.addEventListener('onclick', function () {
                     el.click();
             
                });
                   // el.addEventListener('click', swapper, false);
                  }
        }
        function clickme() {
            //document.getElementById("myButton").addEventListener("click", function () {
                document.getElementById("ContentPlaceHolder1_hrt").click();
           // });
        }
         </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>Download Files</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="col-md-4">
                                File download<asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <a id="hrt" runat="server">GetFile</a>
                                <asp:Button ID="btndownload" runat="server" Text="Download..." OnClick="btndownload_Click" />
                            </div>
                             <div class="col-md-4">
                                <a id="hrtdwnd" href="#" runat="server">Download file New</a>
                                <asp:Button ID="btndwnd" runat="server" Text="Download file" OnClick="btndwnd_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div>
         <p>
          How to trigger a file download when
          clicking an HTML button or JavaScript?
      </p>
         <textarea id="text">
             Welcome to GeeksforGeeks
         </textarea>
         <br/>
         <input type="button" id="btn" value="Download" />
        <a id="ahrf" runat="server" download onclick="btnclickme()"></a>
        <asp:Button ID="btndld" runat="server" Text="GetFile" OnClick="btndld_Click" />
    </div>
    <div>
        <%-- used for download file from anchor tag --%>
        <script>
            document.getElementById("myButton").addEventListener("click", function () {
                document.getElementById("myLink").click();
            });
        </script>
        <button id="myButton">Click me</button>
<a id="myLink" href="https://www.example.com">Link</a>
    </div>
</asp:Content>

