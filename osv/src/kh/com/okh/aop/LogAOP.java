package kh.com.okh.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
@Aspect
public class LogAOP {
	@Around("within(kh.com.a.dao.impl.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint)throws Throwable {	//자동호출될것이다
		String signatureStr=joinpoint.getSignature().toShortString();
		//System.out.println(signatureStr+"시작");
		
		//공통기능
		//System.out.println("실행전"+System.currentTimeMillis()); 		//시간나오게
		try {
			System.out.println("loggerApp:"+signatureStr+" 메소드실행");
			Object obj=joinpoint.proceed();		//핵심기능실행되는부분
			return obj;
		}finally {
			//System.out.println("실행후"+System.currentTimeMillis());
			
			//System.out.println(signatureStr+"종료");
		}
	}
}
