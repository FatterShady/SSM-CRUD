package com.wxr.crud.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wxr.crud.bean.Employee;
import com.wxr.crud.bean.Msg;
import com.wxr.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**处理员工的CRUD请求
 * @author FatterShadystart
 * @create 2022-02-02 17:09
 */
@Controller
public class EmployeeContorller {


    @Autowired
    EmployeeService employeeService;


    /**
     * 分页查询员工数据
     * @return
     */
    //@RequestMapping(value = "/emps")
//    public String getEmps(
//            @RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNumber,
//            Model model
//    ) {
//         PageHelper.startPage(pageNumber, 5);
//        List<Employee> emps= employeeService.getAll();
//        //使用PageInfo查询被包装的结果，只需要把pageInfo交给页面即可
//        PageInfo pageInfo=new PageInfo(emps);
//        model.addAttribute("pageInfo",pageInfo);
//        return "list";
//    }

    @ResponseBody
    @RequestMapping(value = "/emps")
    public Msg getEmpsWithJson(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNumber){

        PageHelper.startPage(pageNumber,2);
        List<Employee> emps= employeeService.getAll();
        //使用PageInfo查询被包装的结果，只需要把pageInfo交给页面即可
        PageInfo pageInfo=new PageInfo(emps);
        return Msg.success().add("pageInfo",pageInfo);

    }

    /**
     * 员工保存
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public Msg saveEmp(Employee employee){
        employeeService.saveEmp(employee);
        return Msg.success();
    }
}
