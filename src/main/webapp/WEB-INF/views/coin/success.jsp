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
<title>Coin Result</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/coinSuccess.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="page-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card card-message">

			<h2 class="card-title">
				${msg}
			</h2>

			<div class="button-group">
				<a href="/coin/list" class="btn-secondary">
					<spring:message code="action.list" />
				</a>
			</div>

		</div>
	</div>

</body>
</html>