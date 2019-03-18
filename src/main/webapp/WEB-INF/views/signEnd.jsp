 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="resources/css/wow-css.css"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
<header class="site-header">
	<div class="main-header">
		<div class="logo">
			<img src="resources/images/gallery-image-1.jpg">
			<a href="goHome">WOWFLEE</a>
		</div>
		<div class="btn-header">
	        <button id="btnSearchM"><i class="fas fa-search"></i></button>
	        <button id="btnNotice"><i class="fas fa-bell"></i></button>
	        <button id="btnSlide"><i class="fas fa-bars"></i></button> 
        </div>
	</div>
	<div class="main-nav">
        <div class="list-menu">
            <ul>
                <li><a href="goBoardSpace">공간보기</a></li>
                <li><a href="goBoardSeller">셀러보기</a></li>
                <li><a href="">판매상품</a></li>
            </ul>
            
        </div> <!-- /.list-menu -->
	</div>
	
	<div id="sidenav" class="sidenav">
		<div class="side-login">
			<i class="fas fa-user-circle"></i>
			<button class="back-menu" id="btnBackMenu">X</button><br>   
			<c:if test="${sessionMember==null}">
				<button class="login-btn" id="btnGoLogin">로그인해주세요!</button>
			</c:if>   
			<c:if test="${sessionMember!=null}">
				${sessionMember.id}님
				<button class="login-btn" id="btnLogout">로그아웃</button>
			</c:if>
		</div>
		<div class="sidenav-btn">
			<button class="slide-btn">계약관리</button>
			<button class="slide-btn">지원관리</button>
			<button class="slide-btn" id="btnGoProposal">제안서관리</button>
			<button class="slide-btn">내가 쓴 글</button>
		</div>
		<a href="#">이용후기</a>
		<a href="#">찜목록</a>
		<a href="#">1:1문의</a>
		<a href="#">FAQ</a>
		<a href="#">공지사항</a>
		<a href="#">서비스정보</a>
	</div>
	
	<div id="notice" class="notice">
		<div class="notice-header">
			<font class="notice-name">알림</font>
			<button class="notice-back" id="btnBackNotice">X</button>
		</div>
		
	</div>
</header>
     
    <div class="main-content" id="main-content">
	    <div class="signUp">
	    	<div class="signUpProgress">
	   			<table class="progressTable">
	   				<tr>
	   					<td class="td-prog">기본정보입력</td>
	   					<td class="td-prog">추가정보입력</td>
	   					<td class="td-prog" style="background-color:yellow">회원가입완료</td>
	   				</tr>
	   			</table>
	   			<h3>회원가입완료</h3><hr class="progressLine">
	   		</div>
			<div class="signEnd">
				<h3>회원가입이 완료되었습니다!</h3>
				<h3>WOWFLEE를 통해 계약을 진행하려면 제안서가 필요합니다!</h3>
				<h3>지금 제안서를 쓰러가시겠습니까?</h3>
				<button id="btnGoProposal">제안서쓰러가기</button>
			</div>
		</div>
	</div>	
</body>
 
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
 	
</html>


