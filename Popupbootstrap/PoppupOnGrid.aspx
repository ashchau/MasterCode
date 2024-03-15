<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PoppupOnGrid.aspx.cs" Inherits="Popupbootstrap_PoppupOnGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Popup On Gridview</title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border-color: #ccc;
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:20px;">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover"
            DataKeyNames="student_Id" AutoGenerateColumns="false" GridLines="None">
            <Columns>
                <asp:TemplateField HeaderText="Admission No">
                    <ItemTemplate>
                        <asp:Label ID="lblstudent_Id" runat="server" Text='<%# Eval("student_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Month">
                    <ItemTemplate>
                        <asp:Label ID="lblMonth_Name" runat="server" Text='<%# Eval("Month_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount">
                    <ItemTemplate>
                        <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsPaid">
                    <ItemTemplate>
                        <asp:Label ID="lblIsPaid" runat="server" Text='<%# Eval("IsPaid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="date">
                    <ItemTemplate>
                        <asp:Label ID="lbldate" runat="server" Text='<%# Eval("date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pay">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkBtnPay" runat="server" Text="Pay Now" CssClass="btn btn-info"
                            OnClick="lnkBtnPay_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                        <h4 class="modal-title">
                            Student Fee Details</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                            <div class="form-group">
                                <asp:Label ID="lblstudent" runat="server" Text="Aadmission No: "></asp:Label>
                                <asp:Label ID="lblstudentid" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Month"></asp:Label>
                                <asp:Label ID="lblmonth" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>
                                <asp:TextBox ID="txtAmount" runat="server" TabIndex="3" MaxLength="75" CssClass="form-control"
                                    placeholder="Enter Amount"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" runat="server" Text="Pay" OnClick="btnSave_Click" CssClass="btn btn-info" />
                        <button type="button" class="btn btn-info" data-dismiss="modal">
                            Close</button>
                    </div>
                </div>
            </div>
            <script type='text/javascript'>
                function openModal() {
                    $('[id*=myModal]').modal('show');
                }  
            </script>
        </div>
    </div>
    </form>
</body>
</html>
