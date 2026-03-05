<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Group List</title>
<link rel="stylesheet" href="/css/codegroupList.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card">

			<h2 class="page-title">
				<spring:message code="codegroup.header.list" />
			</h2>

			<div class="top-action">
				<a href="/codegroup/register" class="btn-primary small-btn"> <spring:message
						code="action.new" />
				</a>
			</div>

			<table class="green-table">
				<tr>
					<th><spring:message code="codegroup.groupCode" /></th>
					<th><spring:message code="codegroup.groupName" /></th>
					<th><spring:message code="codegroup.regdate" /></th>
				</tr>

				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="3" class="empty-message"><spring:message
									code="common.listEmpty" /></td>
						</tr>
					</c:when>

					<c:otherwise>
						<c:forEach items="${list}" var="codeGroup">
							<tr>
								<td>${codeGroup.groupCode}</td>
								<td><a
									href="/codegroup/read?groupCode=${codeGroup.groupCode}"
									class="table-link"> ${codeGroup.groupName} </a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${codeGroup.regDate}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>

		</div>
	</div>

</body>
</html>