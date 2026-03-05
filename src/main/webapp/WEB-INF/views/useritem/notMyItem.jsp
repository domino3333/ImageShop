<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download Error</title>
<link rel="stylesheet" href="/css/notMyItem.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="page-body">

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/menu.jsp" />

<div class="container-center">
    <div class="card card-error">
        <h2 class="card-title"><spring:message code="item.header.downloadError" /></h2>
        <p class="error-message"><spring:message code="item.notMyItem" /></p>
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