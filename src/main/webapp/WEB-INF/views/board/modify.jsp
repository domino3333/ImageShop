<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeGroup Register</title>
<link rel="stylesheet" href="/css/green-theme.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="page-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card">

			<h2 class="page-title">
				게시글 수정 중
			</h2>

			<form:form modelAttribute="board" action="/board/modify" method="post">
				<form:hidden path="boardNo" />
				<table>
					<tr>
						<td><spring:message code="board.title" /></td>
						<td><form:input path="title"/></td>
						<td><font color="red"><form:errors path="title" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="board.writer" /></td>
						<td><form:input path="writer" readonly="true" /></td>
						<td><font color="red"><form:errors path="writer" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="board.content" /></td>
						<td><form:textarea path="content"/></td>
						<td><font color="red"><form:errors path="content" /></font></td>
					</tr>
				</table>
			</form:form>
			<div>
				<sec:authentication property="principal" var="pinfo" />
				<!-- principal 정보를 pinfo 변수에 저장 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="submit" id="btnModify">
						<spring:message code="action.modify" />
					</button>
					<button type="submit" id="btnRemove">
						<spring:message code="action.remove" />
					</button>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<c:if test="${pinfo.username eq board.writer}">
						<button type="submit" id="btnModify">
						<spring:message code="action.modify" />
					</button>
					<button type="submit" id="btnRemove">
						<spring:message code="action.remove" />
					</button>
					</c:if>
				</sec:authorize>
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			var formObj = $("#board");
			console.log(formObj);
			$("#btnModify").on("click", function() {
				formObj.submit();
			});
			$("#btnRemove").on("click", function() {
				let boardNo = $("#boardNo").val();
				self.location = "/board/remove?boardNo="+boardNo;
			});
			$("#btnList").on("click", function() {
				self.location = "/board/list";
			});
		});
	</script>

</body>
</html>