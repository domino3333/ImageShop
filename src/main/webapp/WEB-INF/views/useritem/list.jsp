<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Item List</title>
<link rel="stylesheet" href="/css/userItemList.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="page-body">

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/menu.jsp" />

<div class="container-center">
    <div class="card card-item-list">
        <h2 class="card-title"><spring:message code="useritem.header.list" /></h2>

        <table class="item-table">
            <thead>
                <tr>
                    <th><spring:message code="useritem.no" /></th>
                    <th><spring:message code="useritem.itemName" /></th>
                    <th><spring:message code="useritem.itemPrice" /></th>
                    <th><spring:message code="useritem.regdate" /></th>
                    <th><spring:message code="useritem.download" /></th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="5" class="text-center"><spring:message code="common.listEmpty" /></td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list}" var="useritem">
                            <tr>
                                <td align="center">${useritem.userItemNo}</td>
                                <td><a href="/useritem/read?userItemNo=${useritem.userItemNo}" class="table-link">${useritem.itemName}</a></td>
                                <td align="right">${useritem.price}원</td>
                                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${useritem.regDate}" /></td>
                                <td align="center"><a href="/useritem/download?userItemNo=${useritem.userItemNo}" class="btn-download">DOWNLOAD</a></td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>


<script>
$(document).ready(function() {
    var result = "${msg}";
    if (result === "SUCCESS") {
        alert("성공적으로 완료되었습니다.");
    }
});
</script>

</body>
</html>