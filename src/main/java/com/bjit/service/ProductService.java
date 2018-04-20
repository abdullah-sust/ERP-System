package com.bjit.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bjit.modal.Product;
import com.bjit.repository.ProductRepository;

@Service
public class ProductService {

	public static final int size = 1000;
	@Autowired
	private ProductRepository productRepository;

	@Transactional
	public List<Product> getPage(int pageNum){
		PageRequest pageRequest= new PageRequest(pageNum, size, Sort.Direction.DESC, "id");
		return productRepository.findAll(pageRequest).getContent();
	}
}
