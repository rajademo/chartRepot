/**
 * 
 */
package com.raja.appcontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.util.Rotation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.googlecode.charts4j.Color;
import com.googlecode.charts4j.GCharts;
import com.googlecode.charts4j.PieChart;
import com.googlecode.charts4j.Slice;

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
		
		List<Product> productList = new ArrayList<Product>();
		productList.add(createProduct("IBM MQ 6.0","2000, 8, 5","2011, 8, 5"));
		productList.add(createProduct("Apache 2.2","2000, 8, 5","2013, 3, 5"));
		productList.add(createProduct("Apache 2.4","2000, 8, 5","2013, 8, 5"));
		productList.add(createProduct("Tibco AMX 2.2.1","2000, 8, 5","2016, 2, 15"));
		productList.add(createProduct("Tibco AMX 3.2","2000, 8, 5","2010, 8, 5"));
		productList.add(createProduct("Tibco EMS 5.1.5","2000, 8, 5","2015, 0, 5"));
		productList.add(createProduct("Tibco EMS 6.1","2000, 8, 5","2016, 11, 30"));
		productList.add(createProduct("Tibco EMS 8.1","2000, 8, 5","2010, 8, 5"));
		productList.add(createProduct("Jboss 5","2000, 8, 5","2016, 10, 5"));
		productList.add(createProduct("Jboss 4","2000, 8, 5","2013, 0, 30"));
		productList.add(createProduct("IBM Websphere 7","2000, 8, 5","2015, 8, 5"));
		productList.add(createProduct("IBM Websphere 8","2000, 8, 5","2017, 8, 5"));
		productList.add(createProduct("IBM HttpServer 8","2000, 8, 5","2014, 8, 5"));
		productList.add(createProduct("IBM HttpServer 7","2000, 8, 5","2012, 8, 5"));
		productList.add(createProduct("vFabric tcServer 2.9","2000, 8, 5","2017, 0, 30"));
		productList.add(createProduct("vFabric tcServer 2.7","2000, 8, 5","2015, 8, 30"));
		productList.add(createProduct("vFabric tcServer 2.5","2000, 8, 5","2015, 2, 30"));

		
		
		List<String> lstString = new ArrayList<String>();
		lstString.add("IBM MQ 6.0");
		lstString.add("Apache 2.2");
		lstString.add("Apache 2.4");
		lstString.add("Tibco AMX 2.2.1");
		lstString.add("Tibco AMX 3.2");
		lstString.add("Tibco EMS 5.1.5");
		lstString.add("Tibco EMS 6.1");
		lstString.add("Tibco EMS 8.1");
		lstString.add("Jboss 5");
		lstString.add("Jboss 4");
		lstString.add("IBM Websphere 7");
		lstString.add("IBM Websphere 8");
		lstString.add("IBM HttpServer 8");
		lstString.add("IBM HttpServer 7");
		lstString.add("vFabric tcServer 2.9");
		lstString.add("vFabric tcServer 2.7");
		lstString.add("vFabric tcServer 2.5");
		
		System.out.println("lstString:: "+lstString.size());
		
		List<String> expirationDateList = new ArrayList<String>();
		expirationDateList.add("2000, 8, 5");
		expirationDateList.add("2010, 8, 5");
		expirationDateList.add("2003, 8, 5");
		expirationDateList.add("2001, 8, 5");
		expirationDateList.add("2007, 9, 5");
		expirationDateList.add("2010, 8, 5");
		expirationDateList.add("2000, 3, 5");
		expirationDateList.add("2010, 7, 5");
		expirationDateList.add("2000, 2, 5");
		expirationDateList.add("2010, 6, 5");
		expirationDateList.add("2000, 8, 5");
		expirationDateList.add("2010, 8, 5");
		expirationDateList.add("2000, 8, 5");
		expirationDateList.add("2010, 8, 5");
		expirationDateList.add("2003, 8, 5");
		expirationDateList.add("2010, 8, 5");
		expirationDateList.add("2020, 8, 5");
		
		System.out.println("expirationDateList:: "+expirationDateList.size());
		
		model.addAttribute("stringList", lstString);
		model.addAttribute("expirationDateList", expirationDateList);
		model.addAttribute("productList", productList);

		return "display";
	}
	
	
	public Product createProduct(String productName, String startDate, String endDate) {
		Product product = new Product();
		product.setStrProductName(productName);
		product.setStrStartDate(startDate);
		product.setStrEndDate(endDate);
		return product;
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
		pdSet.setValue("TCServer", 15);
		pdSet.setValue("JBoss", 50);
		pdSet.setValue("SpringBoot", 25);
		pdSet.setValue("Others", 10);
		return pdSet;
	}
	
	private JFreeChart createChart(PieDataset pdSet, String title) {
		JFreeChart chart = ChartFactory.createPieChart3D(title, pdSet, true, true, false);
		
		/*PiePlot3D plot = (PiePlot3D)chart.getPlot();
		plot.setStartAngle(290);
		plot.setDirection(Rotation.CLOCKWISE);
		//plot.setForegroundAlpha(0.5f);
		plot.setLabelGap(0.02);*/
		
		
        
        PiePlot plot = (PiePlot) chart.getPlot();
        //plot.setLabelFont(new Font("SansSerif", Font.PLAIN, 12));
        plot.setNoDataMessage("No data available");
        plot.setCircular(false);
        plot.setLabelGap(0.02);
        return chart;
        
        
	}
	
}
