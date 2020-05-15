package com.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.model.Data_A;

@Repository("data_A_Repository")
public interface Data_A_Repository extends CrudRepository<Data_A, String>{
	
}
