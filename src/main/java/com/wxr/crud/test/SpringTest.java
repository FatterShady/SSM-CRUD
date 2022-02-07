package com.wxr.crud.test;

import com.mchange.v2.c3p0.PooledDataSource;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**研究Spring启动流程的类
 * @author FatterShadystart
 * @create 2022-02-06 21:14
 */
public class SpringTest {
    public static void main(String[] args){
        ClassPathXmlApplicationContext ioc=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        PooledDataSource pooledDataSource = ioc.getBean("pooledDataSource", PooledDataSource.class);
        System.out.println(pooledDataSource);


    }
}
