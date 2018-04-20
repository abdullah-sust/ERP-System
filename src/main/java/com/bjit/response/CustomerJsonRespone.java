package com.bjit.response;

import java.util.List;
import java.util.Map;
import com.bjit.modal.Customer;

public class CustomerJsonRespone {
	private Customer customer;
	private boolean validated;
	private Map<String, String> errorMessages;
	private List<Customer> allCustomer;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public boolean isValidated() {
		return validated;
	}
	public void setValidated(boolean validated) {
		this.validated = validated;
	}
	public Map<String, String> getErrorMessages() {
		return errorMessages;
	}
	public void setErrorMessages(Map<String, String> errorMessages) {
		this.errorMessages = errorMessages;
	}
	public List<Customer> getAllCustomer() {
		return allCustomer;
	}
	public void setAllCustomer(List<Customer> allCustomer) {
		this.allCustomer = allCustomer;
	}
}
