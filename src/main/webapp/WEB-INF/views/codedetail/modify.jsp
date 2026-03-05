<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Detail Modify</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/codedetailModify.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/menu.jsp" />

<div class="container-center">
    <div class="card">
        <h2 class="page-title"><spring:message code="codegroup.header.read"/></h2>

        <form:form id="codeDetail" modelAttribute="codeDetail" class="form-area">

            <div class="form-row">
                <label><spring:message code="codedetail.groupCode"/></label>
                <form:hidden path="groupCode"/>
                <form:select path="groupCode" items="${groupCodeList}" itemValue="value" itemLabel="label" disabled="true"/>
                <div class="error"><form:errors path="groupCode"/></div>
            </div>

            <div class="form-row">
                <label><spring:message code="codedetail.codeValue"/></label>
                <form:hidden path="codeValue"/>
                <form:input path="codeValue" disabled="true"/>
                <div class="error"><form:errors path="codeValue"/></div>
            </div>

            <div class="form-row">
                <label><spring:message code="codedetail.codeName"/></label>
                <form:input path="codeName"/>
                <div class="error"><form:errors path="codeName"/></div>
            </div>

            <div class="button-group">
                <button type="submit" class="btn-primary" id="btnModify"><spring:message code="action.modify"/></button>
                <button type="button" class="btn-secondary" id="btnList"><spring:message code="action.list"/></button>
            </div>

        </form:form>
    </div>
</div>

<script>
$(document).ready(function() {
    let formObj = $("#codeDetail");

    $("#btnModify").on("click", function() {
        formObj.attr("action", "/codedetail/modify");
        formObj.attr("method", "post");
        formObj.submit();
    });

    $("#btnList").on("click", function() {
        location.href = "/codedetail/list";
    });
});
</script>

</body>
</html>