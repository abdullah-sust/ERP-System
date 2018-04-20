package com.bjit.repository;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;
import com.bjit.modal.Customer;

@SuppressWarnings("unused") 
@RunWith(SpringRunner.class) 
@SpringBootTest 
@Transactional
public class CustomerRepositoryTest {
	
	@Autowired
	private CustomerRepository customerRepo; 
	static private Customer customer;
	
	@BeforeClass 
	public static void beforeLeaveRepositoryTest() { 
		customer = new Customer(); 
		customer.setId(1);
		customer.setCustomer("Me");
		customer.setInvoiceDate("12/12/2012");
		customer.setSalesperson("Salesman");
		customer.setPaymentTerms("Payments terms");
		customer.setStatus("Draft");
		customer.setSourceDocument("NULL");
		customer.setDueDate("15/12/2012");
	}
	
	@AfterClass 
	public static void afterLeaveRepositoryTest() {
		
	} 
	
	@Test
	public void shouldGetCustomerById() throws Exception{
		List <Customer> list = (List<Customer>) customerRepo.findAll();
		assertThat(3, equalTo(list.get(2).getId()));
		assertEquals("Oops! some thing went wrong!", 57, ((List<Customer>) customerRepo.findAll()).size());
	}
	
	@Test
	public void shouldAddCustomer() {
		customer = new Customer();
		customer.setId(58);
		customer.setStatus("Draft");
		customer.setSourceDocument("NULL");
		customer.setSalesperson("salesperson");
		customer.setInvoiceDate("12/12/2010");
		customer.setPaymentTerms("paymentTerms");
		customer.setDueDate("12/12/2011");
		customerRepo.save(customer);
	}
	
	@Test
	public void shouldUpdateCustomer() {
		Customer customer1 = customerRepo.findOne(1);
		Customer customer2 = customerRepo.findOne(1);
		//System.out.println(customer1.getInvoiceDate()+customer2.getInvoiceDate());
		customer1.setInvoiceDate("01/01/2010");
		//System.out.println(customer1.getInvoiceDate()+customer2.getInvoiceDate());
		assertEquals(customer1, customer2);
	}
}
