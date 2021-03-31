<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<%-- 메뉴 내용 부분 --%>
<div>

	
	<div class="alert alert-primary">
		<h6>로그인</h6>
	</div>
	
	
	<form method="post" action="<%=application.getContextPath()%>/login">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="form-group">
			<label for="uid">아이디</label> 
			<input type="text" class="form-control" id="uid" name="uid">
		</div>
		<div class="form-group">
			<label for="upassword">비밀번호</label> 
			<input type="password" class="form-control" id="upassword" name="upassword">
		</div>

		<button type="submit" class="btn btn-primary">로그인</button>
	</form>

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>



