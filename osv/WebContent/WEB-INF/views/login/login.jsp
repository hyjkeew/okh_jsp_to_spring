<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:requestEncoding value="utf-8"/>

<!-- View -->
	<div class="wrap">
		<form action="loginAf.do" method="post">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<th colspan="2"><h4>로그인 양식</h4></th>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td>
							<input autofocus="autofocus" class="form-control" type="text" name="id" maxlength="20" placeholder="아이디를 입력하세요.">
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td>
							<input class="form-control" type="password" name="pwd" maxlength="20" placeholder="비밀번호를 입력하세요.">
						</td>
					</tr>
					<tr>
						<td style="text-align: left" colspan="2">
							<input class="btn btn-primary pull-right" type="submit" value="로그인">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
<!-- /View -->

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