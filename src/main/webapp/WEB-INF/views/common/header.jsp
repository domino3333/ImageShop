<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="header-wrapper">
	<div class="header-inner">

		<div class="logo-area">
			<a href="/" class="logo-text">IMAGE SHOP</a>
		</div>

		<div class="auth-area">
			<sec:authorize access="!isAuthenticated()">
				<a href="/user/register" class="auth-link">
					<spring:message code="header.joinMember" />
				</a>
				<a href="/auth/login" class="auth-button">
					<spring:message code="header.login" />
				</a>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<span class="welcome-user">
					<sec:authentication property="principal.username" /> 님
				</span>
				<a href="/auth/logout" class="auth-button">
					<spring:message code="header.logout" />
				</a>
			</sec:authorize>
		</div>

	</div>
</div>