<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%-- 메뉴 내용 부분 --%>
<div>
	<div class="alert alert-success">
		게시물 내용
	</div>
	
	<div class="form-group">
		<label for="btitle">번호</label> 
		<input type="text" class="form-control" value="${board.bno}" readonly>
	</div>
	<div class="form-group">
		<label for="btitle">제목</label> 
		<input type="text" class="form-control" value="${board.btitle}" readonly>
	</div>
	<div class="form-group">
		<label for="bcontent">내용</label> 
		<input type="text" class="form-control" value="${board.bcontent}" readonly>
	</div>
	<div class="form-group">
		<label for="bwriter">작성자</label> 
		<input type="text" class="form-control" value="${board.bwriter}" readonly>
	</div>
	<div class="form-group">
		<label for="bdate">날짜</label> 
		<input type="text" class="form-control" value='<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/>' readonly>
	</div>
	<div class="form-group">
		<label for="bhitcount">조회수</label> 
		<input type="text" class="form-control" value="${board.bhitcount}" readonly>
	</div>
	
	<div class="mb-3">
		<div class="mb-1">첨부 사진</div>
		
		<c:if test="${board.battachoname != null}">
		<a href="downloadAttach?bno=${board.bno}">
			<img src="downloadAttach?bno=${board.bno}" width="200"/>
		</a>
		</c:if>
	</div>
	
	<div>
	
	<button class="btn btn-primary btn-sm" onclick="getList()">목록</button>
		<c:if test="${$loginUid == board.bwriter}">
			<button class="btn btn-primary btn-sm" onclick="updateForm(${board.bno})">수정(U)</button>
			<button class="btn btn-danger btn-sm" onclick="deleteBoard(${board.bno})">삭제(D)</button>	
		</c:if>
		
		

	</div>
	
	    
</div>



