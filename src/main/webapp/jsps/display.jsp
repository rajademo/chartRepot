<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Google Pie Chart Demo</title>
		<script>
		
		//var schoolList=new Array();
		
		function init() {
			var schoolList=${stringList};
			
			alert();
		}
	</script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      
      function drawVisualization3() {
          // Some raw data (not necessarily accurate)
          /*var data = google.visualization.arrayToDataTable([
           ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda','GOA', 'Average'],
           ['2004/05',  165,      938,         522,             998,           450, 200,     614.6]
        ]);
*/

/*
var data = new google.visualization.DataTable();
data.addColumn('string', 'Year');
data.addColumn('date', 'Sales');
data.addColumn('date', 'SalesMax');
*/


      var options = {
        title : 'Monthly Coffee Production by Country',
        vAxis: {title: 'Cups'},
        hAxis: {title: 'Month'},
        seriesType: 'bars',
        series: {6: {type: 'line'}}
      };

      var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
      
      function drawVisualization() {
    	  
    	 /* var data = google.visualization.arrayToDataTable([
    	                                                    ["Team", {type: 'date', label: 'Season Start Date'}, {type: 'date', label: 'Season End Date'}],
    	                                                    ["Baltimore Ravens",     "Date(2000, 8, 5)", "Date(2001, 1, 5)"],
    	                                                    ["New England Patriots", "Date(2001, 8, 5)", "Date(2002, 1, 5)"],
    	                                                    ["Tampa Bay Buccaneers", "Date(2002, 8, 5)", "Date(2003, 1, 5)"],
    	                                                    ["New England Patriots", "Date(2003, 8, 5)", "Date(2004, 1, 5)"],
    	                                                    ["New England Patriots", "Date(2004, 8, 5)", "Date(2005, 1, 5)"],
    	                                                    ["Pittsburgh Steelers",  "Date(2005, 8, 5)", "Date(2006, 1, 5)"],
    	                                                    ["Indianapolis Colts",   "Date(2006, 8, 5)", "Date(2007, 1, 5)"],
    	                                                    ["New York Giants",      "Date(2007, 8, 5)", "Date(2008, 1, 5)"],
    	                                                    ["Pittsburgh Steelers",  "Date(2008, 8, 5)", "Date(2009, 1, 5)"],
    	                                                    ["New Orleans Saints",   "Date(2009, 8, 5)", "Date(2010, 1, 5)"],
    	                                                    ["Green Bay Packers",    "Date(2010, 8, 5)", "Date(2011, 1, 5)"],
    	                                                    ["New York Giants",      "Date(2011, 8, 5)", "Date(2012, 1, 5)"],
    	                                                    ["Baltimore Ravens",     "Date(2012, 8, 5)", "Date(2013, 1, 5)"],
    	                                                    ["Seattle Seahawks",     "Date(2013, 8, 5)", "Date(2014, 1, 5)"]
    	                                                  ]); */
    	  
    	  var data = new google.visualization.DataTable();
    	  data.addColumn('string', 'Year');
          data.addColumn('date', 'IBM');
          data.addColumn('date', 'Tomcat');
          data.addColumn('date', 'Apache');
          
          data.addRows(1);
          data.setValue(0, 0, '');
          data.setValue(0, 1, new Date(2000, 8, 5));
          data.setValue(0, 2, new Date(1999, 8, 5));
          data.setValue(0, 3, new Date(2010, 8, 5));

         /* data.setValue(1, 0, '2005');
          data.setValue(1, 1, Date(2000, 8, 5));
          data.setValue(1, 2, Date(2000, 8, 5));

          data.setValue(2, 0, '2006');
          data.setValue(2, 1,Date(2000, 8, 5));
          data.setValue(2, 2, Date(2000, 8, 5));

          data.setValue(3, 0, '2007');
          data.setValue(3, 1, Date(2000, 8, 5));
          data.setValue(3, 2, Date(2000, 8, 5)); */
          
        /*  var data = google.visualization.arrayToDataTable([
                                                            ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda','GOA', 'Average'],
                                                            ['2004/05',  165,      938,         522,             998,           450, 200,     614.6]
                                                         ]);
          */
          
         
          
          var options = {
        	      title : 'Server contract',
        	      vAxis: {title: 'Year'},
        	      hAxis: {title: 'Servers'},
        	      seriesType: 'bars',
        	      series: {6: {type: 'line'}}
        	    };
        //  options.vAxis.format = 'MMM dd, yyyy';

        	    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        	    chart.draw(data, options);
      }
      
      
      function drawVisualization1() {
        // Some raw data (not necessarily accurate)
         var data = google.visualization.arrayToDataTable([
         ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
         
         ['2004/05',  136,      691,         629,             1026,          366,      569.6]
      ]);
        
       /* 
       var data = google.visualization.arrayToDataTable([
           ['Year', 'Visitations', { role: 'style' } , 'Average'],
           ['2010', 10, 'color: gray', 10],
           ['2020', 14, 'color: #76A7FA', 10],
           ['2030', 16, 'opacity: 0.2' , 10],
           ['2040', 22, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF',10],
           ['2050', 28, 'stroke-color: #871B47; stroke-opacity: 0.6; stroke-width: 8; fill-color: #BC5679; fill-opacity: 0.2',10]
         ]);
*/
/*
var data = google.visualization.arrayToDataTable([
    ['Month', 'Value', 'Average'],
    ['Bolivia',  165,     145],
    ['Ecuador',  135,        145],
    ['Madagascar',  157,       145],
    ['Papua New Guinea',  139,       145],
    ['Rwanda',  136,         145]
 ]);
 */                                          
    var options = {
      title : 'Monthly Coffee Production by Country',
      vAxis: {title: 'Cups'},
      hAxis: {title: 'Month'},
      seriesType: 'bars',
      series: {5: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
      
      
    </script>
    
	</head>
	<body onload="javascript:init();">
	
	<h1>one</h1>
		<img alt="Server Pie Chart" src=${pieUrl} /> <br/>
		<h1>two</h1>
		<img alt="Server Pie Chart" src=${pieUrl2} />
		
		<div id="chart_div" style="width: 900px; height: 500px;"></div>
		
	</body>
</html>