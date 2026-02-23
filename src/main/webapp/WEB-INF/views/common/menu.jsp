<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="menu-wrapper">
	<div class="menu-inner">

		<a href="/user/register" class="menu-link">
			<spring:message code="header.joinMember" />
		</a>

		<a href="/codegroup/list" class="menu-link">
			<spring:message code="menu.codegroup.list" />
		</a>

	</div>
</div>