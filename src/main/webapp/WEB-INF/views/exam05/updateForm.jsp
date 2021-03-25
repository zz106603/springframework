<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%-- 메뉴 내용 부분 --%>
<div>
	<div class="alert alert-success">
		게시물 수정
	</div>
	
	<form onsubmit="update(${board.bno})">
		<div class="form-group">
			<label for="btitle">제목</label> 
			<input type="text" class="form-control" id="btitle" name="btitle" value="${board.btitle}">
		</div>
		<div class="form-group">
			<label for="bcontent">내용</label> 
			<input type="text" class="form-control" id="bcontent" name="bcontent" value="${board.bcontent}">
		</div>
		<button type="submit" class="btn btn-primary">저장</button>
		<button onclick="read(${board.bno})" class="btn btn-primary">취소</button>
	</form>
	
	    
</div>



