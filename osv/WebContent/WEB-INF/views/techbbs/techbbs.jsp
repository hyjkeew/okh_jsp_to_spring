<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/> 

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	

<!-- 폰트  -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="_techbbs.css?ver=1.65">
<link rel="stylesheet" type="text/css" href="_main.css?ver=1.4">


<script type="text/javascript">
function logout() {
	location.href='index.do';
}
</script>

<!-- 받아야될데이터  
techlist->기본다불러오는거
sortlist->소팅한거
whatsort->소팅되페이징처리가져오려면필요하다

서치한거페이징처리하는거
profile 받아오는뭐리문작성해달라해서받기

-->
<%
if(findWord == null){
	findWord = "";
}
int cho = 0;

if(choice == null) cho = 4;
else if(choice.equals("title")) cho = 0;
else if(choice.equals("writer")) cho = 1;
else if(choice.equals("content")) cho = 2;
else if(choice.equals("tagname")) cho = 3;


%>


	
	<div class="titlediv"><span class="titi">기술게시판</span>
	<%
	if(ologin == null){
			%>
	
	<button class="create btn btn-success btn-wide pull-right " type="button" onclick="location.href = 'User?command=guest'">게시글쓰기</button></div>
	
	<%
		}else{
	%>
	<button class="create btn btn-success btn-wide pull-right " type="button" id="techwrite">게시글쓰기</button></div>
	
	<%
	}
	%>
	
	
<div class="wrap">
<div class="sortingmenu">
	 <ul class="list-sort pull-left">
         <li><a onclick="location.href='TechbbsController?command=sorthe&whatthings=wdate'"  class="category-sort-link active">최신순</a></li>
         <li><a onclick="location.href='TechbbsController?command=sorthe&whatthings=likecount'" class="category-sort-link">좋아요순</a></li>
         <li><a onclick="location.href='TechbbsController?command=sorthe&whatthings=contentcount'" class="category-sort-link">댓글순</a></li>
         <li><a onclick="location.href='TechbbsController?command=sorthe&whatthings=readcount'" class="category-sort-link">조회순</a></li>
     </ul>
	
</div>
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
	<div class="board">
		<table border="1" class="techtable">
		<col width="450"><col width="80"><col width="80"><col width="80"><col width="150">
			
			<%if(techlist==null||techlist.size()==0){
				
			%><tr>
				<th colspan="5">리스트가없습니다</th>
				</tr>
			<%
			}
			
			for(int i=0;i<techlist.size();i++){
				TechbbsDto dto=techlist.get(i);
				String[] tagnames=tservice.getTagName(dto.getTagname());	
				
				tservice=TechbbsService.getInstance();
				boolean chekcomment=tservice.checkcomment(techlist.get(i).getSeq());
				if(chekcomment){
			%>
			<tr>
				<th>
				#<%=techlist.get(i).getSeq() %>
			<%
			}else{
			%>
			<tr>
				<th style="border-left: 5px solid #808080">
				#<%=techlist.get(i).getSeq() %>
			<%}
			for(int j=0;j<tagnames.length;j++){//추가시킬때무조건추가시킬거는 -없이해도되고 엔터치면 -그값을넣어준다
			%>
				<span><button class="hjhtag" name="tag<%=j%>" id="tag<%=j%>" onclick="searchBbs1(this)" value="<%=tagnames[j]%>"><%=tagnames[j] %></button></span>
			<%
			}
			
			if(ologin == null){
			%>
			
			<p style="font-size: 15px; margin-top: 5px;"><a href="TechbbsController?command=techdetail&likeid=&seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></p>
			
			<%
				}else{
			%>
			<p style="font-size: 15px; margin-top: 5px;"><a href="TechbbsController?command=techdetail&likeid=<%=mem.getId() %>&seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></p>
			
			<%
			}
			%>
			</th>
			<%if(dto.getCommentcount()>0){
			%>
			<td><img src="image/repleon.PNG"><span class="textalig"> <%=dto.getCommentcount() %></span></td>
			<%
			}else{
			%>
			<td><img src="image/repleoff.png"><span class="textalig"> <%=dto.getCommentcount() %></span></td>
			<%
			}
			%>
			<%if(dto.getLikecount()>0){
			%>
			<td style="padding-top: 3px"><img src="image/likeeon.png"><span class="textalig"> <%=dto.getLikecount() %></span></td>
			<%
			}else{
			%>
			<td style="padding-top: 3px"><img src="image/likeeoff.png"><span class="textalig"> <%=dto.getLikecount() %></span></td>
			<%
			}
			%>
			<%if(dto.getReadcount()>0){
			%>
			<td><img src="image/readcounton.PNG"><span class="textalig"> <%=dto.getReadcount() %></span></td>
			<%
			}else{
			%>
			<td><img src="image/readcountoff.png"><span class="textalig"> <%=dto.getReadcount() %></span></td>
			<%
			}
			%>
			
			<td>
			<p class="myinfo_icon" style="margin-bottom: 0">
			<a onclick="location.href ='User?command=otherpage&infoid=<%=dto.getId() %>'" style="cursor: pointer">
			<%
		IUserService uservice=UserService.getInstance();
		
		int score=uservice.getScore(dto.getId());
		String getprofile=uservice.getProfile(dto.getId());
		%>
		<img src="<%=getprofile %>" class="media-object img-circle" style="max-width: 30px; float:left; max-height: 30px; margin: 0 auto;">
		</a>
		<span class="detailid" style="margin-left: 10px;">
		<a onclick="location.href ='User?command=otherpage&infoid=<%=dto.getId() %>'" style="cursor: pointer"><span style="margin-top: 5px"><%=dto.getId() %></span></a>
		<span class="" style="margin-top: 10px;"><img src="image/actionpoint.PNG" class="pointimg">
		
		<%=score%></span>
		</span> <br><br>
		</p>
			<p style="font-size: 10px"><%=dto.getWdate() %></p>
			</td>
			</tr>
			<%
			}
			%>
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
	if(document.getElementById("search").value==""){//빈문자열에서검색시
		location.href = "techbbs.jsp?findWord=TechTips&choice=tagname";	
		return;
	}
	var word = document.getElementById("search").value;
	var choice = document.getElementById("choice").value;<%-- 
	$("#select_id").val("<%=cho%>").prop("selected", true); --%>
	location.href = "techbbs.jsp?findWord=" + word + "&choice=" + choice;	
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