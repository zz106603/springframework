<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%-- 메뉴 내용 부분 --%>

method1form.jsp
<hr />

<form action="method1" method="post">
	<div class="form-group">
		<label for="name">이름</label> <input class="form-control" id="name"
			name="name" type="text" />
	</div>
	<input class="btn btn-info" type="submit" value="전송" />
</form>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
