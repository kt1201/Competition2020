package com.project.service;

import com.project.model.Data_A;
import com.project.model.Data_B;
import com.project.model.Data_C;

public interface DataService {
	
	public Iterable<Data_A> find_A();
	
	public Iterable<Data_B> find_B();
	
	public Iterable<Data_C> find_C();

}
