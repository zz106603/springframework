<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<script>
	
	//data가 boardlist내용이 됨
	$(function(){
		getList(1);
	});
	
	const getList = (pageNo) => {
		$.ajax({
			url: "list",
			data: {pageNo},
			method: "get"
		}).then(data => {
			$("#board").html(data);
		});
	};
	
	const read = (bno) => {
		$.ajax({
			url: "read",
			data: {bno},
			method: "get"
		}).then(data => {
			$("#board").html(data);
		});
	};
	
	const updateForm = (bno) => {
		$.ajax({
			url: "updateForm",
			data: {bno},
			method: "get"
		}).then(data => {
			$("#board").html(data);
		});
	};
	
	const update = (bno) => {
		event.preventDefault();
		const btitle = $("#btitle").val();
		const bcontent = $("#bcontent").val();
		$.ajax({
			url: "update",
			data: {bno, btitle, bcontent},
			method: "post"
		}).then(data => {
			if(data.result == "success"){
				getList(1);	
			}
		});
	};
	
	const deleteBoard = (bno) => {
	      $.ajax({
	         url: "delete",
	         data: {bno}, /* {bno:bno} 인데 속성과 값이 같을경우 하나로 생략 가능 */
	         method: "get" /* 기본이 get방식이기 때문에 생략가능 */
	      })
	      .then(data => {
	         if(data.result == "success"){
	            getList(1);
	         }
	      });
	   };
	
	const createForm = () => {
		$.ajax({
			url: "createForm",
			method: "get"
		}).then(data => {
			$("#board").html(data);
		});
	};
	
	const create = () => {
		event.preventDefault();
		const btitle = $("#btitle").val();
		const bcontent = $("#bcontent").val();
		const battach = $("#battach")[0].files[0];
		
		const formData = new FormData(); //multipart/form-data
		formData.append("btitle", btitle);
		formData.append("bcontent", bcontent);
		
		if(battach){
			formData.append("battach", battach);
		}
		
		$.ajax({
			url: "create",
			data: formData,
			method: "post",
			cache: false,
			processData: false,
			contentType: false
		}).then(data =>{
			if(data.result == "success"){
				getList(1);	
			}
		});
	};
	
</script>

<%-- 메뉴 내용 부분 --%>
<div>
	<div class="alert alert-success">
		AJAX를 이용한 게시판	
	</div>
	

	<div id="board">
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>


