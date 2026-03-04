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
				<spring:message code="item.header.modify" />
			</h2>


			<form:form modelAttribute="item" action="/item/modify"
				enctype="multipart/form-data" method="post">

				<form:hidden path="itemId" />


				<table>
					<tr>
						<td><spring:message code="item.itemName" /></td>
						<td><form:input path="itemName" /></td>
						<td><font color="red"><form:errors path="itemName" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemPrice" /></td>
						<td><form:input path="price" />&nbsp;원</td>
						<td><font color="red"><form:errors path="price" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="item.picture" /></td>
						<td><img src="/item/picture?itemId=${item.itemId}" width="210"></td>
					</tr>
					<tr>
						<td><spring:message code="item.preview" /></td>
						<td><img src="display?itemId=${item.itemId}" width="210"></td>
					</tr>

					<tr>
						<td><spring:message code="item.itemFile" /></td>
						<td><input type="file" name="picture" /></td>
						<td></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemPreviewFile" /></td>
						<td><input type="file" name="preview" /></td>
						<td></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemDescription" /></td>
						<td><form:textarea path="description" /></td>
						<td><form:errors path="description" /></td>
					</tr>
				</table>
			</form:form>

			<div>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="submit" id="btnModify">
						<spring:message code="action.register" />
					</button>
				</sec:authorize>
				<button type="submit" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>

		</div>
	</div>

	<script>
		$(document).ready(function() {
			let formObj = $("#item")
			$("#btnModify").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				location.href = "/item/list";
			});
		});
	</script>

</body>
</html>