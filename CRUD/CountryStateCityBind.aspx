<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CountryStateCityBind.aspx.cs" Inherits="CRUD_CountryStateCityBind" %>

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
        <div class="container mt-5">
            <div class="row">
                <div class="card  bg-primary">
                    <div class="card-header text-center text-white">
                        <h3>Bind Country State City</h3>
                    </div>
                    <div class="card card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label ID="lblmsg" runat="server" CssClass="alert-danger" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="card-group">
                                <div class="col-md-4">
                                    <label>Country</label>
                                    <asp:DropDownList ID="ddlcountry" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                             <div class="card-group">
                                <div class="col-md-4">
                                    <label>State</label>
                                    <asp:DropDownList ID="ddlstate" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                             <div class="card-group">
                                <div class="col-md-4">
                                    <label>District</label>
                                    <asp:DropDownList ID="ddldist" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddldist_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                             <div class="card-group">
                                <div class="col-md-4">
                                    <label>Village</label>
                                   <asp:DropDownList ID="ddlvillage" runat="server" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
