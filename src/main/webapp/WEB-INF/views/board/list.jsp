<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<link rel="stylesheet" href="/css/boardList.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="board-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<main class="board-main">
		<h2 class="board-title">
			<spring:message code="board.header.list" />
		</h2>

		<!-- 검색 폼을 만든다. -->
		<form:form modelAttribute="pgrq" method="get"
			action="/board/list${pgrq.toUriStringByPage()}" class="search-form">
			<form:select path="searchType" items="${searchTypeCodeValueList}"
				itemValue="value" itemLabel="label" class="search-select" />
			<form:input path="keyword" class="search-input" />
			<button type="submit" class="search-button">
				<spring:message code="action.search" />
			</button>
		</form:form>

		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<a href="/board/register" class="board-new-button">
				<spring:message code="action.new" />
			</a>
		</sec:authorize>

		<table class="board-table">
			<tr>
				<th width="80"><spring:message code="board.no" /></th>
				<th width="320"><spring:message code="board.title" /></th>
				<th width="100"><spring:message code="board.writer" /></th>
				<th width="180"><spring:message code="board.regdate" /></th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4" class="empty-msg"><spring:message code="common.listEmpty" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardNo}</td>
							<td>
								<a href="/board/read${pgrq.toUriString(pgrq.page)}&boardNo=${board.boardNo}">
									${board.title}
									<c:if test="${board.commentCount > 0}">
										(${board.commentCount})
									</c:if>
								</a>
							</td>
							<td>${board.writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<!-- 페이징 네비게이션 -->
		<div class="pagination">
			<c:if test="${empty pgrq.keyword}">
				<c:if test="${pagination.prev}">
					<a href="/board/list${pagination.makeQuery(pagination.startPage - 1)}">&laquo;</a>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<c:choose>
						<c:when test="${pagination.pageRequest.page eq idx}">
							<a class="active" href="/board/list${pagination.makeQuery(idx)}">[${idx}]</a>
						</c:when>
						<c:otherwise>
							<a href="/board/list${pagination.makeQuery(idx)}">${idx}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pagination.next && pagination.endPage > 0}">
					<a href="/board/list${pagination.makeQuery(pagination.endPage +1)}">&raquo;</a>
				</c:if>
			</c:if>
		</div>

	</main>

	<script>
		var result = "${msg}";
		if (result === "SUCCESS") {
			alert("성공적으로 완료되었습니다.");
		}
	</script>
</body>
</html>