package yourmei.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import caffrey.bean.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:applicationContext.xml", 
		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {

	//����Springmvc��ioc
	@Autowired
	WebApplicationContext context;
	//����mvc���󣬻�ȡ��������
	MockMvc mockmvc;
	
	@Before
	public void InitMock()
	{
		mockmvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void RequestEmpsTest() throws Exception
	{
		//ģ�������õ�����ֵ
		MvcResult mvcResult = mockmvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNum", "5")).andReturn();
		
		MockHttpServletRequest request = mvcResult.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("page");
		
		System.out.println("��ǰҳ�룺 " + pi.getPageNum());
		System.out.println("��ҳ�룺 " + pi.getPages());
		System.out.println("�ܼ�¼���� " + pi.getTotal());
		System.out.println("��ҳ����Ҫ������ʾ��ҳ�룺");
		int [] nums = pi.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(" " + i);
		}
		System.out.println();
		
		//��ȡԱ����Ϣ
		List<Employee> list = pi.getList();
		for (Employee employee : list) {
			System.out.println(employee);
		}
	}
	
}






























