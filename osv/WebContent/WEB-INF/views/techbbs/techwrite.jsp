<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:requestEncoding value="utf-8"/>

<!-- 로그인 여부 확인 -->
	<c:choose>
		<c:when test="${sessionScope.login eq null }">
			<c:redirect url="gotologin.do"/>
		</c:when>
		<c:otherwise>
			<c:set var="login" value="${sessionScope.login }"/>
		</c:otherwise>
	</c:choose>
<!-- /로그인 여부 확인 -->

<!-- View -->
	<div class="titlediv">
		<h2>새글쓰기</h2><br>
	</div>
	<div class="wrap">
		<form action="TechbbsController" method="post" id="pdsjsp">
			<div class="myinfo">
				<p class="myinfo_icon" style="margin-bottom: 3px;">
					<a onclick="upmydetail()" style="cursor: pointer">
						<img src="${login.profile }" class="media-object img-circle" style="max-width: 50px; float:left; max-height: 50px; margin: 0 auto;">
					</a>
					<span class="detailid">
						<a onclick="upmydetail()" style="cursor: pointer; margin-left: 20px;">${login.id }</a>
					</span>
				</p>
				<span class="" style="display: inline-block;">
					<img src="image/actionpoint.PNG" class="pointimg">
				</span>
				<span style="display: inline-block;">
					${login.score }
				</span>
				<input type="hidden" name="id" value="${login.id }">
				<input type="hidden" name="command" value="techwriteAf">
			</div>
			<div class="writearea">
				<input type="text" name="title" value="" placeholder="제목을 입력해 주세요." class="form-control" id="title" /><br>
				<input type="text" name="tagString" value="" placeholder="Tags," class="form-control" id="tagString" onblur="eventonblur()" /><br>
				<div id="tagdiv">
				</div>
				<textarea name="content" id="summernote"></textarea><br>
				<input type="button" class="btn btn-default btn-wide" onclick="gotobbs();" value="취소">
				<button id="write" style="float: right" class="btn btn-success btn-wide" onclick="write1();">글추가</button>
			</div>
		</form>
		<div class="height">
		</div>
	 </div>
	<div class="upload">
		<input type="button" class="btn btn-primary" value="첨부파일선택" onclick="openChild()"><br>
		<input type="text" value="첨부된 파일 " readonly="readonly" class="form-control">
		<textarea cols="5" rows="10" id="pInput" readonly="readonly" class="form-control"></textarea>
	</div> 
<!-- /View -->

<!-- 스크립트 -->
	<script>
		
	</script>
<!-- /스크립트 -->

<script type="text/javascript">
	function write1() {
		document.getElementById('pdsjsp').submit();
	}
</script>
<script type="text/javascript">
history.pushState(null, document.title, location.href); window.addEventListener('popstate', function(event) { history.pushState(null, document.title, location.href); });
$(document).ready(function() {
    $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
});
$(document).ready(function() {
  $('#summernote').summernote();
});

$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});
$('#tagString').keydown(function() {
    if (event.keyCode === 13) {
    	eventonblur();
    }
});
function checkSpace(str) { if(str.search(/\s/) != -1) { return true; } else { return false; } };

function doSelect(elem) {
	var deletspan=$(elem).attr('name');
	$("#"+deletspan).remove();
	$(elem).remove();
}

$("#pdsup").click(function() {
	document.getElementById('pdscontrol').submit();
});

</script>
<%
Object ologin = session.getAttribute("login");
UserDto mem = null;
mem = (UserDto)ologin;
PdsDto pdsdto=null;
List<PdsDto> pdslist=null;
IUserService service = UserService.getInstance();
String yn="";
String profile = null;
int mainscore=0;
String maingetprofile="";

if(ologin != null){
	profile = service.getProfile(mem.getId());
	mainscore=service.getScore(mem.getId());
	maingetprofile=service.getProfile(mem.getId());
}
String userID = null;
   if(session.getAttribute("userID") != null){
      userID = (String)session.getAttribute("userID");
   }
%>



	

<%
PdsServiceImpl pservice=PdsService.getInstance();

PdsDto dto11= (PdsDto)request.getAttribute("pdsdto11");
String command11=request.getParameter("command11");
if(dto11!=null&&command11!=null&&command11.equals("addafter")){
	System.out.println(command11+"황준현"+dto11.getParent());
	System.out.println("리스트생성");
	 pdslist=pservice.getpdsList(dto11.getParent());
}
%>

<%
if(dto11==null||pdslist==null){
	System.out.println("같은번호없음");
}else if(pdslist.size()<1&&dto11!=null&&pdslist!=null){
	System.out.println("황준현11");
%>
<script type="text/javascript">
var aa=document.getElementById("addya").value;
$("#addya").val(aa+" - "+"<%=pdslist.get(0).getFilename()%>"+" ");	
</script>   
<%
}else if(pdslist.size()>=1&&dto11!=null&&pdslist!=null){
	 
	 for(int i=0;i<pdslist.size();i++){
		 PdsDto dto22=pdslist.get(i);
		 System.out.println("황준현22"+dto22.getFilename());
%>
<script type="text/javascript">
   

var aa=document.getElementById("addya").value;
$("#addya").val(aa+" - "+"<%=pdslist.get(i).getFilename()%>"+" ");
</script>  
<%
}
}
%> 
<script type="text/javascript">

$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});
$('#tagString').keydown(function() {
    if (event.keyCode === 13) {
    	eventonblur();
    }
});
		
		// F5, ctrl + F5, ctrl + r 새로고침 막기
		$(document).keydown(function (e) {
		     
		            if (e.which === 116) {
		                if (typeof event == "object") {
		                    event.keyCode = 0;
		                }
		                return false;
		            } else if (e.which === 82 && e.ctrlKey) {
		                return false;
		            }
		});  

function createInputElement(type,name,value){
	 if(!type){type='';}
	 if(!name){name='';}
	 if(!value){value='';}
	 
	 var obj = null;
	 try{
	  obj = document.createElement('<input type="'+type+'" name="'+name+'" value="'+value+'" />');
	 }catch(e){
	  obj = document.createElement('input');
	  obj.type = type;
	  obj.name = name;
	  obj.value = value;
	 }
	 return obj
	}

	
function eventonblur() {
    var obj=$("#tagString").val();					//input tag text field에 값가져오기
    if(obj==""){
    	return;
    }
	$("#tagString").val("");						//input tag text field비워주기
	var span = document.createElement("span")		//input 밑에 span(id=입력한이름)태그생성
	var jbBtnText = document.createTextNode(" "+ obj+" " );
	var inputNode = createInputElement('hidden','tagnames',obj);
	span.style.background = "#5bc1de";
	span.style.display = "inline-block";
	span.style.border=" 3px solid #fff";
	span.id = obj;
	var button = document.createElement("img")	//span태그옆에 취소버튼(name=cancel)
	var BtnText = document.createTextNode( 'X' );
	button.name=obj;
	button.src="image/x.PNG"
		button.style.cursor="pointer";
	button.onclick = function(){
	doSelect(this);
	}
	button.style.background = "#5bc1de";
	button.style.color = "#fff";
	span.appendChild( jbBtnText );
	span.appendChild( inputNode );
	span.appendChild( button );
	button.appendChild( BtnText );
	$("#tagdiv").append(span);						
	
  }
</script>

<!-- Modal -->
	<!-- View 이동했을 때 session의 messageContent가 null이 아니면 modal 실행 -->
		<c:if test="${sessionScope.messageContent ne null }">
			<c:set var="messageContent" value="${sessionScope.messageCotent }"/>
		</c:if>
		<c:if test="${sessionScope.messageType ne null }">
			<c:set var="messageType" value="${sessionScope.messageType }"/>
		</c:if>
		
		<c:if test="${messageContent ne null }">
			<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="vertical-alignment-helper">
					<div class="modal-dialog vertical-align-center">
						<div class="modal-content <c:choose><c:when test="${messageContent eq '오류메시지' }">panel-warning</c:when><c:otherwise>panel-success</c:otherwise></c:choose>">
							<div class="modal-header panel-heading">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">
									${messageType }
								</h4>
							</div>
							<div class="modal-body">
								${messageContent }
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				$('#messageModal').modal("show");
			</script>
			<c:remove var="messageContent" scope="session"/>
			<c:remove var="messageType" scope="session"/>
		</c:if>
	<!-- /View 이동했을 때 session의 messageContent가 null이 아니면 modal 실행 -->
	
	<!-- 현재 View에서 modal 실행 -->
		<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div id="checkType" class="modal-content panel-info">
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">
								확인 메시지
							</h4>
						</div>
						<div id="checkMessage" class="modal-body">
							${messageContent }
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- /현재 View에서 modal 실행 -->
<!-- /Modal -->