<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	
	int totalRecordCount;		// 전체 글수
	int pageNumber;				// 현재 페이지 번호
	int pageCountPerScreen;		// 스크린당 페이지수 	
	int recordCountPerPage;		// 페이지당 글수
		
	String st1 = request.getParameter("totalRecordCount");
	if(st1 == null)	totalRecordCount = 0;
	else			totalRecordCount = Integer.parseInt(st1);
	
	String st2 = request.getParameter("pageNumber");
	if(st2 == null)	pageNumber = 0;
	else			pageNumber = Integer.parseInt(st2);
	
	String st3 = request.getParameter("pageCountPerScreen");
	if(st3 == null)	pageCountPerScreen = 0;
	else			pageCountPerScreen = Integer.parseInt(st3);
	
	String st4 = request.getParameter("recordCountPerPage");
	if(st4 == null)	recordCountPerPage = 0;
	else			recordCountPerPage = Integer.parseInt(st4);
		
	int totalPageCount = totalRecordCount / recordCountPerPage;	// 총페이지
	//		1		=		12					10
	
	if ((totalRecordCount % recordCountPerPage) != 0) {
		//	12					10	
		totalPageCount++;		// 1 -> 2
	}
	
	int screenStartPageIndex = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;	
	//			0 =				0 + 1			10						10						
	int screenEndPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;	
	//			20 = 			0 + 1			10						10						10								
	if (screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;		// 페이지 블록을 10까지만 표시하려고 하는 처리
	//		10					2				2					2
			
	System.out.println("totalRecordCount:" + totalRecordCount);
	System.out.println("pageNumber:" + pageNumber);
	System.out.println("pageCountPerScreen:" + pageCountPerScreen);
	System.out.println("recordCountPerPage:" + recordCountPerPage);
	System.out.println("totalPageCount:" + totalPageCount);
	System.out.println("screenStartPageIndex:" + screenStartPageIndex);
	System.out.println("screenEndPageIndex:" + screenEndPageIndex); 

	/* 
	totalRecordCount:12
	pageNumber:0
	pageCountPerScreen:10
	recordCountPerPage:10
	totalPageCount:2
	screenStartPageIndex:0
	screenEndPageIndex:2
	 */
	
	
	if (((pageNumber+1) % pageCountPerScreen) == 0)
	{
	    screenStartPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
	    screenEndPageIndex = pageNumber+1;
	}
%>
<div style="float:left; width:96%; text-align:center;"> 
<ul class="pagination pagination-sm">
	<li class="step">
	<a href="#none" title="처음페이지" onclick="goPage('0');">첫페이지</a>		
	</li>

		
		<%
		if (screenStartPageIndex > 1){
			%>	
			<li class="step"><a href="#" onclick="gotoPage('<%=screenStartPageIndex-1 %>')">&lt;</a></li>
			<%
		}
		    	
		for (int i=screenStartPageIndex; i<screenEndPageIndex ;i++){
			if (i==pageNumber){
		    	%>	
				<li class="active">
				<a href="#" onclick="gotoPage('<%=i %>')"><span><%=i+1 %></span></a>
 			</li>
		    	<% 
			} 
		}
		    	
		if (screenEndPageIndex < totalPageCount){
		    %>	
		    <li class="step">
	            <a href="#" onclick="gotoPage('<%=screenEndPageIndex %>')">&gt;</a>
	            </li>
		    <%
		}
		int end_page = 0;
		if (totalPageCount > 0){
			end_page = totalPageCount - 1;
		}
		%>
	 <li class="step">
	             <a href="#" onclick="gotoPage('<%=end_page %>')">끝페이지</a>      <!-- 14페이지 -->
	          </li>	        	
</ul>
</div>		
			
<div style="float:left; width:4%; text-align:center;">		
	<span style="font-size:1em; color:#000000;"><%=pageNumber+1%>/<%=totalPageCount%></span>		
</div>
	 	