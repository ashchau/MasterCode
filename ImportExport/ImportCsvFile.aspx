<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportCsvFile.aspx.cs" Inherits="ImportExport_ImportCsvFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div style="color: red;">    
           
        <table>    
            <tr>    
                <td>    
                    Select File    
                </td>    
                <td>    
                    <asp:FileUpload ID="FileUpload1" runat="server" />    
                </td>    
                <td>    
                </td>    
                <td>    
                    <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />    
                </td>    
            </tr>    
        </table>  <br /><br />  
        
    </div>    
    </form>
</body>
</html>
