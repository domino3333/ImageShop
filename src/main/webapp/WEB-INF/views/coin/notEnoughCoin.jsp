<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coin 부족 안내</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/notEnoughCoin.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="page-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card card-alert">
			<h2 class="card-title"><spring:message code="coin.header.chargeCoin" /></h2>
			<p class="alert-text"><spring:message code="coin.notEnoughCoin" /></p>
			<div class="button-group">
				<a href="/coin/charge" class="btn-primary">
					<spring:message code="coin.charge" />
				</a>
				<a href="/coin/list" class="btn-secondary">
					<spring:message code="action.list" />
				</a>
			</div>
		</div>
	</div>

</body>
</html>