package com.bjit.controller;


import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import com.bjit.modal.Customer;
import com.bjit.modal.Product;
import com.bjit.modal.Temp;
import com.bjit.response.CustomerJsonRespone;
import com.bjit.service.CustomerService;
import com.bjit.service.ProductService;

@RunWith(MockitoJUnitRunner.class)
public class MainControllerTest {
	
	@Mock
	static CustomerService customerService;
	
	@Mock
	ProductService productService;
	
	@InjectMocks
	MainController mainController;
	
	static MockMvc mockMvc;
	
	static private Customer customer1;
	static private Customer customer2;
	static private Product p1;
	static private Product p2;
	static private Product p3;
	
	@BeforeClass
	public static void beforeMainControllerTest() {
		customer1 = new Customer();
		customer2 = new Customer();
		
		customer1.setInvoiceDate("12/12/12");
		customer1.setId(1);
		customer1.setPaymentTerms("paymentTerms");
		customer1.setSalesperson("salesperson");
		customer1.setStatus("");
		
		customer2.setInvoiceDate("11/11/11");
		customer2.setId(2);
		customer2.setPaymentTerms("paymentTerms");
		customer2.setSalesperson("salesperson");
		customer2.setStatus("");
		
		p1 = new Product();
		p2 = new Product();
		p3 = new Product();
		
		p1.setAmount(100.0);
		p1.setCustomerId("XXV-001");
		p1.setDescription("ABC");
		p1.setProduct("MOUSE");
		p1.setQuantity(2);
		p1.setUnitPrice(4);
		p1.setTotal(8);
		
		p2.setAmount(200.0);
		p2.setCustomerId("XXV-001");
		p2.setDescription("DEF");
		p2.setProduct("KEYBOARD");
		p2.setQuantity(3);
		p2.setUnitPrice(6);
		p2.setTotal(18);
		
		p3.setAmount(400.0);
		p3.setCustomerId("XXV-001");
		p3.setDescription("XYZ");
		p3.setProduct("DESKTOP");
		p3.setQuantity(5);
		p3.setUnitPrice(4);
		p3.setTotal(20);
	}
	
	@Before
	public void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(mainController).build();
	}
	
	@Test
	public void customerPrint() throws Exception{
		
		List<Customer> list = new ArrayList<Customer>();
		
		list.add(customer1);
		list.add(customer2);
		System.out.println(list);
		
		when(customerService.getPage(1)).thenReturn(list);
		mockMvc.perform(get("/showCustomer?page=1").accept(MediaType.APPLICATION_JSON))
			.andDo(MockMvcResultHandlers.print());
	}
	@Test
	public void productPrint() throws Exception{
		
		List<Product> list = new ArrayList<Product>();
		
		list.add(p1);
		list.add(p2);
		list.add(p3);
		System.out.println(list);
		
		when(productService.getPage(1)).thenReturn(list);
		mockMvc.perform(get("/showInvoice?page=1").accept(MediaType.APPLICATION_JSON)).andDo(MockMvcResultHandlers.print());
	}
	@Test
	public void nextCustomer() throws Exception{
		
		List<Customer> list = new ArrayList<Customer>();
		
		list.add(customer1);
		list.add(customer2);
		System.out.println(list);
		
		when(customerService.getPage(1)).thenReturn(list);
		mockMvc.perform(get("/nextCustomer?page=1").accept(MediaType.APPLICATION_JSON))
			.andDo(MockMvcResultHandlers.print());
	}

	@Test
	public void index() throws Exception{
		
		MainControllerTest.mockMvc.perform(get("/")) 
		.andExpect(status().isOk()) 
		.andExpect(view()
		.name("index")) 
		.andDo(print());
		
	}
	@Test
	public void dashboard() throws Exception{
		
		this.mockMvc.perform(get("/dashboard")) 
		.andExpect(status().isOk()) 
		.andExpect(view()
		.name("index")) 
		.andDo(print());
		
	}
	@Test
	public void editInvo() throws Exception{
		when(customerService.findOne(2)).thenReturn(customer1);
		MainControllerTest.mockMvc.perform(get("/editInvoice?id=2")) 
		.andExpect(status().isOk()) 
		.andExpect(view()
		.name("editInvoice")) 
		.andDo(print());
	}
	@Test
	public void showInvo() throws Exception{
List<Customer> list = new ArrayList<Customer>();
		
		list.add(customer1);
		list.add(customer2);
		System.out.println(list);
		when(customerService.findOne(2)).thenReturn(customer1);
		MainControllerTest.mockMvc.perform(get("/showInvoice?param=2"))
		.andExpect(status().isOk()) 
		.andExpect(view()
		.name("showInvoice")) 
		.andDo(print());
	}
//	@Test
//	public void createInvoice() throws Exception{
//		
//		MainControllerTest.mockMvc.perform(get("/create_invoice")) 
//		.andExpect(status().isOk()) 
//		.andExpect(view()
//		.name("create_invoice")) 
//		.andDo(print());
//		
//	}
//	@Test
//	public void addCustomer() throws Exception{
//		List<Customer> list = new ArrayList<Customer>();
//		
//		list.add(customer1);
//		list.add(customer2);
//		System.out.println(list);
//		
//		//when(customerService.getPage(1)).thenReturn(list);
//		when(customerService.save(customer1)).thenReturn(list);
//		mockMvc.perform(post("/addCustomer").accept(MediaType.APPLICATION_JSON))
//		.andDo(MockMvcResultHandlers.print());
//	}
//	@Test
//	public void invoiceDetails() throws Exception{
//		
//		MainControllerTest.mockMvc.perform(get("/invoiceDetails")) 
//		.andExpect(status().isOk()) 
//		.andExpect(view()
//		.name("invoiceDetails")) 
//		.andDo(print());
//		
//	}
}
