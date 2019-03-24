<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>WOWFLEE</title>
	
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
                <li><a href="javascript:void(0);" id="goSpace">공간보기</a></li>
                <li><a href="javascript:void(0);" id="goSeller">셀러보기</a></li>
                <li><a href="javascript:void(0);" id="goProduct">판매상품</a></li>
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
				${sessionMember.nickname}님
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
     
    <div class="main-content" id="main-content">
    	<div class="event">
    		<div class="event-content">
    			<img alt="logo" id="logo-login" src="resources/images/eventbanner.jpg">
    		</div>
    		<div class="event-slider">
    			<a href="#" id="event-slider-left"><i class="fas fa-chevron-left"></i></a>
    			<a href="#" id="event-slider-right"><i class="fas fa-chevron-right"></i></a>
    		</div>
    	</div>
    	<div class="recommend-space">
    		<div class="r-space-header">
    			추천공간
    		</div>
    		<div class="r-space-content">
    			<table class="r-space-table">
    				<tr>
	    				<td class="r-space-image"><img alt="logo" id="logo-login" src="resources/images/gallery-image-1.jpg"></td>
		    			<td class="r-space-image"><img alt="logo" id="logo-login" src="resources/images/gallery-image-1.jpg"></td>
		    			<td class="r-space-image"><img alt="logo" id="logo-login" src="resources/images/gallery-image-1.jpg"></td>
    				</tr>
    				<tr>
    					<td><a href="">추천 공간 1번</a></td>
	    				<td><a href="">추천 공간 2번</a></td>
	    				<td><a href="">추천 공간 3번</a></td> 
    				</tr>
    			</table>
    		</div> 
    	</div>
    	<div class="recommend-seller">
    		
    		<div class="r-seller-header"> 
    			추천셀러
    		</div> 
    		
    		<div class="r-seller-content">
    			<div class="r-seller-image"> 
    				<table class="r-space-table">
    				<tr>
	    				<td class="r-seller-image"><img alt="logo" id="logo-login" src="resources/images/gallery-image-2.jpg"></td>
		    			<td class="r-seller-image"><img alt="logo" id="logo-login" src="resources/images/gallery-image-2.jpg"></td>
		    			<td class="r-seller-image"><img alt="logo" id="logo-login" src="resources/images/gallery-image-2.jpg"></td>
    				</tr>
    				<tr>
    					<td><a href="">추천 셀러 1번</a></td>
	    				<td><a href="">추천 셀러 2번</a></td>
	    				<td><a href="">추천 셀러 3번</a></td>
    				</tr>
    			</table>
    			</div>
    			
    		</div>
    	</div>
    </div>
</body>
 	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>
