<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<!DOCTYPE html>
<html>
<head>
<title>Spring</title>
<%-- application: ServletContext 객체(웹 애플리케이션 실행 정보를 가지고 있는 객체) 참조 --%>
<link rel="stylesheet"	href="<%=application.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<script	src="<%=application.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="d-flex flex-column vh-100">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark text-white font-weight-bold justify-content-between">
			<a class="navbar-brand" href="./"> <img
				src="<%=application.getContextPath()%>/resources/images/logo.png"
				width="30" height="30" class="d-inline-block align-top">
				Spring
			</a>
			<div>
				<div>
					<%-- Session을 이용한 로그인 인증에 따른 UI 선택 --%>
					<%--
					<c:if test="${loginUid == null}">
						<a class="btn btn-success btn-sm" href="<%=application.getContextPath()%>/exam07/loginForm">로그인</a>
					</c:if>
					<c:if test="${loginUid != null}">
						<span>User: ${loginUid}</span>
						<a class="btn btn-success btn-sm" href="<%=application.getContextPath()%>/exam07/logout">로그아웃</a>				
					</c:if>
					--%>
					
					<!-- Spring Security를 이용한 로그인 인증에 따른 UI 선택 -->
					<sec:authorize access="isAnonymous()">
						<a class="btn btn-success btn-sm" href="<%=application.getContextPath()%>/exam08/loginForm">로그인</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<span>USER: <sec:authentication property="name"/></span>
						<form method="post" class="d-inline-block" action="<%=application.getContextPath()%>/logout">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<button class="btn btn-success btn-sm">로그아웃</button>
						</form>
					</sec:authorize>
					
					
				</div>
			</div>
		</nav>

		<div class="flex-grow-1 container-fluid">
			<div class="row h-100">
				<div class="col-md-4 p-3 bg-dark">
					<div class="h-100 d-flex flex-column">
						<div class="flex-grow-1"
							style="height: 0px; overflow-y: auto; overflow-x: hidden;">
							<%@ include file="/WEB-INF/views/common/menu.jsp"%>
						</div>
					</div>
				</div>

				<div class="col-md-8 p-3">
					<div class=" h-100 d-flex flex-column">
						<div class="flex-grow-1 overflow-auto pr-3" style="height: 0px">