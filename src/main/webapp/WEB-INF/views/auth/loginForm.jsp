<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/css/login.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="login-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="login-container">
		<div class="login-card">

			<h2 class="login-title">
				<spring:message code="auth.header.login" />
			</h2>

			<h3 class="login-error">
				<c:out value="${error}" />
			</h3>
			<h3 class="login-logout">
				<c:out value="${logout}" />
			</h3>

			<form method="post" action="/login" class="login-form">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="username" class="input-field"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="password" class="input-field"></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="checkbox" name="remember-me" id="remember-me">
							<label for="remember-me"><spring:message code="auth.rememberMe" /></label>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="submit" class="login-button">
								<spring:message code="action.login" />
							</button>
						</td>
					</tr>
				</table>
				<sec:csrfInput />
			</form>
		</div>
	</div>

</body>
</html>