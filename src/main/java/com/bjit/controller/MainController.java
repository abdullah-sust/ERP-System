package com.bjit.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bjit.modal.Customer;
import com.bjit.modal.Product;
import com.bjit.modal.Temp;
import com.bjit.repository.CustomerRepository;
import com.bjit.response.CustomerJsonRespone;
import com.bjit.service.CustomerService;
import com.bjit.service.ProductService;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	CustomerService customerService;
	@Autowired
	ProductService productService;
	@GetMapping("")
	public ModelAndView index(Model model) {
		return new ModelAndView("index");
	}
	@GetMapping("create_invoice")
	public ModelAndView createInvoice(Model model) {
		return new ModelAndView("create_invoice");
	}
	@GetMapping("dashboard")
	public ModelAndView dashboard(Model model) {
		return new ModelAndView("index");
	}
	@GetMapping("invoiceDetails")
	public ModelAndView invoiceDetails(Model model) {
		return new ModelAndView("invoiceDetails");
	}
	@RequestMapping(value = "editInvoice", method = RequestMethod.GET)
	public ModelAndView editInvoice(@RequestParam("id") int id){
		Customer customer = new Customer();
		customer = customerService.findOne(id);
		List<Product> products = new ArrayList<Product>();
		List<Product> pro = new ArrayList<Product>();
		products = (List<Product>) productService.getPage(0);
		Iterator<Product> iterator = products.iterator();
		double total = 0, amount = 0, tax = 0;
		while (iterator.hasNext()) {
			Product product = new Product();
			product = iterator.next();
			if(id==Integer.parseInt(product.getCustomerId())) {
				pro.add(product);
				total+=product.getTotal();
				amount+=product.getAmount();
			}
		}
		total+=tax+amount;
		return new ModelAndView("editInvoice").addObject("customer", customer).addObject("product", pro).addObject("total", total).addObject("amount", amount).addObject("tax", tax);
	}
	@GetMapping(value = "showCustomer", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<Customer> showCustomer() {
		List <Customer> list = new ArrayList<Customer>();
		list = (List<Customer>) customerService.getPage(0);
		return list;
	}
	@GetMapping(value = "nextCustomer", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<Customer> nextCustomer(@RequestParam Integer page) {
		List <Customer> list = new ArrayList<Customer>();
		list = (List<Customer>) customerService.getPage(page);
		return list;
	}
	@PostMapping(value="addCustomer", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public CustomerJsonRespone addCustomer(@ModelAttribute @Valid Temp temp, BindingResult result){
		CustomerJsonRespone customerJsonRespone = new CustomerJsonRespone();
		Customer customer = new Customer();
		customer.setCustomer(temp.getCustomer());
		customer.setInvoiceDate(temp.getInvoiceDate());
		customer.setPaymentTerms(temp.getPaymentTerms());
		customer.setSalesperson(temp.getSalesperson());
		customer.setDueDate("13/09/2008");
		customer.setSourceDocument("");
		customer.setStatus("Draft");
		customerService.save(customer);
		return customerJsonRespone;
	}
	@RequestMapping(value = "showInvoice", method = RequestMethod.GET)
	public ModelAndView showInvoice(@RequestParam("param") int param){
		Customer customer = new Customer();
		List<Product> products = new ArrayList<Product>();
		List<Product> pro = new ArrayList<Product>();
		products = (List<Product>) productService.getPage(0);
		Iterator<Product> iterator = products.iterator();
		double total = 0, amount = 0, tax = 0;
		while (iterator.hasNext()) {
			Product product = new Product();
			product = iterator.next();
			if(param==Integer.parseInt(product.getCustomerId())) {
				pro.add(product);
				total+=product.getTotal();
				amount+=product.getAmount();
			}
		}
		total+=tax+amount;
		customer = customerService.findOne(param);
		return new ModelAndView("showInvoice").addObject("customer", customer).addObject("product", pro).addObject("total", total).addObject("amount", amount).addObject("tax", tax);                               
	}
	@PostMapping(value="saveEditInvoice", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public CustomerJsonRespone saveEditInvoice(@ModelAttribute @Valid Temp temp, BindingResult result){
		CustomerJsonRespone customerJsonRespone = new CustomerJsonRespone();
		Customer customer = new Customer();
		customer = customerService.findOne(temp.getId());
		customer.setCustomer(temp.getCustomer());
		customer.setInvoiceDate(temp.getInvoiceDate());
		customer.setPaymentTerms(temp.getPaymentTerms());
		customer.setSalesperson(temp.getSalesperson());
		customerService.save(customer);
		return customerJsonRespone;
	}
}