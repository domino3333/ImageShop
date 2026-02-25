<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeGroup Register</title>
<link rel="stylesheet" href="/css/green-theme.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="page-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card">

			<h2 class="page-title">
				<spring:message code="user.header.modify" />
			</h2>

			<form:form modelAttribute="member" action="/user/modify2" method="post">
				<form:hidden path="userNo" />
				<form:hidden path="userId" />
				<table class="user_table">
					<tr>
						<td><spring:message code="user.userId" /></td>
						<td><form:input path="userId" disabled="true" /></td>
						<td><font color="red"><form:errors path="userId" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="user.userPw" /></td>
						<td><form:input path="userPw" readonly="true" /></td>
						<td><font color="red"><form:errors path="userPw" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="user.userName" /></td>
						<td><form:input path="userName" /></td>
						<td><font color="red"><form:errors path="userName" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="user.job" /></td>
						<td><form:select path="job" items="${jobList}"
								itemValue="value" itemLabel="label" /></td>
						<td><font color="red"><form:errors path="job" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="user.auth" /> - 1</td>
						<td><form:select path="authList[0].auth">
								<form:option value="" label="=== 선택해 주세요===" />
								<form:option value="ROLE_USER" label="사용자" />
								<form:option value="ROLE_MEMBER" label="회원" />
								<form:option value="ROLE_ADMIN" label="관리자" />
							</form:select></td>
					</tr>

					<tr>
						<td><spring:message code="user.auth" /> - 2</td>
						<td><form:select path="authList[1].auth">
								<form:option value="" label="=== 선택해 주세요===" />
								<form:option value="ROLE_USER" label="사용자" />
								<form:option value="ROLE_MEMBER" label="회원" />
								<form:option value="ROLE_ADMIN" label="관리자" />
							</form:select></td>
					</tr>
					<tr>
						<td><spring:message code="user.auth" /> - 3</td>
						<td><form:select path="authList[2].auth">
								<form:option value="" label="=== 선택해 주세요===" />
								<form:option value="ROLE_USER" label="사용자" />
								<form:option value="ROLE_MEMBER" label="회원" />
								<form:option value="ROLE_ADMIN" label="관리자" />
							</form:select></td>
					</tr>
				</table>
				<div>
					<button type="button" id="btnEdit">
						<spring:message code="action.edit" />
					</button>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="button" id="btnList">
							<spring:message code="action.list" />
						</button>
					</sec:authorize>
				</div>

			</form:form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script>
		$(document).ready(function() {

			var formObj = $("#member");
			
			$("#btnEdit").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "/user/list";
			});
		});
	</script>

</body>
</html>