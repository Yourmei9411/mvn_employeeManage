package caffrey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import caffrey.bean.Employee;
import caffrey.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeemapper;
	
	public List<Employee> getAll() {
		System.out.println("getAll Emp in EmployeeService");
		List<Employee> emps = employeemapper.selectByExampleWithDept(null);
		
		return emps;
	}

	public void addNewEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeemapper.insert(employee);
	}

}
