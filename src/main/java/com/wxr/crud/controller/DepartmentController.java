package com.wxr.crud.controller;

import com.wxr.crud.bean.Department;
import com.wxr.crud.bean.Msg;
import com.wxr.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**处理部门有关的请求
 * @author FatterShadystart
 * @create 2022-02-03 23:06
 */
@Controller
public class DepartmentController {
   @Autowired
    private DepartmentService departmentService;

    /**
     * 返回所有部门信息
     * @return
     */
    @ResponseBody
    @RequestMapping("/depts")
   private Msg getDepts(){
       //查出所有的部门信息
      List<Department> list= departmentService.getDepts();
      return Msg.success().add("depts",list );
   }
}
