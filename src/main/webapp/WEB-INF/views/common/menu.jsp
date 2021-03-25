<%@ page contentType="text/html; charset=UTF-8"%>

<ul class="nav flex-column">
  <li class="nav-item">
    <h6 class="text-white">Controller</h6>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>">Home</a>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam01/boardlist">Controller에서 JSP로 데이터 전달</a>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam02/method1form">한글 복원 문자 인코딩</a>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam02/method2">리다이렉트</a>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam02/method3">요청 방식별 Contoller의 메소드 실행</a>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam03/content">요청 파라미터 받기</a>
  
    
  </li>
  <li class="nav-item">
    <h6 class="text-white">DB 연동</h6>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam04/content">게시판</a>
  </li>
  
   <li class="nav-item">
    <h6 class="text-white">ajax 연동</h6>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam05/content">게시판</a>
  </li>
  
  <li class="nav-item">
    <h6 class="text-white">쿠키</h6>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam06/content">쿠키 & 세션</a>
  </li>
  
    <li class="nav-item">
    <h6 class="text-white">회원 서비스</h6>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam07/joinForm">회원 가입</a>
    <a class="nav-link text-warning" href="<%=application.getContextPath() %>/exam07/loginForm">로그인</a>
  </li>
  
</ul>