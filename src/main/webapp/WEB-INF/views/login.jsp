<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
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
     
    <div class="main-content">
    	<div class="login-Form">
    		<div class="login-logo">
				<img alt="logo" id="logo-login" src="resources/images/gallery-image-5.jpg">
			</div>
			<table id="login-Table">     
				<tr>
					<td id="td-id" ><input type="text" id="loginId" placeholder="아이디 " autofocus="autofocus" tabindex="1"></td> 
					<td id="td-btnLogin" rowspan="2"><input type="button" id="btnLogin" tabindex="3" value="로그인" ></td>
				</tr>
				<tr>
					<td id="td-pw"><input type="password" id="loginPw" placeholder="비밀번호" tabindex="2"></td>
				</tr>
			</table>
			<p id="loginIdFail"></p><p id="loginPwFail"></p>
			<div class="login-Menu">
				<ul>
					<li><button id="btnGoSignUp">회원가입</button></li>
					<li><button id="findId">아이디 찾기</button></li>
					<li><button id="findPw">비밀번호 찾기</button></li>
				</ul>
			</div>
    	</div>
	    
   		
   		
   		
    	
    </div>
</body>
	
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>
