package yourmei.test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import caffrey.bean.Department;
import caffrey.dao.DepartmentMapper;

import org.junit.Test;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentmapper;
	
	@Test
	public void CRUDTest()
	{
		System.out.println("CRUD mapper Test Start");
		System.out.println(departmentmapper);
		
		Department dept1 = departmentmapper.selectByPrimaryKey(4);
		System.out.println(dept1);
		
		Department dept2 = departmentmapper.selectByPrimaryKey(3);
		System.out.println(dept2);
	}
	
}
