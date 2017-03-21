<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
    	  
    	  var arrVar = new Array();
			<c:forEach items="${stringList}" var="ctag">
              //arrVar.push(+ ${ctag} + "'");
              arrVar.push("\'${ctag}\'");
      	</c:forEach>
      	
      	// alert(arrVar);
        // Some raw data (not necessarily accurate)
       /*
        var data = google.visualization.arrayToDataTable([
         ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
         ['2004/05',  165,      938,         522,             998,           450,      614.6],
         ['2005/06',  135,      1120,        599,             1268,          288,      682],
         ['2006/07',  157,      1167,        587,             807,           397,      623],
         ['2007/08',  139,      1110,        615,             968,           215,      609.4],
         ['2008/09',  136,      691,         629,             1026,          366,      569.6]
      ]);
        */
        
        
        
        var data = new google.visualization.DataTable();
  	  	data.addColumn('string', 'Year');
        
	  	<c:forEach items="${stringList}" var="ctag">
	  	  	data.addColumn('date', "\'${ctag}\'");
	  	 </c:forEach>
        
  	 	/* data.addColumn('date', 'Tomcat');
        data.addColumn('date', 'Apache'); */
        
        data.addRows(1);
        data.setValue(0, 0, '');
        i = 1;
        <c:forEach items="${expirationDateList}" var="expirationDate">
  	  		//data.addColumn('date', "\'${ctag}\'");
  	  		data.setValue(0, i, new Date(${expirationDate}));
  	  		i++;
  	 	</c:forEach>
        
        /*data.setValue(0, 0, '');
        data.setValue(0, 1, new Date(2000, 8, 5));
        data.setValue(0, 2, new Date(1999, 8, 5));
        data.setValue(0, 3, new Date(2010, 8, 5)); */
        

        var options = {
      	      title : 'Server contract',
      	      vAxis: {title: 'Year'},
      	      hAxis: {title: 'Servers'},
      	      seriesType: 'bars'
      	      //series: {6: {type: 'line'}}
      	    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 500px; height: 500px;"></div>
  </body>
</html>
