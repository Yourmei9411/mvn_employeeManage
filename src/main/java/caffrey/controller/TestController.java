package caffrey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping(value="HelloTest")
	public String HelloTest()
	{
		System.out.println("HelloWorld");
		
		return "test";
	}
	
}
