package com.wxr.crud.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wxr.crud.bean.Employee;
import com.wxr.crud.bean.EmployeeExample;
import com.wxr.crud.bean.Msg;
import com.wxr.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     * 查找所有员工的信息保存到PageInfo中中
     * @param pageNumber
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emps")
    public Msg getEmpsWithJson(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNumber){
        PageHelper.startPage(pageNumber,5);
        List<Employee> emps= employeeService.getAll("emp_id");
        //使用PageInfo查询被包装的结果，只需要把pageInfo交给页面即可
        PageInfo pageInfo=new PageInfo(emps);
        return Msg.success().add("pageInfo",pageInfo);

    }

    /**
     * 员工保存,JSR303校验
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String,Object> map=new HashMap();
            //校验失败，返回失败，在模态框中显示校验失败的错误信息
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldErrors:errors ){
                map.put(fieldErrors.getField(), fieldErrors.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map );

        } else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    /**
     * 检查用户名是否存在
     * @param empName
     * @return
     */
    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName){
        //先判断用户名是否是合法表达式
        String regex = "(^[A-Za-z0-9]{3,12}$)|^[\u2E80-\u9FFF]{2,5}";
        if(!empName.matches(regex)){
            return Msg.fail().add("va_msg", "用户名必须是3-12位数字或字母或者是2-5位的汉字");
        }

        //数据库用户名重复校验
        boolean b= employeeService.checkUser(empName);
     if(b){
         return Msg.success();
     }else {
         return Msg.fail().add("va_msg", "用户名不可用");
     }
    }


    /**
     * 根据id查找员工信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable Integer id){
       Employee employee= employeeService.getEmp(id);
               return Msg.success().add("emp",employee);

    }


    /**
     * 更新员工信息
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();

    }


    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable Integer empId){
        employeeService.deleteEmp(empId);
        return Msg.success();
    }

}
