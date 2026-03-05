<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Detail</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/itemRead.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="page-body">

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/menu.jsp" />

<div class="container-center">
    <div class="card card-item-read">
        <h2 class="card-title"><spring:message code="item.header.read" /></h2>

        <form:form id="itemForm" modelAttribute="item" action="/item/buy" method="post">
            <form:hidden path="itemId" />

            <table class="item-detail-table">
                <tr>
                    <td><spring:message code="item.itemName" /></td>
                    <td><form:input path="itemName" readonly="true" /></td>
                    <td><font color="red"><form:errors path="itemName" /></font></td>
                </tr>
                <tr>
                    <td><spring:message code="item.itemPrice" /></td>
                    <td><form:input path="price" readonly="true" />&nbsp;원</td>
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
                    <td><spring:message code="item.itemDescription" /></td>
                    <td><form:textarea path="description" readonly="true" rows="6" cols="40"></form:textarea></td>
                    <td><form:errors path="description" /></td>
                </tr>
            </table>
        </form:form>

        <div class="button-group">
            <button type="button" id="btnBuy" class="btn-primary">
                <spring:message code="action.buy" />
            </button>
            <button type="button" id="btnList" class="btn-secondary">
                <spring:message code="action.list" />
            </button>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
$(document).ready(function() {
    let formObj = $("#itemForm");

    $("#btnBuy").on("click", function() {
        formObj.submit();
    });

    $("#btnList").on("click", function() {
        location.href = "/item/list";
    });
});
</script>
</body>
</html>