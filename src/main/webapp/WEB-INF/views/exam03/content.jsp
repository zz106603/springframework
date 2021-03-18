<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<%-- 메뉴 내용 부분 --%>
<div>

	<h6>링크 이용 파라미터 전달</h6>
	<a class="btn btn-primary btn-sm mb-5"
		href="method1?kind=freeboard&&pageNo=5">GET 방식 파라미터 전송</a>
	<hr />

	<h6>form 이용 파라미터 전달</h6>
	<form method="post" action="method2">
		<div class="form-group">
			<label for="uemail">Email address</label> 
			<input type="email" class="form-control" id="uemail" name="uemail" aria-describedby="emailHelp">
			<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
		</div>
		<div class="form-group">
			<label for="upassword">Password</label> 
			<input type="password" class="form-control" id="upassword" name="upassword">
		</div>
		<div class="form-group form-check">
			<input type="checkbox" class="form-check-input" id="upublic" name="upublic">
			<label class="form-check-label" for="public">공개</label>
		</div>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
	
	<hr />

	<h6>form 이용 파라미터 전달</h6>
	<form method="post" action="method3">
		<div class="form-group">
			<label for="uid">아이디</label> 
			<input type="text" class="form-control" id="uid" name="uid">
		</div>
		<div class="form-group">
			<label for="uname">이름</label> 
			<input type="text" class="form-control" id="uname" name="uname">
		</div>
		<div class="form-group">
			<label for="upassword">비밀번호</label> 
			<input type="password" class="form-control" id="upassword" name="upassword">
		</div>
		<div>
			<input type="checkbox" id="uhobby" name="uhobby" value="homework">
			<label class="form-check-label" for="uhobby">과제하기</label>
			<input type="checkbox" id="uhobby" name="uhobby" value="nightwork">
			<label class="form-check-label" for="uhobby">야근하기</label>
			<input type="checkbox" id="uhobby" name="uhobby" value="restudy">
			<label class="form-check-label" for="uhobby">복습하기</label>
		</div>

		<div class="form-group">
		    <label for="ujob">직무</label>
		    <select multiple class="form-control" id="ujob" name="ujob">
		      <option value="developer">개발자</option>
		      <option value="designer">디자이너</option>
		      <option value="manager">매니저</option>
		    </select>
	    </div>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>


