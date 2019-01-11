package caffrey.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import caffrey.bean.Employee;
import caffrey.bean.Msg;
import caffrey.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	
	@ResponseBody
	@RequestMapping(value = "emps")
	public Msg ShowAllEmps(@RequestParam(value="pageNum", defaultValue="1") Integer pageNumber)
	{
		System.out.println("��ѯ����Ա����Ϣ  pageNumber: " + pageNumber);
		List<Employee> emps;
		PageHelper.startPage(pageNumber, 5);
		emps = employeeService.getAll();
		PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
		for (Employee employee : emps) {
			System.out.println(employee);
		}
		
		return Msg.success().add("page", pageInfo);
	}
	
	/*
	@RequestMapping(value = "emps")
	public String ShowAllEmps(@RequestParam(value="pageNum", defaultValue="1") Integer pageNumber, 
			ModelMap model)
	{
		System.out.println("��ѯ����Ա����Ϣ  pageNumber: " + pageNumber);
		List<Employee> emps;
		System.out.println("1");
		PageHelper.startPage(pageNumber, 5);
		System.out.println("2");
		emps = employeeService.getAll();
		PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
		for (Employee employee : emps) {
			System.out.println(employee);
		}
		model.addAttribute("page", pageInfo);
		
		return "list";
	}
	*/
}
