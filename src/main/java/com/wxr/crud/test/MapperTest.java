package com.wxr.crud.test;

import com.wxr.crud.bean.Department;
import com.wxr.crud.bean.Employee;
import com.wxr.crud.dao.DepartmentMapper;
import com.wxr.crud.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.swing.*;

/**推荐Spring的项目就使用Spring的单元测试，自动注入我们需要的组件
 * 1.导入SpringTest模块
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 3.@RunWith使用spring的单元测试模块
 * 4.直接autowired要使用的组件即可
 * @author FatterShadystart
 * @create 2022-02-01 19:02
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    /**
     * 通过autowired自动获取DepartmentMapper和EmployeeMapper
     */
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 测试的DepartmentMapper
     */
    @Test
    public void testCRUD(){
//        //创建SpringIOC容器
        ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        //从ioc中获取mapper
        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
         //插入几个部门
        //departmentMapper.insertSelective(new Department(null,"开发部"));
        //departmentMapper.insertSelective(new Department(null,"测试部"));

        //单个插入员工数据
        employeeMapper.insertSelective(new Employee(null,"Rose","M","wxr@123.com",1));
        employeeMapper.insertSelective(new Employee(null,"Lily","W","Lily@123.com",2));
        employeeMapper.insertSelective(new Employee(null,"Daisy","W","Daisy@123.com",2));
        employeeMapper.insertSelective(new Employee(null,"Jacobs","W","Jacobs@123.com",1));
        employeeMapper.insertSelective(new Employee(null,"Jasmine","M","Jasmine@123.com",2));
        employeeMapper.insertSelective(new Employee(null,"Camellia","W","Camellia@123.com",1));
        employeeMapper.insertSelective(new Employee(null,"Rosemary","W","Rosemary@123.com",2));
        employeeMapper.insertSelective(new Employee(null,"Daffodil","M","Daffodil@123.com",1));
        employeeMapper.insertSelective(new Employee(null,"Gardenia","W","Gardenia@123.com",2));
        employeeMapper.insertSelective(new Employee(null,"Mike","M","Mike@123.com",2));

        //批量插入员工数据



    }
}
