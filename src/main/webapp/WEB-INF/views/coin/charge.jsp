<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coin Charge</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/coinCharge.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body class="page-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card">

			<div class="card-header">
				<h2><spring:message code="coin.header.chargeCoin" /></h2>
			</div>

			<form:form id="chargeCoin" modelAttribute="chargeCoin" action="/coin/charge" method="post">
				<div class="form-row">
					<label class="form-label"><spring:message code="coin.amount" /></label>
					<form:input path="amount" cssClass="form-input"/>
					<div class="error-text"><form:errors path="amount"/></div>
				</div>

				<div class="button-group">
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<button type="submit" class="btn-primary" id="btnCharge">
							<spring:message code="action.charge"/>
						</button>
						<button type="button" class="btn-secondary" id="btnList">
							<spring:message code="action.list"/>
						</button>
					</sec:authorize>
				</div>
			</form:form>

		</div>
	</div>

<script>
$(document).ready(function() {
	var formObj = $("#chargeCoin");

	$("#btnCharge").on("click", function() {
		formObj.submit();
	});

	$("#btnList").on("click", function() {
		self.location = "/coin/list";
	});
});
</script>

</body>
</html>