<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/noticeList.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<title>공지사항 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="notice-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<main class="notice-container">
		<div class="notice-card">

			<h2 class="notice-title">
				<spring:message code="notice.header.list" />
			</h2>

			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/notice/register" class="notice-new-btn"><spring:message code="action.new" /></a>
			</sec:authorize>

			<table class="notice-table">
				<tr>
					<th width="80"><spring:message code="notice.no" /></th>
					<th width="320"><spring:message code="notice.title" /></th>
					<th width="180"><spring:message code="notice.regdate" /></th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="3" class="notice-empty"><spring:message code="common.listEmpty" /></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="notice">
							<tr>
								<td align="center">${notice.noticeNo}</td>
								<td align="left"><a href="/notice/read?noticeNo=${notice.noticeNo}">${notice.title}</a></td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${notice.regDate}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>

		</div>
	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		var result = "${msg}";
		if (result === "SUCCESS") {
			alert("성공적으로 완료되었습니다.");
		}
	</script>
</body>
</html>