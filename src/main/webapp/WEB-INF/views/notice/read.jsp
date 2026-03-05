<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link rel="stylesheet" href="/css/noticeRead.css">
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
				<spring:message code="notice.header.read" />
			</h2>

			<form:form modelAttribute="notice" id="noticeForm">
				<form:hidden path="noticeNo" id="noticeNo" />

				<table class="notice-form-table">
					<tr>
						<td><spring:message code="notice.title" /></td>
						<td><form:input path="title" class="input-field" readonly="true" /></td>
						<td><font color="red"><form:errors path="title" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="notice.content" /></td>
						<td><form:textarea path="content" class="textarea-field" readonly="true" /></td>
						<td><font color="red"><form:errors path="content" /></font></td>
					</tr>
				</table>
			</form:form>

			<div class="button-group">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="button" id="btnEdit" class="btn-primary">
						<spring:message code="action.edit" />
					</button>
					<button type="button" id="btnRemove" class="btn-secondary">
						<spring:message code="action.remove" />
					</button>
				</sec:authorize>

				<button type="button" id="btnList" class="btn-secondary">
					<spring:message code="action.list" />
				</button>
			</div>

		</div>
	</main>

	<script>
		$(document).ready(function() {
			$("#btnEdit").on("click", function() {
				let noticeNo = $("#noticeNo").val();
				location.href = "/notice/modify?noticeNo=" + noticeNo;
			});
			$("#btnRemove").on("click", function() {
				let noticeNo = $("#noticeNo").val();
				location.href = "/notice/remove?noticeNo=" + noticeNo;
			});
			$("#btnList").on("click", function() {
				location.href = "/notice/list";
			});
		});
	</script>

</body>
</html>