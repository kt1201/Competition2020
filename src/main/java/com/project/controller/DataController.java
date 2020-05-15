package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DataController {
	
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String process(Model model) {
        return "process";
    }
	
	@RequestMapping(value= "/Alpha", method=RequestMethod.GET)
	public String Alpha() {
		return "Alpha";
	}
	
	@RequestMapping(value= "/Beta", method=RequestMethod.GET)
	public String Beta() {
		return "Beta";
	}
	
	@RequestMapping(value= "/Gamma", method=RequestMethod.GET)
	public String Gamma() {
		return "Gamma";
	}
	
	@RequestMapping(value = {"/process3"}, method = RequestMethod.GET)
    public String process3(Model model) {
        return "process3";
    }
}
