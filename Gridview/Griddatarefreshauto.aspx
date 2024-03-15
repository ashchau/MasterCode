<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Griddatarefreshauto.aspx.cs" Inherits="Gridview_Griddatarefreshauto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="30000" OnTick="Timer1_Tick"></asp:Timer>
        <div class="container">
            <div class="card">
                <div class="card-header bg-primary">
                    <div class="card-title text-center">
                        <h3>How to update Gridview data after 5m auto</h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div>
                               Old 1: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                               
                            </div>
                            <div class="col-md-4">
                                <div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lblTime" runat="server" /><br />
                                            
                                            <asp:GridView ID="grdshow" runat="server"></asp:GridView>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div>
                                     OLd-2<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lbltimer" runat="server"></asp:Label>
                                            
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="stid" DataSourceID="SqlDataSource1">
                                                <Columns>
                                                    <asp:BoundField DataField="stid" HeaderText="stid" InsertVisible="False" ReadOnly="True" SortExpression="stid" />
                                                    <asp:BoundField DataField="stname" HeaderText="stname" SortExpression="stname" />
                                                    <asp:BoundField DataField="stcity" HeaderText="stcity" SortExpression="stcity" />
                                                    <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:chauhanConnectionString2 %>" SelectCommand="SELECT TOP 3 * FROM [student] ORDER BY NEWID()"></asp:SqlDataSource>
                                            <asp:Timer ID="Timer2" runat="server" OnTick="Timer2_Tick" Interval="20000" ></asp:Timer>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="card-footer">Footer</div>
            </div>
        </div>
    </form>
</body>
</html>
