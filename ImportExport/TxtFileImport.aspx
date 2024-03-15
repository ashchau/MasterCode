<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TxtFileImport.aspx.cs" Inherits="ImportExport_TxtFileImport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:FileUpload ID="FileUpload1" runat="server" />
<asp:Button Text="Import" runat="server" OnClick="ReadDat" />
<asp:GridView runat="server" ID="gvEmployees" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code" />
        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyyMMdd}" />
        <asp:BoundField DataField="Time" HeaderText="Time" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
        <asp:BoundField DataField="MId" HeaderText="MID" />
    </Columns>
</asp:GridView>
        </div>
       <div class="container-fluid mt-5">
            <div class="card">
            <div class="card-header bg-primary text-white">
                <div class="col-md-12 text-center">
                    <h3>Upload TXT file And Create Dynamic Table</h3>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-group">
                            <div class="col-md-4">
                                <label>Choose a Text File</label>
                            </div>
                            <div class="col-md-4">
                                <asp:FileUpload ID="FileUploadtxtfile" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-10">
                             <asp:GridView ID="grdimport" runat="server"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row text-center">
                    <div class="col-md-12">
                         <asp:Button ID="btnimport" runat="server" Text="IMPORT" OnClick="btnimport_Click" CssClass="btn btn-success" />
                    </div>
                </div>
            </div>
        </div>
       </div>
    </form>
</body>
</html>
