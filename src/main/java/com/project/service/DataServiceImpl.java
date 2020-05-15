package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Data_A;
import com.project.model.Data_B;
import com.project.model.Data_C;
import com.project.repository.Data_A_Repository;
import com.project.repository.Data_B_Repository;
import com.project.repository.Data_C_Repository;

@Service("dataService")
public class DataServiceImpl implements DataService{
	
	@Autowired
	private Data_A_Repository data_A_Repository;
	
	@Autowired
	private Data_B_Repository data_B_Repository;
	
	@Autowired
	private Data_C_Repository data_C_Repository;
	
	@Override
	public Iterable<Data_A> find_A() {
		return data_A_Repository.findAll();
	}
	
	@Override
	public Iterable<Data_B> find_B() {
		return data_B_Repository.findAll();
	}
	
	@Override
	public Iterable<Data_C> find_C() {
		return data_C_Repository.findAll();
	}

}
