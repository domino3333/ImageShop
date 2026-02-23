<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<link rel="stylesheet" href="/css/codegroup.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- jsp:include는 동적처리 방식임 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<div align="center">
		<h2>
			<spring:message code="codegroup.header.register" />
		</h2>
		<form:form id="codeGroup" modelAttribute="codeGroup">
			<table>
				<tr>
					<td><spring:message code="codegroup.groupCode" /></td>
					<td><form:input path="groupCode" readonly="true" /></td>
					<td><font color="red"><form:errors path="groupCode" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="codegroup.groupName" /></td>
					<td><form:input path="groupName" readonly="true" /></td>
					<td><font color="red"><form:errors path="groupName" /></font></td>
				</tr>
			</table>
			<div>
				<button type="submit" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="submit" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</form:form>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(document).ready(function() {
//1.self location으로 보낼 수도 있고
			let formObj = $("#codeGroup");
			$("#btnEdit").on("click", function() {
				let groupCode = $("$groupCode");
				let groupCodeValue = groupCode.val();
				self.location = "/codegroup/modify/groupCode="+groupCodeValue;
			});
// 2. form을 가져와서 붙일 수도 있고, 경로로 보내는 방법이 두 가지다.			
			$("#btnRemove").on("click", function() {
				formObj.attr("action","/codegroup/remove");
				formObj.attr("method","post");
				formObj.submit();
			});
			
			$("#btnList").on("click", function() {
				self.location = "/codegroup/list";
			});
		});
	</script>
</body>
</html>