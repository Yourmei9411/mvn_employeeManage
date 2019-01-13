package caffrey.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import caffrey.bean.Department;
import caffrey.bean.Msg;
import caffrey.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	DepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping("depts")
	public Msg getDepts()
	{
		System.out.println("getDepts");
		List<Department> list = departmentService.getDepts();
		
		for (Department department : list) {
			System.out.println(department);
		}
		
		return Msg.success().add("depts", list);
	}
	
}
