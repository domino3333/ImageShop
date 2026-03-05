<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>

<link rel="stylesheet" href="/css/home.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">

</head>

<body class="home-body">

	<div class="layout-wrapper">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/menu.jsp" />

		<div class="home-container">
			<div class="home-card">
				<h1 class="home-title">
					<spring:message code="common.homeWelcome" />
				</h1>
				<p class="server-time">${serverTime}</p>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</div>

</body>
</html>