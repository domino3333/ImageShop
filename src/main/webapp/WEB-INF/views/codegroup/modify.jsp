<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeGroup Modify</title>
<link rel="stylesheet" href="/css/green-theme.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="page-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card">

			<h2 class="page-title">
				<spring:message code="codegroup.header.modify" />
			</h2>

			<form:form id="codeGroup"
				modelAttribute="codeGroup"
				action="/codegroup/modify"
				method="post"
				class="form-area">

				<div class="form-row">
					<label class="form-label">
						<spring:message code="codegroup.groupCode" />
					</label>
					<form:input path="groupCode" cssClass="form-input" readonly="true"/>
					<div class="error-text">
						<form:errors path="groupCode"/>
					</div>
				</div>

				<div class="form-row">
					<label class="form-label">
						<spring:message code="codegroup.groupName" />
					</label>
					<form:input path="groupName" cssClass="form-input"/>
					<div class="error-text">
						<form:errors path="groupName"/>
					</div>
				</div>

				<div class="button-group">
					<button type="submit" class="btn-primary" id="btnModify">
						<spring:message code="action.modify" />
					</button>

					<button type="button" class="btn-secondary" id="btnList">
						<spring:message code="action.list" />
					</button>
				</div>

			</form:form>

		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
$(document).ready(function() {

	let formObj = $("#codeGroup");

	$("#btnModify").on("click", function() {
		formObj.submit();
	});

	$("#btnList").on("click", function() {
		self.location = "/codegroup/list";
	});

});
</script>

</body>
</html>