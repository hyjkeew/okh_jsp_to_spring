<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:requestEncoding value="utf-8"/>

<!-- View -->
	<div class="wrap">
		<form action="#none" id="_frmForm" method="POST">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>회원 등록 양식</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td>
							<input type="text" class="form-control" id="id" name="id" maxlength="20" placeholder="아이디를 입력하세요.">
							<h5 style="color: red;" id="idCheckMessage" align="left"></h5>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td colspan="2">
							<input type="password" class="form-control" id="pwd" name="pwd" maxlength="20" placeholder="비밀번호를 입력하세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호 확인</h5></td>
						<td colspan="2">
							<input onkeyup="passwordCheckFunction();" type="password" class="form-control" id="pwd2" name="pwd2" maxlength="20" placeholder="비밀번호 확인을 입력하세요.">
							<h5 style="color: red;" id="passwordCheckMessage" align="left"></h5>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5></td>
						<td colspan="2">
							<input type="text" class="form-control" id="name" name="name" maxlength="20" placeholder="이름을 입력하세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>나이</h5></td>
						<td colspan="2">
							<input type="text" class="form-control" id="age" name="age" maxlength="20" placeholder="나이를 입력하세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>성별</h5></td>
						<td colspan="2">
							<div class="form-group" style="text-align: center; margin: 0 auto;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="gender" autocomplete="off" value="남자" checked="checked">남자
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="gender" autocomplete="off" value="여자">여자
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이메일</h5></td>
						<td colspan="2">
							<input type="email" class="form-control" id="email" name="email" maxlength="20" placeholder="이메일을 입력하세요.">
							<h5 style="color: red;" id="emailCheckMessage" align="left"></h5>
						</td>
					</tr>
					<tr>
						<td style="text-align: left;"  colspan="3">
							<input class="btn btn-primary pull-right" type="button" id="joinBtn" value="등록">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
<!-- /View -->

<!-- 중복 확인 스크립트 -->
	<script type="text/javascript">
/* 아이디 중복 확인 */
		$(function() {
			$("#id").blur(function() {
				if(id != null || id != ""){
					var id = $('#id').val();
					$.ajax({
						type: 'POST',
						url: 'getID.do',
						data: {id: id},
						success: function(result) {
							if(result == "1"){
								$('#idCheckMessage').html('이미 사용된 아이디입니다.');
							}else{
								$('#idCheckMessage').html('');
							}
						}
					});
				}
			});
		});
/* 비밀번호 확인 */
		function passwordCheckFunction() {
			var userPassword1 = $('#pwd').val();
			var userPassword2 = $('#pwd2').val();
			if(userPassword1 != userPassword2){
				$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			}else{
				$('#passwordCheckMessage').html('');
			}
		}
/* 이메일 중복 확인 */
		$(function() {
			$("#email").blur(function() {
				var email = $('#email').val();
				if(email != null || email != ""){
					$.ajax({
						type: 'POST',
						url: 'getEMAIL.do',
						data: {email: email},
						success: function(result) {
							if(result == "1"){
								$('#emailCheckMessage').html('이미 사용된 이메일입니다.');
							}else{
								$('#emailCheckMessage').html('');
							}
						}
					});
				}
			});
		});
/* 빈칸 확인 */
		$("#joinBtn").click(function() {
			var data = {
					id: $('#id').val(),
					pwd: $('#pwd').val(),
					pwd2: $('#pwd2').val(),
					name: $('#name').val(),
					age: $('#age').val(),
					email: $('#email').val(),
			};
			$.ajax({
				type: 'POST',
				url: 'joincheck.do',
				data: data,
				success: function(result) {
					if(result == "1"){
						$('#checkMessage').html('모든 내용을 입력하세요.');
						$('#checkType').attr('class', 'modal-content panel-warning');
					}else if(result == "2"){
						$('#checkMessage').html('비밀번호가 서로 일치하지 않습니다.');
						$('#checkType').attr('class', 'modal-content panel-warning');
					}else if(result == "3"){
						$('#checkMessage').html('이미 사용된 아이디입니다.');
						$('#checkType').attr('class', 'modal-content panel-warning');
					}else if(result == "4"){
						$('#checkMessage').html('이미 사용된 이메일입니다.');
						$('#checkType').attr('class', 'modal-content panel-warning');
					}else if(result == "5"){
						$("#_frmForm").attr({"target":"_self", "action":"joinAf.do"}).submit();
					}
					$('#checkModal').modal("show");
				}
			});
		});
	</script>
<!-- /중복 확인 스크립트 -->

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
</body>
</html>