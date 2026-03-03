<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<h2>
	<spring:message code="coin.header.chargeCoin" />
</h2>
<form:form id="chargeCoin" modelAttribute="chargeCoin" action="/coin/charge"
	method="post">
	<table>
		<tr>
			<td><spring:message code="coin.amount" /></td>
			<td><form:input path="amount" /></td>
			<td><font color="red"><form:errors path="amount" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	<sec:authorize access="hasRole('ROLE_MEMBER')">
		<button type="submit" id="btnCharge">
			<spring:message code="action.charge" />
		</button>
	</sec:authorize>
	<button type="button" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("#chargeCoin");
		$("#btnCharge").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/coin/list";
		});
	});
</script>