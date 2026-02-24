<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="menu-wrapper">
	<div class="menu-inner">

		<!-- 회원 가입 메뉴 -->
		<a href="/user/register" class="menu-link"> <spring:message
				code="header.joinMember" />
		</a>
		<a href="/codegroup/list" class="menu-link"> <spring:message
				code="menu.codegroup.list" />
		</a>
		<!-- 코드 관리를 메뉴에 추가한다. -->
		<td width="120"><a href="/codedetail/list"><spring:message
					code="menu.codedetail.list" /></a></td>
		<!-- 코드 관리를 메뉴에 추가한다. -->
		<td width="120">
		<a href="/user/list">
		<spring:message code="menu.user.admin" /></a></td>

	</div>
</div>