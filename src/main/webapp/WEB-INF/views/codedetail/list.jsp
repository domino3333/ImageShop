<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 상세 목록</title>
<link rel="stylesheet" href="/css/codedetailList.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="codedetail-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<main class="codedetail-container">
		<h2 class="page-title">
			<spring:message code="codedetail.header.list" />
		</h2>

		<div class="action-bar">
			<a href="register" class="btn-primary"><spring:message code="action.new" /></a>
		</div>

		<table class="codedetail-table">
			<tr>
				<th align="center">그룹 코드</th>
				<th align="center">코드 값</th>
				<th align="center">코드 이름</th>
				<th align="center">정렬 순서</th>
				<th align="center">등록일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5" class="empty-list"><spring:message code="common.listEmpty" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="codeDetail">
						<tr>
							<td align="center">${codeDetail.groupCode}</td>
							<td align="center">${codeDetail.codeValue}</td>
							<td align="left">
								<a href="/codedetail/read?groupCode=${codeDetail.groupCode}&codeValue=${codeDetail.codeValue}">
									${codeDetail.codeName}
								</a>
							</td>
							<td align="center">${codeDetail.sortSeq}</td>
							<td align="center">
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${codeDetail.regDate}" />
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
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