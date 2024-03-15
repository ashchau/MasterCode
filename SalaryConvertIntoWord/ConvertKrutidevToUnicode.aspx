<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConvertKrutidevToUnicode.aspx.cs" Inherits="SalaryConvertIntoWord_ConvertKrutidevToUnicode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            //how to check a check box only one at a time
            $(".cbk input").click(function () {
                var status = $(this).prop("checked");
                $(".cbk input").prop("checked", false);
                $(this).prop("checked", status);
            });
            //$(".cbk input").click(function () {
            //    debugger
            //    $(".cbk input").prop("checked", false);
            //    $(this).prop("checked", true);
            //});
        });

    </script>
    <script>
        function myFunction() {
            /* Get the text field */
            debugger;
            var copyText = document.getElementById("TextBox1");

            /* Select the text field */
            copyText.select();
            copyText.setSelectionRange(0, 99999); /* For mobile devices */

            /* Copy the text inside the text field */
            navigator.clipboard.writeText(copyText.value);

            /* Alert the copied text */
            alert("Copied the text: " + copyText.value);
        }
        function ctrlA1(corp) {
            with (corp) { }
            if (document.all) {
                txt = corp.createTextRange()
                txt.execCommand("Copy")
            } else
                setTimeout("window.status=''", 5000)
        }
    </script>
    <script>
        function copyToClip(str) {
            function listener(e) {
                e.clipboardData.setData("text/html", str);
                e.clipboardData.setData("text/plain", str);
                e.preventDefault();
            }
            document.addEventListener("copy", listener);
            document.execCommand("copy");
            document.removeEventListener("copy", listener);
        };
    </script>
    <script>
        function CopyToClipboard(id) {
            var r = document.createRange();
            r.selectNode(document.getElementById(id));
            window.getSelection().removeAllRanges();
            window.getSelection().addRange(r);
            document.execCommand('copy');
            window.getSelection().removeAllRanges();
        }
    </script>
    <script>
        function copyToClipboard(text) {
  var input = document.body.appendChild(document.createElement("input"));
  input.value = text;
  input.focus();
  input.select();
  document.execCommand('copy');
  input.parentNode.removeChild(input);
}
    </script>
    <script>
         function copyDivToClipboard() {
                    var range = document.createRange();
                    range.selectNode(document.getElementById("mp"));
                    window.getSelection().removeAllRanges(); // clear current selection
                    window.getSelection().addRange(range); // to select text
                    document.execCommand("copy");
                    window.getSelection().removeAllRanges();// to deselect
                }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
            <%--https://www.w3schools.com/howto/howto_js_copy_clipboard.asp--%>
            <asp:Button ID="btnconvertunic" runat="server" Text="Kruti Dev to Unic code" OnClick="btnconvertunic_Click" OnClientClick="myFunction()" />
            <button onclick="ctrlA1(document.getElementById('sc1') )">copy</button>
            <asp:Button runat="server" ID="print" Text="copy text" OnClientClick="ctrlA1(document.getElementById('sc1') );"/>
        </div>
        <div>
            <%--<a class="cls_copy_pg_action copyAction copy-action-btn" data-value="THIS TEXT WILL BE COPIED"> <i class="far fa-copy"></i> Copy</a>--%>
            <button onclick="copyToClip(document.getElementById('foo').innerHTML)">Copy the stuff </button>
            <%--http://jsfiddle.net/jdhenckel/km7prgv4/3--%>
             <button onclick="CopyToClipboard('foo');">Copy Text </button>
             <button onclick="CopyToClipboard('lblmsg');">Copy Text1 </button>
             <button onclick="CopyToClipboard('mp');">Copy Text2 </button>
            <%--https://www.arclab.com/en/kb/htmlcss/how-to-copy-text-from-html-element-to-clipboard.html--%>
            <a href="#" onclick="CopyToClipboard('pgid');return false;">Copy Text</a>
            <button onclick="copyDivToClipboard();">Copy Text3 </button>
        </div>
        <div runat="server" id="foo">
            jkdjfkldjfdjaskf
            <p runat="server" id="pgid">
                Once in a while you’ll run across a chunk of code on a website you want to copy and paste. After you paste it, you find the line numbers came along with it.

It’s kind of surprising actually, since it seems like you’d have to go out of you way to make that happen. Knowing what we know now, those line numbers could have used CSS to prevent them from being copied. Or the code could have been marked up as a list to show the numbers that won’t copy. Or it could have used custom counters which wouldn’t copy. Or pseudo elements before the lines that wouldn’t copy
            </p>
            <p>
                That bit with the mouseup allows the text to remain selected after the mouseup event. Normally the mouseup will deselect the text and activate the cursor.
            </p>
        </div>
        <%-- xmp tag are used for copy the text as this whrite on the page --%>
        <xmp id="mp">
            <table>
                <tr>
                    <td>Name :</td><td>Ashok chauhan</td>
                </tr>
                <tr>
                    <td>Address :</td><td>Azamgarh</td>
                </tr>
            </table>
        </xmp>
        <div>
            Status:<asp:TextBox ID="txtnewstatus" runat="server"></asp:TextBox>
            Subject:<asp:TextBox ID="txtnewssub" runat="server"></asp:TextBox>
            PDF Name:<asp:TextBox ID="txtnewspdf" runat="server"></asp:TextBox>
            Lang:<asp:TextBox ID="txtlag" runat="server"></asp:TextBox>
            <asp:Label ID="msg" runat="server"></asp:Label>
            <asp:Button ID="btnnews" runat="server" Text="Save News" OnClick="btnnews_Click" />
        </div>
        <div>
            <asp:CheckBox ID="chkonetime" runat="server" Text="One time pay" CssClass="cbk" />
            <asp:CheckBox ID="chkfull" runat="server" Text="Full pay" CssClass="cbk" />
            <asp:CheckBox ID="chkhalf" runat="server" Text="Half pay" CssClass="cbk" />
        </div>
    </form>
</body>
</html>
