<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	

<!-- 폰트  -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"><!-- 
<link rel="stylesheet" type="text/css" href="_techbbs.css?ver=1.65">
<link rel="stylesheet" type="text/css" href="_main.css?ver=1.4"> -->

<!-- 받아야될데이터  
techlist->기본다불러오는거
sortlist->소팅한거
whatsort->소팅되페이징처리가져오려면필요하다
tagname->태그테이블에서검색한거
서치한거페이징처리하는거
profile 받아오는뭐리문작성해달라해서받기

-->
	
<div class="titlediv">
		<span class="titi">기술게시판</span>
	<c:if test="${empty login.id}">
		<button class="create btn btn-success btn-wide pull-right " type="button" onclick="location.href = 'User?command=guest'">게시글쓰기</button>
	</c:if>
	<c:if test="${not empty login.id}">
		<button class="create btn btn-success btn-wide pull-right " type="button" id="techwrite">게시글쓰기</button>
	</c:if>
</div>
	
<div class="wrap">
<div class="sortingmenu">
	 <ul class="list-sort pull-left">
         <li><a onclick="location.href='sorthe.do?whatthings=wdate'"  class="category-sort-link active">최신순</a></li>
         <li><a onclick="location.href='sorthe.do?whatthings=likecount'" class="category-sort-link">좋아요순</a></li>
         <li><a onclick="location.href='sorthe.do?whatthings=contentcount'" class="category-sort-link">댓글순</a></li>
         <li><a onclick="location.href='sorthe.do?whatthings=readcount'" class="category-sort-link">조회순</a></li>
     </ul>
	
</div>
<form name="frmForm1" id="_frmFormSearch" method="post" action="">
<div class="sercharea">
<select id="_s_category" name="s_category">
      <option value="tagname" <c:if test="${s_keyword eq '' or s_category eq 'tagname'}}">selected</c:if>>선택</option>
      <option value="title" <c:if test="${s_keyword ne '' and s_category eq 'title'}">selected</c:if>>제목</option>
      <option value="contents" <c:if test="${s_keyword ne '' and s_category eq 'contents'}">selected</c:if>>내용</option>
      <option value="id" <c:if test="${s_keyword ne '' and s_category eq 'id' }">selected</c:if>>작성자</option>                     
   </select>
   <input type="text" class="inputField" id="_s_keyword" name="s_keyword" value="${s_keyword}"/>
<%-- <input type="text" class="inputField" id="search" value="<%=findWord %>"> --%>
<button name="search" id="serchbtn" class="input-group-btn" onclick="searchBbs()"><img alt="" src="image/serchbtn.PNG"></button>
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>	
</div>
</form>
	<div class="board">
		<table border="1" class="techtable">
		<col width="450"><col width="80"><col width="80"><col width="80"><col width="150">
			
			<c:if test="${empty techlist}">
				<tr>
				<th colspan="5">리스트가없습니다</th>
				</tr>
			</c:if>
			
			<c:if test="${not empty techlist}">
			
			<c:forEach items="${techlist}" var="tech" varStatus="vs">	<!-- vs.count 1부터순서대로찍어준다 -->
				<tr>
				<!-- 제목th시작 -->
				<c:if test="${tech.commentcount>0}">
					<th>#${tech.seq }
					<c:if test="${not empty taglist}">
					<c:forEach items="${taglist}" var="tag" varStatus="i">
						<span>
						<button class="hjhtag" name="tag${i }" id="tag${i }" onclick="searchBbs1(this)" value="${tag.tagname}">${tag.tagname}</button>
						</span>
					</c:forEach>
				</c:if>
					<p style="font-size: 15px; margin-top: 5px;"><a href="techdetail.do?seq=${tech.seq }">${tech.title }</a></p>
					</th>
				</c:if>
				<c:if test="${tech.commentcount<1}">
					<th style="border-left: 5px solid #808080">
					#${tech.seq }
					<c:if test="${not empty taglist}">
						<c:forEach items="${taglist}" var="tag" varStatus="i">
							<span>
							<button class="hjhtag" name="tag${i }" id="tag${i }" onclick="searchBbs1(this)" value="${tag.tagname}">${tag.tagname}</button>
							</span>
						</c:forEach>
					</c:if>
						<p style="font-size: 15px; margin-top: 5px;"><a href="techdetail.do?seq=${tech.seq }">${tech.title }</a></p>
					</th>
				</c:if>
				<!-- 제목 th끝 -->
				<!-- 카운트 td시작 -->
				<c:if test="${tech.commentcount>0}">
					<td><img src="<%=request.getContextPath() %>/image/repleon.PNG"><span class="textalig">${tech.commentcount}</span></td>
				</c:if>
				<c:if test="${tech.commentcount<1}">
					<td><img src="<%=request.getContextPath() %>/image/repleoff.png"><span class="textalig">${tech.commentcount}</span></td>
				</c:if>
				<c:if test="${tech.likecount>0}">
					<td style="padding-top: 3px"><img src="<%=request.getContextPath() %>/image/likeeon.png"><span class="textalig">${tech.likecount}</span></td>
				</c:if>
				<c:if test="${tech.likecount<1}">
					<td style="padding-top: 3px"><img src="<%=request.getContextPath() %>/image/likeeoff.png"><span class="textalig">${tech.likecount}</span></td>
				</c:if>
				<c:if test="${tech.readcount>0}">
					<td style="padding-top: 3px"><img src="<%=request.getContextPath() %>/image/readcounton.PNG"><span class="textalig">${tech.readcount}</span></td>
				</c:if>
				<c:if test="${tech.readcount<1}">
					<td style="padding-top: 3px"><img src="<%=request.getContextPath() %>/image/readcountoff.png"><span class="textalig">${tech.readcount}</span></td>
				</c:if>
				<!-- 카운트 td 끝 -->
				<!-- 내정보 td시작 -->
				<td>
				<p class="myinfo_icon" style="margin-bottom: 0">
				<a onclick="location.href ='otherpage.do?infoid=${tech.id}'" style="cursor: pointer">
				<%-- 유저디티오에 프로필과스코어받아오는쿼리문있어야함 --%>
				<%-- <img src="<%=getprofile %>" class="media-object img-circle" style="max-width: 30px; float:left; max-height: 30px; margin: 0 auto;"> --%>
				</a>
				<span class="detailid" style="margin-left: 10px;">
				<a onclick="location.href ='otherpage.do?infoid=${tech.id}'" style="cursor: pointer"><span style="margin-top: 5px">${tech.id}</span></a>
				<%-- <span class="" style="margin-top: 10px;"><img src="image/actionpoint.PNG" class="pointimg">
				<%=score%></span> --%>
				</span> <br><br>
				</p>
				<p style="font-size: 10px">${tech.wdate }</p>
				</td>
				</tr>
			</c:forEach>
			
			</c:if>
		</table>
		<br>
		
		<!-- 페이징처리 -->
<div id="paging_wrap">
	<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
	</jsp:include>
</div>

<script type="text/javascript">
if(document.getElementById("choice").value=="tagname"){
	$("#search").val("");
}
</script>

	</div>
</div>

<script type="text/javascript">
function searchBbs() {
	if(document.getElementById("choice").value=="tagname"){
		alert("선택해주세요");
		$("#search").val("");
		return;
	}
	$("#_btnSearch").click(function() {
		//alert('search');						
		$("#_frmFormSearch").attr({ "target":"_self", "action":"techlist.do" }).submit();
	});
}
function searchBbs1(e) {
	$("#search").val("");
	var word = e.value;
	var choice = document.getElementById("choice").value;
	location.href = "techbbs.jsp?findWord=" + word + "&choice=tagname";	
	
}


$(function() {
	$("#techbbs").click(function() {
		location.href="TechbbsController?command=techbbs";
	});
	$("#techwrite").click(function() {
		location.href="TechbbsController?command=techwrite";
	});
	$("#loginhe").click(function() {
		alert("로그인해주세요");
		location.href="TechbbsController?command=techbbs";
	});
});
</script>

	
 <script>
            $(function() {
                $('.category-sort-link').click(function(e) {
                    $('#category-sort-input').val($(this).data('sort'));
                    $('#category-order-input').val($(this).data('order'));
                    e.preventDefault();
                });

            });
            </script>
        
<script type="text/javascript">
	function logout() {
		location.href ="User?command=logout";
	}
	function upmydetail() {
		location.href ="User?command=mypage";
	}
	</script>
</body>
</html>