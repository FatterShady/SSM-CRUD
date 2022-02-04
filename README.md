# 员工后台信息管理系统
这是一个基于SSM框架编写出的一套员工增删改查的项目

# 功能点
1.分页
2.数据校验
3.基本的增删改查员工信息

# 技术栈
以 Maven 架构项目；
采用 c3p0 开源 JDBC 数据库连接池连接 MySql 数据库；
前端框架 bootstrap 快速搭建简洁美观的界面
使用 JSP + Servlet 开发以及 Spring + SpringMVC + MyBatis框架；
采用了 MyBatis 的分页插件 PageHelper 实现分页的功能；
发送 AJAX 请求获取后端响应的（通过Jackson框架将Java对象转化为Json数据传给前端） JSON 数据，并通过 Dom 动态加载页面；
使用了 Spring - Test 与Junit 编写单元测试代码；
使用了 Restful 设计风格，以 AJAX 发送 PUT 与 DELETE 类型请求；
采用了双端校验，前端校验 JQuery，后端校验符合 JSR303 规范
