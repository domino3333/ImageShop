<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
				<spring:message code="user.header.register" />
			</h2>

			<form:form modelAttribute="member" action="/user/register" method="post">

				<table class="user_table">
					<tr>
						<td><spring:message code="user.userId" /></td>
						<td><form:input path="userId" /></td>
						<td><font color="red"><form:errors path="userId" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="user.userPw" /></td>
						<td><form:input path="userPw" /></td>
						<td><font color="red"><form:errors path="userPw" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="user.userName" /></td>
						<td><form:input path="userName" /></td>
						<td><font color="red"><form:errors path="userName" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="user.job" /></td>
						<td><form:select path="job" items="${jobList}"
								itemValue="value" itemLabel="label" /></td>
						<td><font color="red"><form:errors path="job" /></font></td>
					</tr>
				</table>


			</form:form>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			let formObj = $("member")
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				location.href = "/user/list";
			});
		});
	</script>

</body>
</html>