package com.bjit.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bjit.modal.Customer;
import com.bjit.repository.CustomerRepository;

@Service
public class CustomerService {
	
	public static final int size = 5;
	@Autowired
	CustomerRepository customerRepository;
	@Transactional
	public List<Customer> getPage(int pageNum){
		PageRequest pageRequest= new PageRequest(pageNum, size, Sort.Direction.DESC, "id");
		return customerRepository.findAll(pageRequest).getContent();
	}
	@Transactional
	public void save(Customer customer) {
		customerRepository.save(customer);
	}
	@Transactional
	public Customer findOne(int id) {
		return customerRepository.findOne(id);
	}
}
