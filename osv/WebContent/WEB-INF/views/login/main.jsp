<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/> 
<%!
// 답글
public String arrow(int depth){	
	String rs = "<img src='image/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	String ts = "";
	
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	return depth == 0?"":ts+rs;
}
%>
	<%
	String findWord = request.getParameter("findWord"); 
	String choice = request.getParameter("choice"); 
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
	<!-- 황준현 -->
<!-- wrap로 메인페이지 섹션사이즈만들어준거고 그밑에 자식들 partition1~partition4로 테이블뿌리면된니다  -->
	<div class="wrap" id="tableChange">
	<div class="sercharea">
	<button class="btn btn-success btn-wide" onclick="location.href='TotalController?command=totalbbs'">전체게시판</button>
<select id="choice" style="margin-left: 30px">
		<option value="tagname">선택하세요</option>
		<option value="title" >제목</option>
		<option value="writer" >작성자</option>
		<option value="content" >내용</option>
		</select>
<input type="text" placeholder="전체글 검색어" class="inputField" id="search" value="<%=findWord %>">
<button name="search" id="serchbtn" class="input-group-btn" onclick="searchBbs()"><img alt="" src="image/serchbtn.PNG"></button>
</div>
<script type="text/javascript">
function searchBbs() {
	if(document.getElementById("choice").value=="tagname"){
		alert("선택해주세요");
		$("#search").val("");
		return;
	}
	if(document.getElementById("search").value==""){//빈문자열에서검색시
		
		return;
	}
	var word = document.getElementById("search").value;
	var choice = document.getElementById("choice").value;
	$("#select_id").val("<%=cho %>").prop("selected", true);
	location.href = "TotalController?command=serch&findWord=" + word + "&choice=" + choice;	
}
function searchBbs1(e) {
	$("#search").val("");
	var word = e.value;
	var choice = document.getElementById("choice").value;
	location.href = "totalbbs.jsp?findWord=" + word + "&choice=tagname";	
	
}
</script>
<a href="test.do">로그인</a>
		<div class="partition1">
			<h4 style="margin-bottom: 15px">Q&A <a href="qnaServlet?command=listQna"><img style="float: right" alt="게시판으로가기" src="image/moresee.PNG"></a></h4>
			
			<table class="techtable">
			<tr>
				<th>Q&A가 없습니다.</th>
				</tr>
		</table>
		</div>
		
		<div class="partition2">
		<h4 style="margin-bottom: 15px">사는얘기 <a href="LifeBbs?command=life"><img style="float: right" alt="게시판으로가기" src="image/moresee.PNG"></a></h4>
			
			<table border="1" class="techtable">
			<tr>
				<th>리스트가 없습니다.</th>
				</tr>
		
		</table>
		</div>
		<div class="partition3">
			<h4 style="margin-bottom: 15px">기술 게시판 <a href="TechbbsController?command=techbbs"><img style="float: right" alt="" src="image/moresee.PNG"></a></h4>
			<table border="1" class="techtable">
			<tr>
				<th>기술 게시판 글이 없습니다.</th>
				</tr>
		
      </table>
      </div>
	</div>