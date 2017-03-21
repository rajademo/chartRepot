/**
 * 
 */
package com.himtech.googlechart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.util.Rotation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.googlecode.charts4j.BarChartPlot;
import com.googlecode.charts4j.Color;
import com.googlecode.charts4j.Data;
import com.googlecode.charts4j.GCharts;
import com.googlecode.charts4j.PieChart;
import com.googlecode.charts4j.Plots;
import com.googlecode.charts4j.Slice;



import com.googlecode.charts4j.AxisLabels; 
import com.googlecode.charts4j.AxisLabelsFactory; 
import com.googlecode.charts4j.AxisStyle; 
import com.googlecode.charts4j.AxisTextAlignment; 
import com.googlecode.charts4j.BarChart; 
import com.googlecode.charts4j.BarChartPlot; 
import com.googlecode.charts4j.Color; 
import com.googlecode.charts4j.Data; 
import com.googlecode.charts4j.DataUtil; 
import com.googlecode.charts4j.Fills; 
import com.googlecode.charts4j.GCharts; 
import com.googlecode.charts4j.LinearGradientFill; 
import com.googlecode.charts4j.Plots;
import com.googlecode.charts4j.Color;
/**
 * @author himanshu
 * 
 */
@Controller
@RequestMapping("/gcharts")
public class GglPieChart
{
	@RequestMapping(value = "/piechart", method = RequestMethod.GET)
	public String drawPieChart(ModelMap model)
	{
		Slice s1 = Slice.newSlice(15, Color.newColor("CACACA"), "TCServer", "TCServer");
		Slice s2 = Slice.newSlice(50, Color.newColor("DF7417"), "JBoss",
				"JBoss");
		Slice s3 = Slice.newSlice(25, Color.newColor("951800"), "SpringBoot",
				"SpringBoot");
		Slice s4 = Slice.newSlice(10, Color.newColor("01A1DB"), "Others",
				"Others");

		PieChart pieChart = GCharts.newPieChart(s1, s2, s3, s4);
		pieChart.setTitle("Server Pie Chart", Color.BLACK, 15);
		pieChart.setSize(720, 360);
		pieChart.setThreeD(true);

		model.addAttribute("pieUrl", pieChart.toURLString());
		
		
		List<String> lstString = new ArrayList<String>();
		lstString.add("Raja");
		lstString.add("Mani");
		String[] arrString = new String[2];
		arrString[0] = "Raja";
		arrString[1] = "Mani";
		
		model.addAttribute("stringList", lstString);
		
		
		// Bar
		
		BarChartPlot team1 = Plots.newBarChartPlot(Data.newData(25, 43, 12, 30), Color.BLUEVIOLET, "Team A"); 
        BarChartPlot team2 = Plots.newBarChartPlot(Data.newData(8, 35, 11, 5), Color.ORANGERED, "Team B"); 
        BarChartPlot team3 = Plots.newBarChartPlot(Data.newData(10, 20, 30, 30), Color.LIMEGREEN, "Team C"); 
 
        // Instantiating chart. 
        BarChart chart = GCharts.newBarChart(team1, team2, team3); 
 
        // Defining axis info and styles 
        AxisStyle axisStyle = AxisStyle.newAxisStyle(Color.BLACK, 13, AxisTextAlignment.CENTER); 
        AxisLabels score = AxisLabelsFactory.newAxisLabels("Score", 50.0); 
        score.setAxisStyle(axisStyle); 
        AxisLabels year = AxisLabelsFactory.newAxisLabels("Year", 50.0); 
        year.setAxisStyle(axisStyle); 
 
        // Adding axis info to chart. 
        chart.addXAxisLabels(AxisLabelsFactory.newAxisLabels("2002", "2003", "2004", "2005")); 
        chart.addYAxisLabels(AxisLabelsFactory.newNumericRangeAxisLabels(0, 100)); 
        chart.addYAxisLabels(score); 
        chart.addXAxisLabels(year); 
 
        chart.setSize(600, 450); 
        chart.setBarWidth(100); 
        chart.setSpaceWithinGroupsOfBars(20); 
        chart.setDataStacked(true); 
        chart.setTitle("Team Scores", Color.BLACK, 16); 
        chart.setGrid(100, 10, 3, 2); 
        chart.setBackgroundFill(Fills.newSolidFill(Color.ALICEBLUE)); 
        LinearGradientFill fill = Fills.newLinearGradientFill(0, Color.LAVENDER, 100); 
        fill.addColorAndOffset(Color.WHITE, 0); 
        chart.setAreaFill(fill); 
        String url = chart.toURLString(); 
        model.addAttribute("pieUrl2", url);
		return "display";
	}
	
	@RequestMapping(value = "/piechartJfree", method = RequestMethod.GET)
	public void drawPieChartJfree(ModelMap model, HttpServletResponse response)
	{
		response.setContentType("image/png");
		PieDataset dataSet = createDataSet();
		
		JFreeChart pieChart = createChart(dataSet, "Server Details");
		//model.addAttribute("pieUrl", pieChart.toString());
		
		try {
			ChartUtilities.writeChartAsPNG(response.getOutputStream(), pieChart, 750, 400);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	private PieDataset createDataSet() {
		DefaultPieDataset pdSet = new DefaultPieDataset();
		pdSet.setValue("TCServer", 100);
		pdSet.setValue("JBoss", 345);
		return pdSet;
	}
	
	private JFreeChart createChart(PieDataset pdSet, String title) {
		JFreeChart chart = ChartFactory.createPieChart3D(title, pdSet, true, true, false);
		
		PiePlot3D plot = (PiePlot3D)chart.getPlot();
		plot.setStartAngle(290);
		plot.setDirection(Rotation.CLOCKWISE);
		plot.setForegroundAlpha(0.5f);
		return chart;
	}
	
}
