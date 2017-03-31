        <html>
<head>
		<script type="text/javascript" src="http://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load('visualization', '1.1', {packages: ['controls']});
            google.load('visualization', '1', {packages:['table']});
	  
		function drawVisualization() {
        // Prepare the data
       var query = new google.visualization.Query('http://spreadsheets.google.com/tq?key=0AozvCNI02VmpdFBsVkxOQ3NENVZ1djhxVmZUNUdtY0E&single=true&gid=0&pub=1');
                query.send(handleQueryResponse);
            }
            function handleQueryResponse(response) {
			
			var data = new google.visualization.DataTable({
				  cols: [
							{"id":"A","label":"Surveyor","type":"string"},
							{"id":"B","label":"Surveyed","type":"string"},
							{"id":"C","label":"SurveyedCount","type":"number","pattern":"#,##0.###############"}
						],
				  rows: [
							{"c":[{"v":"Chandra"},{"v":"A"},{"v":29.0,"f":"29"}]},
							{"c":[{"v":"Chandra"},{"v":"B"},{"v":31.0,"f":"31"}]},
							{"c":[{"v":"rafiq"},{"v":"C"},{"v":26.0,"f":"26"}]},
							{"c":[{"v":"rafiq"},{"v":"D"},{"v":30.0,"f":"30"}]},
							{"c":[{"v":"rafiq"},{"v":"E"},{"v":29.0,"f":"29"}]},
							{"c":[{"v":"lakshmisha"},{"v":"F"},{"v":24.0,"f":"24"}]},
							{"c":[{"v":"lakshmisha"},{"v":"G"},{"v":23.0,"f":"23"}]},
							{"c":[{"v":"lakshmisha"},{"v":"H"},{"v":21.0,"f":"21"}]},
							{"c":[{"v":"lakshmisha"},{"v":"I"},{"v":26.0,"f":"26"}]},
							{"c":[{"v":"gopi"},{"v":"J"},{"v":22.0,"f":"22"}]},
							{"c":[{"v":"gopi"},{"v":"K"},{"v":25.0,"f":"25"}]},
							{"c":[{"v":"gopi"},{"v":"L"},{"v":27.0,"f":"27"}]}
						]
				});
               //data = response.getDataTable();
    
                // Define category pickers ////////////////
                var divPicker = new google.visualization.ControlWrapper({
                    'controlType': 'CategoryFilter',
                    'containerId': 'control1',
                    'options': {
                        'filterColumnLabel': 'Surveyor',
                        'ui': {
                            'labelStacking': 'vertical',
                            'allowTyping': false,
                            'allowMultiple': false
                        }
                    }
                });
      
                var subdivPicker = new google.visualization.ControlWrapper({
                    'controlType': 'CategoryFilter',
                    'containerId': 'control2',
                    'options': {
                        'filterColumnLabel': 'Surveyed',
                        'ui': {
                            'labelStacking': 'vertical',
                            'allowTyping': false,
                            'allowMultiple': false
                        }
                    }
                });
		
                // Define a column chart
                var columnChart = new google.visualization.ChartWrapper({
                    'chartType': 'ColumnChart',
                    'containerId': 'chart2',
                    // Configure the column chart
                    'view': {'columns': [1, 2]}
                }); 
		
                var table = new google.visualization.ChartWrapper({
                    'chartType': 'Table',
                    'containerId': 'chart1',
                    'options': {
                        'width': '100%'
                    },
                    'view': {'columns': [0, 1, 2]}
                }); 
	
                var columnChart1  = new google.visualization.ChartWrapper({
                    'chartType': 'ColumnChart',
                    'containerId': 'chart3',
                    //group the data for the pie chart
                    'dataTable' : google.visualization.data.group(
						data, [0], [
								{'column': 2, 'aggregation': google.visualization.data.sum, 'type': 'number'}
							])
                });  
          //      columnChart1.draw();
	
                // Create the dashboard.
                new google.visualization.Dashboard(document.getElementById('dashboard')).
                    // Configure & bind the controls 
                bind(divPicker, subdivPicker).
                    bind(subdivPicker, [table, columnChart]).
                    // Draw the dashboard
                draw(data);   
   
			google.visualization.events.addListener(subdivPicker, 'ready',
   
                function(event) {
                    // group the data of the filtered table and set the result in the pie chart.
                    columnChart1.setDataTable( google.visualization.data.group(
                    // get the filtered results
                    table.getDataTable(),
                    [0],
                    [{'column': 2, 'aggregation': google.visualization.data.sum, 'type': 'number'}]
                ));
                    // redraw the pie chart to reflect changes
                    columnChart1.draw();
                });
				
				google.visualization.events.addListener(subdivPicker, 'statechange',
   
                function(event) {
                    // group the data of the filtered table and set the result in the pie chart.
                    columnChart1.setDataTable( google.visualization.data.group(
                    // get the filtered results
                    table.getDataTable(),
                    [0],
                    [{'column': 2, 'aggregation': google.visualization.data.sum, 'type': 'number'}]
                ));
                    // redraw the pie chart to reflect changes
                    columnChart1.draw();
                });

            }
      
            google.setOnLoadCallback(drawVisualization);
			google.setOnLoadCallback(drawVisualization1);
        </script>

    </head>
    <body style="font-family: Arial;border: 0 none;">
        <div id="dashboard">
            <table width="100%">
                <tr style='vertical-align: top'>
                    <td style='width: 17%; font-size: 0.9em;'>dfdggsgsfgf8989898
                        <div id="control1"></div>
                        <div id="control2"></div> 
                    </td>
                    <td>
                        <div style="float: left;" id="chart2"></div>
                    </td>
                    <td>
					<div style="float: left;" id="chart3"></div>
                    </td>
                </tr>
                <tr><td>&nbsp;</td>
                    <td><div style=" " id="chart1"></div>  
                    </td><td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </body>
	
