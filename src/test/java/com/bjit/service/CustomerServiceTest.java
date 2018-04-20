package com.bjit.service;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;
import com.bjit.modal.Customer;
import com.bjit.repository.CustomerRepository;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class CustomerServiceTest {

	@Mock
	CustomerRepository customerRepository;
	@Autowired
	private CustomerService customerService;
	
	static private Customer customer;
	
	@BeforeClass
	public static void beforeCustomerServiceTest() {
		customer = new Customer();
		customer.setInvoiceDate("12/12/12");
		customer.setId(1);
		customer.setPaymentTerms("paymentTerms");
		customer.setSalesperson("salesperson");
		customer.setStatus("Draft");
		customer.setDueDate("11/11/11");
		customer.setCustomer("customer");
		customer.setSourceDocument("sourceDocument");
	}
	@AfterClass
	public static void afterCustomerServiceTest() {
		
	}
	@Test
	public void shouldGetCustomerById() throws Exception {
		when(customerRepository.findOne(1)).thenReturn(customer);

		Customer customer1 = customerRepository.findOne(1);
		System.out.println(customer1);
		System.out.println(customer);
		assertEquals(customer, customer1);
	}
	@Test
	public void shouldAddCustomer() throws Exception {
		when(customerRepository.save(customer)).thenReturn(customer);

		Customer cus = customerRepository.save(customer);
		assertEquals(cus, customer);
	}
	@Test
	public void shouldGetAllCustomer() throws Exception {
		customer = new Customer();
		customer.setInvoiceDate("12/12/12");
		customer.setId(1);
		customer.setPaymentTerms("paymentTerms");
		customer.setSalesperson("salesperson");
		customer.setStatus("Draft");
		customer.setDueDate("11/11/11");
		customer.setCustomer("customer");
		customer.setSourceDocument("sourceDocument");
		Customer customer2 = new Customer();
		customer2.setInvoiceDate("12/12/12");
		customer2.setId(2);
		customer2.setPaymentTerms("paymentTerms");
		customer2.setSalesperson("salesperson");
		customer2.setStatus("Draft");
		customer2.setDueDate("11/11/11");
		customer2.setCustomer("customer");
		customer2.setSourceDocument("sourceDocument");
		
		List<Customer> list = new ArrayList<Customer>();
		list.add(customer);
		list.add(customer2);
		when(customerService.getPage(0)).thenReturn(list);
		List<Customer> list2 = new ArrayList<Customer>();
		list2 = (List<Customer>) customerService.getPage(1);
	}
}
