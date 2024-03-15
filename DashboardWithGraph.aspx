<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="DashboardWithGraph.aspx.cs" Inherits="DashboardWithGraph" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<%--<script src="http://code.jquery.com/jquery-1.8.2.js"></script>--%>
<script src="http://www.google.com/jsapi" type="text/javascript"></script>
    <script type="text/javascript">
        // Global variable to hold data
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'DashboardWithGraph.aspx/GetChartData',
                data: '{}',
                success:
                    function (response) {
                        drawchart(response.d);
                    },

                error: function () {
                    alert("Error loading data! Please try again.");
                }
            });
        })
        function drawchart(dataValues) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Countryname, dataValues[i].Total]);
            }
            //new google.visualization.PieChart(document.getElementById('chartdiv')).
            //    draw(data, { title: "Show Google Chart in Asp.net" });
             //new google.visualization.BarChart(document.getElementById('chartdiv')).
             //   draw(data, { title: "Show Google Chart in Asp.net" });
            //new google.visualization.ColumnChart(document.getElementById('chartdiv')).
            //    draw(data, { title: "Show Google Chart in Asp.net" });  LineChart
            new google.visualization.LineChart(document.getElementById('chartdiv')).
                draw(data, { title: "Show Google Chart in Asp.net" });  
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="chartdiv" style="width: 600px; height: 350px;"></div>
     <div>  
    <h4 style="color: green;">  
        Article for C#Corner  
    </h4>
    <asp:Chart ID="Chart1" runat="server" BackColor="120, 120, 64" BackGradientStyle="LeftRight"  
        BorderlineWidth="0" Height="360px" Palette="None" PaletteCustomColors="Maroon"  
        Width="380px" BorderlineColor="64, 0, 64">  
        <Titles>  
            <asp:Title ShadowOffset="10" Name="Items" />  
        </Titles>  
        <Legends>  
            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"  
                LegendStyle="Row" />  
        </Legends>  
        <Series>  
            <asp:Series Name="Default" />  
        </Series>  
        <ChartAreas>  
            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />  
        </ChartAreas>  
    </asp:Chart>  
    </div>  
</asp:Content>

