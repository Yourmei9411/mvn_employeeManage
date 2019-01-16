package caffrey.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value="emp/{empId}", method=RequestMethod.PUT)
	public Msg updateEmployee(Employee emp)
	{
		System.out.println(emp);
		employeeService.updateEmployee(emp);
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="emp/{id}", method=RequestMethod.GET)
	public Msg GetEmployee(@PathVariable("id") Integer id)
	{
		Employee employee = employeeService.getEmployee(id);
		
		return Msg.success().add("emp", employee);
	}
	
	@ResponseBody
	@RequestMapping(value = "emps")
	public Msg ShowAllEmps(@RequestParam(value="pageNum", defaultValue="1") Integer pageNumber)
	{
		System.out.println("查询所有员工信息  pageNumber: " + pageNumber);
		List<Employee> emps;
		PageHelper.startPage(pageNumber, 5);
		emps = employeeService.getAll();
		PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
		for (Employee employee : emps) {
			System.out.println(employee);
		}
		
		return Msg.success().add("page", pageInfo);
	}
	
	@ResponseBody
	@RequestMapping(value = "emps", method=RequestMethod.POST)
	public Msg AddNewEmp(Employee employee)
	{
		System.out.println("AddNewEmp" + employee);
		
		employeeService.addNewEmp(employee);
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "checkEmpName")
	public Msg checkEmpName(@RequestParam("empName")String empName)
	{
		String regName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
		if(empName.matches(regName) == false)
		{
			Msg msg = Msg.fail();
			System.out.println("用户名格式不合法：6~16位数字或2~5位中文");
			msg.setMessage("用户名格式不合法：6~16位数字或2~5位中文");
			return msg;
		}
		
		if(employeeService.checkEmpName(empName) == true)
		{
			return Msg.success();
		}
		else
		{
			Msg msg = Msg.fail();
			msg.setMessage("用户名重复");
			return msg;
		}
	}
	
	/*
	@RequestMapping(value = "emps")
	public String ShowAllEmps(@RequestParam(value="pageNum", defaultValue="1") Integer pageNumber, 
			ModelMap model)
	{
		System.out.println("查询所有员工信息  pageNumber: " + pageNumber);
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
