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
<<<<<<< HEAD
	}
	
	@RequestMapping("cal2")
	public String cal2() {
		return "/cal/cal2";
	}
=======
	} 
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
}
