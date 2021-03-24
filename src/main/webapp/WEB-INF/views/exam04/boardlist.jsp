<%-- page 지시자 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mycompany.webapp.dto.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%-- 메뉴 내용 부분 --%>

<div class="card">
	<div class="card-header">
		게시물 목록
	</div>
	
	<div class="card-body">
		<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>

	<c:forEach var="board" items="${list}">
		<tr>
			
			<td>${board.bno}</td>
			<td><a href="read?bno=${board.bno}">${board.btitle}</td>
			<td>${board.bcontent}</td>
			<td>${board.bwriter}</td>
			<td><fmt:formatDate value="${board.bdate}" pattern="YYYY-MM-DD"/></td>
			<td>${board.bhitcount}</td>
		</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5" style="text-center">
			<a class="btn btn-outline-primary btn-sm"
				href="list?pageNo=1">처음</a>
				
			<c:if test="${pager.groupNo>1}">
				<a class="btn btn-outline-info btn-sm"
				href="list?pageNo=${pager.startPageNo-1}">이전</a>
			</c:if>
			
			<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				<c:if test="${pager.pageNo == i}">
					<a class="btn btn-outline-success btn-sm" 
						href="list?pageNo=${i}">${i}</a>
				</c:if>
				<c:if test="${pager.pageNo != i}">
					<a class="btn btn-outline-danger btn-sm" 
						href="list?pageNo=${i}">${i}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${pager.groupNo<pager.totalGroupNo}">
				<a class="btn btn-outline-info btn-sm"
				href="list?pageNo=${pager.endPageNo+1}">다음</a>
			</c:if>
				
			<a class="btn btn-outline-primary btn-sm"
				href="list?pageNo=${pager.totalPageNo}">맨끝</a>
			
			<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
		</td>
	</tr>
</table>
		
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
