package com.bjit.repository;

import java.util.List;

import org.springframework.data.couchbase.core.query.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.bjit.modal.Product;

@Repository
public interface ProductRepository extends PagingAndSortingRepository<Product, Integer> {
	
}
