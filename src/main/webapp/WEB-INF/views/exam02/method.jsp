<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%-- 메뉴 내용 부분 --%>

method.jsp
<hr />
<div class="alert alert-primary">
	현재 요청 방식: <span id="method">${method}</span> 
</div>

<h3>&lt;form&gt; 이용</h3>
<form action="method3" method="GET">
	<input class="btn btn-info mb-2 d-inline-block" type="submit" value="GET 전송" />
</form>
<form action="method3" method="POST">
	<input class="btn btn-info mb-2 d-inline-block" type="submit" value="POST 전송" />
</form>

<!-- <form action="method3" method="PUT">
	<input class="btn btn-info mb-2" type="submit" value="PUT 전송" />
</form>
<form action="method3" method="DELETE">
	<input class="btn btn-info mb-2" type="submit" value="DELETE 전송" />
</form> -->

<hr />

<h3>&lt;ajax&gt; 이용</h3>
<button class="btn btn-info" onclick="sendGet()">AJAX GET 방식 요청</button>
<script>
	const sendGet = () => {
		$.ajax({url:"ajaxMethod3", method:"get"})
			.then(data => {
				$("#method").html(data.method);
			});
	};
</script>
<button class="btn btn-info" onclick="sendPost()">AJAX POST 방식 요청</button>
<script>
	const sendPost = () => {
		$.ajax({url:"ajaxMethod3", method:"post"})
			.then(data => {
				$("#method").html(data.method);
			});
	};
</script>
<button class="btn btn-info" onclick="sendPut()">AJAX PUT 방식 요청</button>
<script>
	const sendPut = () => {
		$.ajax({url:"ajaxMethod3", method:"put"})
			.then(data => {
				$("#method").html(data.method);
			});
	};
</script>
<button class="btn btn-info" onclick="sendDelete()">AJAX DELETE 방식 요청</button>
<script>
	const sendDelete = () => {
		$.ajax({url:"ajaxMethod3", method: "delete"})
			.then(data => {
				$("#method").html(data.method);
			});
	};
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
