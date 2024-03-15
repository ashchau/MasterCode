<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetAllFolderFiles.aspx.cs" Inherits="ImportExport_GetAllFolderFiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        //Promise is a javacript function
        let promise = new Promise(function (resolve, reject) {
            const x = 10;
            const y = 10;
            if (x == y) {
                resolve();
            }
            else
            {
                reject();
            }
        })
        promise.then(function () {
            console.log("Equal promise.. fullfilled.");
        }).catch(function () {
            console.log("Not Equal..Promise Rejected.");
            })
        //second method
       
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="dm" runat="server"></asp:Label>
            <div id="demo" runat="server"></div>
            <asp:Button ID="btnGetFiles" Text="Get Files From Folder & Sub Folders" runat="server" OnClick="btnGetFiles_Click" />
            <asp:GridView ID="gvDetails" CellPadding="5" runat="server">
                <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
<script>
     function myDisplayer(some) {
         document.getElementById("dm").innerText = some;
         document.getElementById("demo").innerHTML =some;
     }

        let myPromise = new Promise(function(myResolve, myReject) {
            // "Producing Code" (May take some time)
            let x = 0;
            if (x == 0) {
                myResolve("Ok"); // when successful
            }
            else
            {
                 myReject("Error");  // when error
            }
        });
        // "Consuming Code" (Must wait for a fulfilled Promise)
        myPromise.then(
          function(value) {myDisplayer(value);},
          function(error) {myDisplayer(error);}
        );
</script>