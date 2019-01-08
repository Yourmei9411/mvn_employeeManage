package yourmei.test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import caffrey.bean.Department;
import caffrey.bean.Employee;
import caffrey.dao.DepartmentMapper;
import caffrey.dao.EmployeeMapper;
import caffrey.service.EmployeeService;

import org.junit.Test;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentmapper;
	
	@Autowired
	EmployeeMapper employeemapper;
	
	@Autowired
	EmployeeService employeeService; 
	
	@Test
	public void CRUDTest()
	{
		System.out.println("CRUD mapper Test Start");
		System.out.println(departmentmapper);
		
		Department dept1 = departmentmapper.selectByPrimaryKey(4);
		System.out.println(dept1);
		
		Department dept2 = departmentmapper.selectByPrimaryKey(3);
		System.out.println(dept2);
		
		Employee emp1 = employeemapper.selectByPrimaryKeyWithDept(1008);
		System.out.println(emp1);
		
		System.out.println(employeeService);
	}
	
}
