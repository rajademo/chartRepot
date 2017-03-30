package com.mkyong.core;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.mkyong.core.model.Customer;

public class App {
	private static final String XML_FILE_NAME = "C://Raja//Prg//Spring3-Object-XML-Mapping-Example//Spring3Example//src//main//resources//customer.xml";
	
	public static void main(String[] args) throws IOException {
		ApplicationContext appContext = new ClassPathXmlApplicationContext("App.xml");
		XMLConverter converter = (XMLConverter) appContext.getBean("XMLConverter");
		
		List<Customer> customerList = new ArrayList<Customer>();
		Customer customer = new Customer();
		customer.setName("mkyong");
		customer.setAge(30);
		customer.setFlag(true);
		customer.setAddress("This is address");
		customerList.add(customer);
		customer.setName("mkyong2");
		customer.setAge(30);
		customer.setFlag(true);
		customer.setAddress("This is address");
		customerList.add(customer);
		ObjectMapper objectMapper = new ObjectMapper();
    	//Set pretty printing of json
    	objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
    	JSONObject obj = new JSONObject();
    	
    	
    	Gson gson=new Gson();
		String arrayToJson=gson.toJson(customerList);
		
		TypeReference<List<Customer>> mapType = new TypeReference<List<Customer>>() {};
    	List<Customer> jsonToPersonList = objectMapper.readValue(arrayToJson, mapType);
    	System.out.println("\n2. Convert JSON to List of person objects :");
		
    	for(Customer customer1 : jsonToPersonList) {
    		System.out.println(customer1.getName());
    	}
    	
    	try (FileWriter file = new FileWriter(XML_FILE_NAME)) {

            file.write(arrayToJson);
            file.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }
    	
		
		System.out.println("Convert Object to XML!");
		List<Customer> retrieveList = gson.fromJson(new FileReader(XML_FILE_NAME), List.class);
		System.out.println(retrieveList.size());
		
		
		
	}
}



/*
<dependency>
    <groupId>com.google.code.gson</groupId>
    <artifactId>gson</artifactId>
    <version>2.8.0</version>
</dependency>
*/
