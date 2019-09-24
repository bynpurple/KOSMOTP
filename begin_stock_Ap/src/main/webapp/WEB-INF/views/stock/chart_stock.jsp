<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div id="chartdivnew" style="height: 630px;">
   </div>
   
   <script>
   //[Dashboard chart Javascript]

   //Project:   Crypto Admin - Responsive Admin Template
   //-----amchart

   am4core.ready(function() {

   // Themes begin
   am4core.useTheme(am4themes_dark);
   am4core.useTheme(am4themes_animated);
   // Themes end

   var chart = am4core.create("chartdivnew", am4charts.XYChart);
   chart.paddingRight = 20;

   chart.dateFormatter.inputDateFormat = "YYYY-MM-dd";

   var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
   dateAxis.renderer.grid.template.location = 0;

   var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
   valueAxis.tooltip.disabled = true;

   var series = chart.series.push(new am4charts.OHLCSeries());
   series.dataFields.dateX = "date";
   series.dataFields.valueY = "close";
   series.dataFields.openValueY = "open";
   series.dataFields.lowValueY = "low";
   series.dataFields.highValueY = "high";
   series.tooltipText = "Open:${openValueY.value}\nLow:${lowValueY.value}\nHigh:${highValueY.value}\nClose:${valueY.value}";
   series.strokeWidth = 2;

   chart.cursor = new am4charts.XYCursor();

   // a separate series for scrollbar
   var lineSeries = chart.series.push(new am4charts.LineSeries());
   lineSeries.dataFields.dateX = "date";
   lineSeries.dataFields.valueY = "close";
   // need to set on default state, as initially series is "show"
   lineSeries.defaultState.properties.visible = false;

   // hide from legend too (in case there is one)
   lineSeries.hiddenInLegend = true;
   lineSeries.fillOpacity = 0.5;
   lineSeries.strokeOpacity = 0.5;

   var scrollbarX = new am4charts.XYChartScrollbar();
   scrollbarX.series.push(lineSeries);
   chart.scrollbarX = scrollbarX;

   chart.data = [${chart}];

   chart.events.on("inited", function() {
     dateAxis.zoomToDates(new Date(2011, 7, 28), new Date(2011, 8, 28))
   });

   }); // end am4core.ready()

   </script>
</body>
</html>