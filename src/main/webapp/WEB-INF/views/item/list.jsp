<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Shop</title>
<link rel="stylesheet" href="/css/itemList.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="page-body">

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/menu.jsp" />

<div class="container-center">
	<div class="card card-item-list">
		<h2 class="card-title"><spring:message code="item.header.list" /></h2>

		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href="/item/register" class="btn-primary btn-small">
				<spring:message code="action.new" />
			</a>
		</sec:authorize>

		<table class="item-table">
			<thead>
				<tr>
					<th><spring:message code="item.itemId" /></th>
					<th><spring:message code="item.itemName" /></th>
					<th><spring:message code="item.itemPrice" /></th>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<th><spring:message code="item.edit" /></th>
						<th><spring:message code="item.remove" /></th>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')">
						<th><spring:message code="item.read" /></th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty itemList}">
						<tr>
							<td colspan="5" align="center"><spring:message code="common.listEmpty" /></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${itemList}" var="item">
							<tr>
								<td align="center">${item.itemId}</td>
								<td align="left">${item.itemName}</td>
								<td align="right">${item.price}원</td>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<td align="center">
										<a href="/item/modify?itemId=${item.itemId}"><spring:message code="item.edit" /></a>
									</td>
									<td align="center">
										<a href="/item/remove?itemId=${item.itemId}"><spring:message code="item.remove" /></a>
									</td>
								</sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')">
									<td align="center">
										<a href="/item/read?itemId=${item.itemId}"><spring:message code="item.read" /></a>
									</td>
								</sec:authorize>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	var result = "${msg}";
	if(result === "SUCCESS") {
		alert("성공적으로 완료되었습니다.");
	}
</script>
</body>
</html>
