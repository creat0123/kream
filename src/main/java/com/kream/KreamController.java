package com.kream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KreamController {
	
	
	@RequestMapping("index")
	public String index() {
		return "/index";
	}

	@RequestMapping("main")
	public String main() {
		return "/default/main";
	}
	
	@RequestMapping("header")
	public String header() {
		return "/default/header";
	}
	
	@RequestMapping("header2")
	public String header2() {
		return "/default/header2";
	}
	
	@RequestMapping("footer")
	public String footer() {
		return "/default/footer";
	}
}
