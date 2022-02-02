package com.wxr.crud.test;

import com.github.pagehelper.PageInfo;
import com.wxr.crud.bean.Employee;
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
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @author FatterShadystart
 * @create 2022-02-02 18:10
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
    //传入SpringMvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求，获得到处理请求
    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc= MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNumber", "1")).andReturn();

        //请求成功后，请求域中会有pageInfo
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码"+pageInfo.getPageNum());

        //获取员工数据
        List<Employee> list = pageInfo.getList();
        for(Employee employee:list){
            System.out.println("ID:"+employee.getdId()+"姓名:"+employee.getEmpName());
        }
        int[]  nums= pageInfo.getNavigatepageNums();
        for(int i:nums){
            System.out.println(" "+i);
        }


    }

}
