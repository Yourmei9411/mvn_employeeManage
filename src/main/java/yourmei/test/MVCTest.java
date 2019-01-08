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

	//传入Springmvc的ioc
	@Autowired
	WebApplicationContext context;
	//虚拟mvc请求，获取到处理结果
	MockMvc mockmvc;
	
	@Before
	public void InitMock()
	{
		mockmvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void RequestEmpsTest() throws Exception
	{
		//模拟请求并拿到返回值
		MvcResult mvcResult = mockmvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNum", "5")).andReturn();
		
		MockHttpServletRequest request = mvcResult.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("page");
		
		System.out.println("当前页码： " + pi.getPageNum());
		System.out.println("总页码： " + pi.getPages());
		System.out.println("总记录数： " + pi.getTotal());
		System.out.println("在页面需要连续显示的页码：");
		int [] nums = pi.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(" " + i);
		}
		System.out.println();
		
		//获取员工信息
		List<Employee> list = pi.getList();
		for (Employee employee : list) {
			System.out.println(employee);
		}
	}
	
}






























