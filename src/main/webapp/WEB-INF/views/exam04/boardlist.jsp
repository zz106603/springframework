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
			<%-- EL로 데이터 출력 --%>
			<td>${board.bno}</td>
			<%-- EL을 가져와서 씀 --%>
			<td>${board.btitle}</td>
			<!-- getdtitle임 get 생략 -->
			<td>${board.bcontent}</td>
			<td>${board.bwriter}</td>
			<td><fmt:formatDate value="${board.bdate}" pattern="YYYY-MM-DD"/></td>
			<td>${board.bhitcount}</td>
		</tr>
	</c:forEach>
</table>
		
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
