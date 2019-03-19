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
			<img src="resources/images/logo.png">
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
			<i class="fas fa-user-circle"></i><br>
			<c:if test="${sessionMember==null}">
				<a class="login-btn" href="goLogin">로그인해주세요!</a>
			</c:if>   
			<c:if test="${sessionMember!=null}">
				${sessionMember.id}님
				<button class="logout-btn" id="btnLogout">로그아웃</button>
			</c:if>
		</div>
		<div class="sidenav-btn">
			<a class="slide-btn" href="#">계약관리</a>
			<a class="slide-btn" href="#">지원관리</a>
			<a class="slide-btn" href="goProposal">제안서관리</a>
			<a class="slide-btn" href="#">내가쓴글</a>
		</div>
		<div class="sidenav-menu">
			<a href="#">이용후기</a>
			<a href="#">찜목록</a>
			<a href="#">1:1문의</a>
			<a href="#">FAQ</a>
			<a href="#">공지사항</a>
			<a href="#">서비스정보</a>
		</div>
	</div>
	
	<div id="notice" class="notice">
		<div class="notice-header">
			<font class="notice-name">알림</font>
		</div>
		
	</div>
</header>
     
    <div class="main-content">
    	<div class="login-Form">
    		<div class="login-logo">
				<img alt="logo" id="logo-login" src="resources/images/logo.png">
			</div>
			<table id="login-Table">     
				<tr>
					<td id="td-id" ><span class="inputLogin"><input type="text" id="loginId" placeholder="아이디 " autofocus="autofocus" tabindex="1"></span></td> 
					<td id="td-btnLogin" rowspan="2"><input type="submit" id="btnLogin" tabindex="3" value="로그인" ></td>
				</tr>
				<tr>
					<td id="td-pw"><span class="inputLogin"><input type="password" id="loginPw" placeholder="비밀번호" tabindex="2"></span></td>
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
