<%--
  Created by IntelliJ IDEA.
  User: Samsara
  Date: 2022/2/2
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <%--引入Jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <%--引入样式--%>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 添加员工的模态框，Bootstrap代码 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="请输入正确且不重复的用户名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="请输入正确的邮箱格式">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <!-- 部门信息的下拉列表框 -->
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改员工信息的模态框，Bootstrap代码 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

    <%--************************************************************************************************************************************************--%>
<%--主体--%>
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <br/>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <br/>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered" id="emps_table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>


                <tbody>
                <!-- 员工的信息 -->
                </tbody>
            </table>
        </div>
    </div>


    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area">

        </div>
        <!-- 分页条信息 -->
        <div class="col-md-4 col-md-offset-4" id="page_nav_area">

        </div>
    </div>


</div>
<script type="text/javascript">
    <%--全局变量用来记录总记录数和当前页数--%>
    var totalRecord,currentPage;

    <%--************************************************************************************************************************************************--%>

    //跳转到指定页面
    function to_page(pageNumber){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pageNumber="+pageNumber,
            type:"GET",

            //result获取到了返回的Msg对象(JSON数据)
            success:function(result){

                //1、解析并显示员工数据
                build_emps_table(result);

                //2、解析并显示分页信息
                build_page_info(result);

                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    //创建员工表格
    function build_emps_table(result) {
        //清空table表格
        $("#emps_table tbody").empty();
        //所有的员工数据
        var emps = result.extend.pageInfo.list;
        //遍历一下
        $.each(emps, function (index, item) {
            //获取到员工信息中每项信息
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == 'M' ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            //每行中的编辑按钮
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            //为编辑按钮添加一个自定义属性，表示当前员工的id
            editBtn.attr("edit-id", item.empId);

            //每行中的删除按钮
            var delBtn = $("<button></button>").addClass("btn btn-warning btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");

            //为删除按钮添加一个自定义属性，表示当前员工的id
            delBtn.attr("del-id", item.empId);

            //将两个按钮整合在一起
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);

            //将以上数据拼成一行
            $("<tr></tr>")
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table ");
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        //清空table表格
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页，总"
            + result.extend.pageInfo.pages + "页，总" + result.extend.pageInfo.total + "条记录")

        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;

    }

    //解析显示分页条,点击分页能去下一页
    function build_page_nav(result) {
        //清空分页条信息
        $("#page_nav_area").empty();
        //Bootstrap中的写法，导航条中的信息都要写在ul变量中
        var ul = $("<ul></ul>").addClass("pagination");

        //首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));

        //前一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

        //如果当前遍历的页码是首页(没有前一页)，让首页和上一页不可点击
        if (result.extend.pageInfo.hasPreviousPage == false) {
            //disabled是Bootstrap中的写法
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为首页和前一页添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        //后一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));

        //末页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

        //如果当前遍历的页码是末页(没有下一页)，让末页和下一页不可点击
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            //为下一页和末页添加点击翻页的事件
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }

        //导航条中添加首页和前一页
        ul.append(firstPageLi).append(prePageLi);

        //遍历1，2，3之类的页码
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            //numLi / item表示遍历到的1，2，3之类的页码
            var numLi = $("<li></li>").append($("<a></a>").append(item));

            //如果当前遍历的页码就是当前的页码，让其高亮显示
            if (result.extend.pageInfo.pageNum == item) {
                //active是Bootstrap中的写法
                numLi.addClass("active");
            }

            //单击事件，跳转到对应页面
            numLi.click(function () {
                to_page(item);
            });

            //向导航条中添加1，2，3之类的页码
            ul.append(numLi);
        });

        //导航条中添加下一页和末页
        ul.append(nextPageLi).append(lastPageLi);

        //把ul导航条添加到导航条在页面中的位置
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //页面加载完成后发送一个ajax请求，请求分页数据
    $(function () {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pageNumber",
            type: "get",
            success: function (result) {

                //1.解析并显示员工数据
                build_emps_table(result);

                //2.解析并显示分页信息
                build_page_info(result);

                //3.解析并显示分页条信息
                build_page_nav(result);
            }
        })
    })

    <%--************************************************************************************************************************************************--%>


    //通过内容发生改变事件和ajax请求校验填写的用户名是否已经存在于数据库
    $("#empName_add_input").change(function(){
        var empName = this.value;
        //发送ajax请求
        $.ajax({
            url:"${APP_PATH}/checkUser",
            data:"empName="+empName,
            type:"POST",
            success:function(result){
                if(result.code==100){
                    //调用函数以指定的格式显示提示信息
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    //如果用户名可用，才让其保存，保存按钮添加属性
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    //如果用户名不可用，不让其保存，保存按钮添加属性
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        });
    });

    //点击新增按钮弹出模态框
    $("#emp_add_modal_btn").click(function(){


        //清除表单数据
        reset_form("#empAddModal form")
        //调用函数清除模态框的所有数据数据，防止上一次信息残留
        //  reset_form("#empAddModal form");
        $("#empAddModal select").empty()

        //调用函数发送ajax请求，查出社团信息，显示在下拉列表(select标签)中
        getDepts("#empAddModal select");

        //弹出添加用户的模态框(Bootstrap代码)
        $("#empAddModal").modal({
            backdrop:"static"
        });

    });

    //添加用户模态框的保存按钮的单击事件
    $("#emp_save_btn").click(function () {


        //模态框中的表单数据提交给服务器保存,发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                if(result.code==100){
                //1.关闭模态框(Bootstrap代码)
                $("#empAddModal").modal('hide');
                //来到最后一页，显示刚才保存的数据
                to_page(totalRecord);
            }
                else{
                    //有哪个错误信息就显示哪个错误信息
                    if(undefined!=result.extend.errorFields.email){
                        //显示邮箱错误信息
                        show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);

                    }

                    if(undefined!=result.extend.errorFields.empName){
                        //显示员工名错误信息
                        show_validate_msg("#empName_add_input", "success",result.extend.errorFields.empName);
                    }
                }

            }
        })


    })

    //查出所有部门信息并显示在下拉列表中
    function getDepts(ele) {
        //清空下拉列表的值
        $(ele).empty();

        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
                //遍历获取到的所有部门信息，显示在下拉列表中
                $.each(result.extend.depts,function(){
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        })
    }

    //校验表单数据
    function validate_add_form() {
        //用户名已在数据库中检查，此处无需再查
        //校验邮箱信息
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            //调用函数以指定的格式显示提示信息
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;

    }

    //调用函数以指定的格式显示提示信息
    function show_validate_msg(ele,status,msg){
        //清除当前元素较严状态
        $(ele).parent().removeClass("has-success has-error");

        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }


    }

    //清空表单内容和样式
    function reset_form(ele) {
        //清空表单内容
        $(ele)[0].reset()
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success")
        $(ele).find(".help-block").text("")
    }



    <%--************************************************************************************************************************************************--%>

    <!-- 修改功能 -->

    //为编辑按钮添加单击事件，弹出模态框

    //不能直接使用click为编辑按钮绑定单击事件
    //因为编辑按钮是在页面加载完成事件中添加的，单击事件早于页面加载事件被绑定
    //相当于还没有加载出来按钮就为其绑定了事件，故使用on来绑定事件

    //为页面中对应class属性的按钮添加单击事件
    $(document).on("click",".edit_btn",function(){

        //1、查出社团信息，并显示社团列表
        getDepts("#empUpdateModal select");

        //2、查出学生信息，显示学生信息
        getEmp($(this).attr("edit-id"));

        // 3、把学生的id传递给模态框中的更新按钮，
        // 之前编辑按钮的edit-id属性已传入对应的学生id
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));

        //4. 弹出修改信息的模态框(Bootstrap代码)
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });

    //点击模态框中的更新，更新学生信息
    $("#emp_update_btn").click(function(){

        //1. 验证邮箱是否合法
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#email_update_input", "success", "");
        }

        //2. 发送ajax请求保存更新的学生数据
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            //web.xml中已添加过滤器，可直接发送PUT请求
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function(result){
                //1、关闭对话框
                $("#empUpdateModal").modal("hide");

                //2、回到本页面(定义变量保存了当前页面的页码号)
                to_page(currentPage);
            }
        });
    });

    //查出学生信息
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function(result){
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }

    <%--************************************************************************************************************************************************--%>


    <!-- 删除功能开始 -->

    //为单个删除绑定单击事件
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var empName = $(this).parents("tr").find("td:eq(1)").text();
        var empId = $(this).attr("del-id");
        if(confirm("确认删除【"+empName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function(result){
                    //显示处理成功
                    alert(result.msg);
                    //回到本页
                    to_page(currentPage);
                }
            });
        }
    });


    <%--************************************************************************************************************************************************--%>





</script>


</body>
</html>
