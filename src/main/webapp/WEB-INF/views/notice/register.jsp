<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
				<spring:message code="notice.header.register" />
			</h2>

			<form:form modelAttribute="notice" action="/notice/register"
				method="post">

				<table>
					<tr>
						<td><spring:message code="notice.title" /></td>
						<td><form:input path="title" /></td>
						<td><font color="red"><form:errors path="title" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="notice.content" /></td>
						<td><form:textarea path="content" /></td>
						<td><font color="red"><form:errors path="content" /></font></td>
					</tr>
				</table>
			</form:form>
			<div>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="submit" id="btnRegister">
						<spring:message code="action.register" />
					</button>
				</sec:authorize>
				<button type="submit" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>

		</div>
	</div>

	<script>
		$(document).ready(function() {
			let formObj = $("#notice")
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				location.href = "/notice/list";
			});
		});
	</script>

</body>
</html>