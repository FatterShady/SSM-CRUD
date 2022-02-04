package com.wxr.crud.service;

import com.wxr.crud.bean.Department;
import com.wxr.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author FatterShadystart
 * @create 2022-02-03 23:07
 */
@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        List<Department> departmentsList = departmentMapper.selectByExample(null);
        return departmentsList;
    }
}
