package com.imageexpander;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;

public class ImageAdvice {
	
	private static Logger logger = Logger.getLogger(ImageAdvice.class);

	public void beforeMethod() {
		logger.info("before method");
	}
	
	public void afterMethod() {
		logger.info("after method");
	}
	
	public Object aroundMethod(ProceedingJoinPoint joinpoint) {
		try {

			long start = System.nanoTime();

			Object result = joinpoint.proceed();

			long end = System.nanoTime();

			logger.info(String.format("%s took %d ns", joinpoint.getSignature(), (end - start)));

			return result;

		} catch (Throwable e) {

			throw new RuntimeException(e);

		}

	}

}
