package com.wxr.crud.service;

import com.wxr.crud.bean.Employee;
import com.wxr.crud.bean.EmployeeExample;
import com.wxr.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author FatterShadystart
 * @create 2022-02-02 17:13
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有员工
     * @return 返回员工List
     */
    public List<Employee> getAll(String...conditions) {
        EmployeeExample employeeExample=new EmployeeExample();
        employeeExample.setOrderByClause(conditions[0]);
      return   employeeMapper.selectByExampleWithDept(employeeExample);
    }

    /**
     * 员工保存
     * @param employee
     */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }
}
