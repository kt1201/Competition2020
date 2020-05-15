package com.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.model.Data_B;

@Repository("data_B_Repository")
public interface Data_B_Repository extends CrudRepository<Data_B, String>{
	
}
