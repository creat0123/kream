package com.kream.cal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalController {
@Autowired private CalService service;

	@RequestMapping("cal")
	public String cal() {
		return "/cal/cal";
	} 
}
