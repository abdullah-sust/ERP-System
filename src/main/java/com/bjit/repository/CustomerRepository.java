package com.bjit.repository;

import org.springframework.stereotype.Repository;
import com.bjit.modal.Customer;
import org.springframework.data.repository.PagingAndSortingRepository;

@Repository
public interface CustomerRepository extends PagingAndSortingRepository<Customer, Integer> {

}
