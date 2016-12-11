package com.imageexpander;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class UserJDBCTemplateAspect {
	
	@Before("execution(* com.imageexpander.User.*(..))")
    public void logBeforeV1(JoinPoint joinPoint) 
    {
        System.out.println("UserJDBCTemplateAspect.logBeforeV1() : " + joinPoint.getSignature().getName());
    }
     
    @After("execution(* com.imageexpander.User.*(..))")
    public void logAfterV1(JoinPoint joinPoint) 
    {
        System.out.println("UserJDBCTemplateAspect.logAfterV1() : " + joinPoint.getSignature().getName());
    }

}
