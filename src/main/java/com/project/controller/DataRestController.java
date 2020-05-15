package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.model.Data_A;
import com.project.model.Data_B;
import com.project.model.Data_C;
import com.project.service.DataService;

@RestController
@RequestMapping("api/sample")
public class DataRestController {
	
	@Autowired
	private DataService dataService;
	
	@RequestMapping(value = "find_A", method = RequestMethod.GET,
			produces = {MimeTypeUtils.APPLICATION_JSON_VALUE})
	public ResponseEntity<Iterable<Data_A>> find_A() {
		try {
			return new ResponseEntity<Iterable<Data_A>>(dataService.find_A(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Data_A>>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "find_B", method = RequestMethod.GET,
			produces = {MimeTypeUtils.APPLICATION_JSON_VALUE})
	public ResponseEntity<Iterable<Data_B>> find_B() {
		try {
			return new ResponseEntity<Iterable<Data_B>>(dataService.find_B(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Data_B>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "find_C", method = RequestMethod.GET,
			produces = {MimeTypeUtils.APPLICATION_JSON_VALUE})
	public ResponseEntity<Iterable<Data_C>> find_C() {
		try {
			return new ResponseEntity<Iterable<Data_C>>(dataService.find_C(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Data_C>>(HttpStatus.BAD_REQUEST);
		}
	}
}
