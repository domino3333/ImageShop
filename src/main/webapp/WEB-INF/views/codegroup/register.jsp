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
				<spring:message code="codegroup.header.register" />
			</h2>

			<form:form id="codeGroup" modelAttribute="codeGroup"
				action="/codegroup/register" method="post" class="form-area">

				<div class="form-row">
					<label class="form-label"> <spring:message
							code="codegroup.groupCode" />
					</label>
					<form:input path="groupCode" cssClass="form-input" />
					<div class="error-text">
						<form:errors path="groupCode" />
					</div>
				</div>

				<div class="form-row">
					<label class="form-label"> <spring:message
							code="codegroup.groupName" />
					</label>
					<form:input path="groupName" cssClass="form-input" />
					<div class="error-text">
						<form:errors path="groupName" />
					</div>
				</div>

				<div class="button-group">
					<button type="submit" class="btn-primary">
						<spring:message code="action.register" />
					</button>

					<button type="button" class="btn-secondary" id="btnList">
						<spring:message code="action.list" />
					</button>
				</div>

			</form:form>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$("#btnList").on("click", function() {
				location.href = "/codegroup/list";
			});
		});
	</script>

</body>
</html>