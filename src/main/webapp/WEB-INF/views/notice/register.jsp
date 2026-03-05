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
<title>공지사항 등록</title>
<link rel="stylesheet" href="/css/noticeRegister.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="notice-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<main class="notice-container">
		<div class="notice-card">

			<h2 class="notice-title">
				<spring:message code="notice.header.register" />
			</h2>

			<form:form modelAttribute="notice" id="noticeForm" action="/notice/register"
				method="post">

				<table class="notice-form-table">
					<tr>
						<td><spring:message code="notice.title" /></td>
						<td><form:input path="title" class="input-field" /></td>
						<td><font color="red"><form:errors path="title" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="notice.content" /></td>
						<td><form:textarea path="content" class="textarea-field" /></td>
						<td><font color="red"><form:errors path="content" /></font></td>
					</tr>
				</table>

				<div class="button-group">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="submit" id="btnRegister" class="btn-primary">
							<spring:message code="action.register" />
						</button>
					</sec:authorize>
					<button type="button" id="btnList" class="btn-secondary">
						<spring:message code="action.list" />
					</button>
				</div>
			</form:form>

		</div>
	</main>

	<script>
		$(document).ready(function() {
			$("#btnRegister").on("click", function() {
				$("#noticeForm").submit();
			});
			$("#btnList").on("click", function() {
				location.href = "/notice/list";
			});
		});
	</script>

</body>
</html>