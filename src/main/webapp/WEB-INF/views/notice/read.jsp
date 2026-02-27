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
				<spring:message code="notice.header.read" />
			</h2>


			<form:form modelAttribute="notice">
				<form:hidden path="noticeNo" />

				<table>
					<tr>
						<td><spring:message code="notice.title" /></td>
						<td><form:input path="title" readonly="true" /></td>
						<td><font color="red"><form:errors path="title" /> </font></td>
					</tr>
					<tr>
						<td><spring:message code="notice.content" /></td>
						<td><form:textarea path="content" readonly="true" /></td>
						<td><font color="red"><form:errors path="content" /></font></td>
					</tr>
				</table>
			</form:form>





			<div>
				<sec:authentication property="principal" var="pinfo" />
				
				<!-- principal 정보를 pinfo 변수에 저장 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="submit" id="btnEdit">
						<spring:message code="action.edit" />
					</button>
					<button type="submit" id="btnRemove">
						<spring:message code="action.remove" />
					</button>
				</sec:authorize>

				
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
				
			</div>
		</div>
	</div>


	<script>
		$(document).ready(
				function() {
					var formObj = $("#notice");
					console.log(formObj);
					$("#btnEdit").on(
							"click",
							function() {
								let noticeNo = $("#noticeNo").val();
								self.location = "/notice/modify&noticeNo=" + noticeNo;
							});
					$("#btnRemove").on(
							"click",
							function() {
								let noticeNo = $("#noticeNo").val();
								self.location = "/notice/remove&noticeNo=" + noticeNo;
							});
					$("#btnList").on(
							"click",
							function() {
								self.location = "/board/list"});
				});
	</script>

</body>
</html>