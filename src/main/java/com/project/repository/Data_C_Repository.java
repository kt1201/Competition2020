package com.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.model.Data_C;

@Repository("data_C_Repository")
public interface Data_C_Repository extends CrudRepository<Data_C, String>{
	
}
