<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 상세 보기</title>
<link rel="stylesheet" href="/css/codedetailRead.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="codedetail-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card">

			<h2 class="page-title">
				<spring:message code="codegroup.header.read" />
			</h2>

			<form:form id="codeDetail" modelAttribute="codeDetail" class="form-area">

				<div class="form-row">
					<div class="form-label"><spring:message code="codedetail.groupCode" /></div>
					<div class="form-input">
						<form:hidden path="groupCode" />
						<form:select path="groupCode" items="${groupCodeList}" itemValue="value" itemLabel="label" disabled="true" />
					</div>
					<div class="form-error"><form:errors path="groupCode" /></div>
				</div>

				<div class="form-row">
					<div class="form-label"><spring:message code="codedetail.codeValue" /></div>
					<div class="form-input"><form:input path="codeValue" readonly="true" /></div>
					<div class="form-error"><form:errors path="codeValue" /></div>
				</div>

				<div class="form-row">
					<div class="form-label"><spring:message code="codedetail.codeName" /></div>
					<div class="form-input"><form:input path="codeName" readonly="true" /></div>
					<div class="form-error"><form:errors path="codeName" /></div>
				</div>

				<div class="button-group">
					<button type="submit" class="btn-primary" id="btnEdit"><spring:message code="action.edit" /></button>
					<button type="button" class="btn-primary" id="btnRemove"><spring:message code="action.remove" /></button>
					<button type="button" class="btn-secondary" id="btnList"><spring:message code="action.list" /></button>
				</div>

			</form:form>

		</div>
	</div>

	<script>
		$(document).ready(function() {
			let formObj = $("#codeDetail");

			$("#btnEdit").on("click", function() {
				formObj.attr("action", "/codedetail/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$("#btnRemove").on("click", function(e) {
				e.preventDefault();
				if (confirm("정말 삭제하시겠습니까?")) {
					formObj.attr("action", "/codedetail/remove");
					formObj.attr("method", "get");
					formObj.submit();
				}
			});

			$("#btnList").on("click", function() {
				self.location = "/codedetail/list";
			});
		});
	</script>

</body>
</html>