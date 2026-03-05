<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Item Detail</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/userItemRead.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="page-body">

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/menu.jsp" />

<div class="container-center">
    <div class="card card-item-detail">
        <h2 class="card-title"><spring:message code="useritem.header.read" /></h2>

        <form:form modelAttribute="userItem" id="userItem">
            <form:hidden path="userItemNo" />

            <table class="detail-table">
                <tr>
                    <td class="label"><spring:message code="useritem.itemName" /></td>
                    <td><form:input path="itemName" readonly="true" /></td>
                    <td><font color="red"><form:errors path="itemName" /></font></td>
                </tr>
                <tr>
                    <td class="label"><spring:message code="useritem.itemPrice" /></td>
                    <td><form:input path="price" readonly="true" />원</td>
                    <td><font color="red"><form:errors path="price" /></font></td>
                </tr>
                <tr>
                    <td class="label"><spring:message code="useritem.itemFile" /></td>
                    <td><img src="/item/display?itemId=${userItem.itemId}" width="210" /></td>
                </tr>
                <tr>
                    <td class="label"><spring:message code="useritem.itemDescription" /></td>
                    <td><form:textarea path="description" readonly="true" rows="5" cols="40"/></td>
                    <td><form:errors path="description" /></td>
                </tr>
            </table>
        </form:form>

        <div class="button-group">
            <button type="button" class="btn-secondary" id="btnList">
                <spring:message code="action.list" />
            </button>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $("#btnList").on("click", function() {
        location.href = "/useritem/list";
    });
});
</script>

</body>
</html>