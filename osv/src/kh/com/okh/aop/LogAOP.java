package kh.com.okh.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
@Aspect
public class LogAOP {
	@Around("within(kh.com.okh.dao.impl.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint)throws Throwable {
		String signatureStr=joinpoint.getSignature().toShortString();
		
		try {
			System.out.println("loggerApp:"+signatureStr+" 메소드실행");
			Object obj=joinpoint.proceed();
			return obj;
		}finally {
			
		}
	}
}
