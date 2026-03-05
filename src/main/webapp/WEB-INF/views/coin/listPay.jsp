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
<title>Coin Payment History</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/menu.css">
<link rel="stylesheet" href="/css/coinlistPay.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="page-body">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container-center">
		<div class="card card-table">

			<h2 class="card-title"><spring:message code="coin.header.listPay" /></h2>

			<table class="coin-table">
				<thead>
					<tr>
						<th><spring:message code="coin.no" /></th>
						<th><spring:message code="coin.itemName" /></th>
						<th><spring:message code="coin.payAmount" /></th>
						<th><spring:message code="coin.regdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4" class="empty-text">
									<spring:message code="common.listEmpty" />
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="payCoin">
								<tr>
									<td align="center">${payCoin.historyNo}</td>
									<td align="left">${payCoin.itemName}</td>
									<td align="right">${payCoin.amount}</td>
									<td align="center">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${payCoin.regDate}" />
									</td>
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
			if(result === "SUCCESS") {
				alert("성공적으로 완료되었습니다.");
			}
		});
	</script>

</body>
</html>