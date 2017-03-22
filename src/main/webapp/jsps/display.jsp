<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart','table','bar','timeline']});
     // google.charts.load('current', {'packages':['table']});
       google.charts.setOnLoadCallback(drawVisualization);
       google.charts.setOnLoadCallback(drawTable);
       google.charts.setOnLoadCallback(usageChart);
       google.charts.setOnLoadCallback(drawTimeLine);
       
      function drawVisualization() {
    	  
        var data = new google.visualization.DataTable();
  	  	data.addColumn('string', 'Year');
        
	  	<c:forEach items="${productList}" var="product">
	  	  	data.addColumn('date', "\'${product.getStrProductName()}\'");
	  	 </c:forEach>
        
        data.addRows(1);
        data.setValue(0, 0, '');
        i = 1;
        <c:forEach items="${productList}" var="product">
  	  		data.setValue(0, i, new Date(${product.getStrEndDate()}));
  	  		i++;
  	 	</c:forEach>
        
        var options = {
      	      title : 'Support',
      	      vAxis: {title: 'Vendor EOL'},
      	      hAxis: {title: 'Product Name'},
      	      seriesType: 'bars'
      	      //series: {6: {type: 'line'}}
      	    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
    
       function drawTable() {
    	   // alert(${fn:length(productList)});
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Name');
          data.addColumn('date', 'Start Date');
          data.addColumn('date', 'End Date');
         // data.addColumn('boolean', 'Full Time Employee');
          
          var rowIterator = 0; 
          <c:forEach items="${productList}" var="product">
          	data.addRows(1);
          	data.setValue(rowIterator,0, "\'${product.getStrProductName()}\'");
          	data.setValue(rowIterator,1,new Date(${product.getStrStartDate()}));
            data.setValue(rowIterator,2,new Date(${product.getStrEndDate()}));
            rowIterator++;
  	 	  </c:forEach>
          
  	 	  var table = new google.visualization.Table(document.getElementById('table_div'));
          table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
        } 
       
       //Usage Chart
       function usageChart() {
    	   
    	   var data = new google.visualization.DataTable();
           data.addColumn('string', 'Name');
           data.addColumn('number', 'Available');
           data.addColumn('number', 'Used');
           
           var rowIterator = 0; 
           <c:forEach items="${usageList}" var="usage">
           	data.addRows(1);
           	data.setValue(rowIterator,0, "\'${usage.getStrProductName()}\'");
           	data.setValue(rowIterator,1, ${usage.getAvailableLicense()});
             data.setValue(rowIterator,2,${usage.getUsedLicense()});
             rowIterator++;
   	 	  </c:forEach>

           var options = {
             chart: {
               title: 'Product Usage',
               subtitle: '',
             }
           };

           var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

           chart.draw(data, options);
         }
       
       //TimeLine
       function drawTimeLine() {
    	   
    	   var data = new google.visualization.DataTable();
    	   data.addColumn('string', 'Name');
           data.addColumn('date', 'Start Date');
           data.addColumn('date', 'End Date');
           
           var rowIterator = 0; 
           <c:forEach items="${productList}" var="product">
           		data.addRows(1);
           		data.setValue(rowIterator,0, "\'${product.getStrProductName()}\'");
           		data.setValue(rowIterator,1,new Date(${product.getStrStartDate()}));
             	data.setValue(rowIterator,2,new Date(${product.getStrEndDate()}));
             	rowIterator++;
   	 	  </c:forEach>
           
    	      var options = {
    	        height: 450,
    	        timeline: {
    	          groupByRowLabel: true
    	        }
    	      	
    	      };

    	      var chart = new google.visualization.Timeline(document.getElementById('timeline_div'));

    	      chart.draw(data, options);
    	    }
    </script>
  </head>
  <body>
  	<table width="100%" border="0">
  		<tr>
  			<td width="60%"><div id="chart_div" style="width: 900px; height: 500px;"></div></td>
  			<td width="40%" valign="top"><div id="table_div"></div></td>
  		</tr>
  		<tr>
  			<td><div id="columnchart_material" style="width: 900px; height: 500px;"></div></td>
  			<td><div id="timeline_div"></div></td>
  		</tr>
  	</table>
    
  </body>
</html>
