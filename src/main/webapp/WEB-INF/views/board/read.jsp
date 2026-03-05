<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Read</title>
<link rel="stylesheet" href="/css/boardRead.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="boardread-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="boardread-container">
		<div class="boardread-card">

			<h2 class="boardread-title">
				<spring:message code="board.header.read" />
			</h2>

			<form:form modelAttribute="board">
				<form:hidden path="boardNo" />
				<input type="hidden" id="page" name="page" value="${pgrq.page}">
				<input type="hidden" id="sizePerPage" name="sizePerPage"
					value="${pgrq.sizePerPage}">

				<table class="boardread-table">
					<tr>
						<td><spring:message code="board.title" /></td>
						<td><form:input path="title" readonly="true"
								class="boardread-input" /></td>
					</tr>
					<tr>
						<td><spring:message code="board.writer" /></td>
						<td><form:input path="writer" readonly="true"
								class="boardread-input" /></td>
					</tr>
					<tr>
						<td><spring:message code="board.content" /></td>
						<td><form:textarea path="content" readonly="true"
								class="boardread-textarea" /></td>
					</tr>
				</table>
			</form:form>

			<div class="boardread-btns">
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="button" id="btnEdit">수정</button>
					<button type="button" id="btnRemove">삭제</button>
				</sec:authorize>

				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<c:if test="${pinfo.username eq board.writer}">
						<button type="button" id="btnEdit">수정</button>
						<button type="button" id="btnRemove">삭제</button>
					</c:if>
				</sec:authorize>

				<button type="button" id="btnList">목록</button>
			</div>

			<hr>

			<sec:authentication property="name" var="loginId" />
			<c:if test="${not empty commentsList}">
				<h3>댓글 목록</h3>

				<c:forEach items="${commentsList}" var="comment">

					<div class="comment-box">

						<b>${comment.writer}</b> :

						<!-- 보기 모드 -->
						<span class="comment-content">${comment.content}</span>

						<!-- 수정 폼 (처음엔 숨김) -->
						<form method="post" action="/board/comment/modify"
							class="edit-form" style="display: none;">

							<input type="hidden" name="commentNo"
								value="${comment.commentNo}"> <input type="hidden"
								name="boardNo" value="${comment.boardNo}">
							<textarea name="content" rows="3" class="comment-edit-textarea">${comment.content}</textarea>

							<button type="submit">완료</button>
						</form>

						<c:if test="${loginId eq comment.writer}">
							<button type="button" class="btn-edit">수정</button>

							<form method="post" action="/board/comment/remove"
								style="display: inline;">
								<input type="hidden" name="commentNo"
									value="${comment.commentNo}"> <input type="hidden"
									name="writer" value="${comment.writer}"> <input
									type="hidden" name="boardNo" value="${comment.boardNo}">
								<button type="submit">삭제</button>
							</form>
						</c:if>

					</div>

				</c:forEach>
			</c:if>

			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
				<h3>댓글 작성</h3>

				<form id="commentForm" method="post" action="/board/comment/add">
					<input type="hidden" name="boardNo" value="${board.boardNo}">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<textarea name="content" id="commentContent" class="comment-input"
						placeholder="댓글을 입력하세요"></textarea>
					<br>
					<button type="submit" class="comment-submit">등록</button>
				</form>
			</sec:authorize>

		</div>
	</div>

	<script>
		$(document).ready(
				function() {

					// 게시글 버튼
					$("#btnEdit").click(
							function() {
								let page = $("#page").val();
								let size = $("#sizePerPage").val();
								let boardNo = $("#boardNo").val();
								location.href = "/board/modify?page=" + page
										+ "&sizePerPage=" + size + "&boardNo="
										+ boardNo;
							});

					$("#btnRemove").click(function() {
						let boardNo = $("#boardNo").val();
						location.href = "/board/remove?boardNo=" + boardNo;
					});

					$("#btnList").click(
							function() {
								let page = $("#page").val();
								let size = $("#sizePerPage").val();
								location.href = "/board/list?page=" + page
										+ "&sizePerPage=" + size;
							});

					// 댓글 수정 버튼
					$(".btn-edit").click(function() {
						let box = $(this).closest(".comment-box");
						box.find(".comment-content").hide();
						box.find(".edit-form").show();
						$(this).hide();
					});

				});
	</script>

</body>
</html>