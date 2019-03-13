<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도 검색</title>
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
	        <button><i class="fas fa-bell"></i></button>
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
			<button class="login-btn" id="btnLogin">로그인해주세요!</button>
		</div>
		<div class="sidenav-btn">
			<button class="slide-btn">계약관리</button>
			<button class="slide-btn">지원관리</button>
			<button class="slide-btn" id="btnProposal">제안서관리</button>
			<button class="slide-btn">내가 쓴 글</button>
		</div>
		<a href="#">이용후기</a>
		<a href="#">찜목록</a>
		<a href="#">1:1문의</a>
		<a href="#">FAQ</a>
		<a href="#">공지사항</a>
		<a href="#">서비스정보</a>
	</div>
</header>
     
    <div class="main-content">
	    <!-- 지도를 표시할 div 입니다 -->
		<div class="map_wrap" style="height:100%;"> 
		    <div class="map_map" id="map_map" style="width:100%;height:100%;position:relative;overflow:hidden;">
		    </div>
			    <div class="map_category" >
			    	<ul> 
			    		<li>검색 : </li>
			    		<li><input type="text"></li>
			    		<li><button>검색</button></li>
			    	</ul><br>
			    	<ul>
			    		<li>품목 : </li>  
			    		<li><select><option>대분류</option></select></li>
			    		<li><select><option>중분류</option></select></li>
			    		<li><select><option>소분류</option></select></li>
			    		<li><button>검색</button></li> 
			    	</ul><br>
			    	<ul style="width:100%;">
			    		<li style="width:33%"><button id="map_btn1" style="width:100%; height:60px;">은행</button></li>
			    		<li style="width:33%"><button id="map_btn2" style="width:100%; height:60px;">마트</button></li>
			    		<li style="width:33%"><button id="map_btn3" style="width:100%; height:60px;">약국</button></li> 
			   		</ul><br>
			   		<ul style="width:100%">
			    		<li style="width:33%"><button id="map_btn4" style="width:100%; height:60px;">주유소</button></li>
						<li style="width:33%"><button id="map_btn5" style="width:100%; height:60px;">카페</button></li>
						<li style="width:33%"><button id="map_btn6" style="width:100%; height:60px;">편의점</button></li>
					</ul><br>
					<ul style="width:100%">
						<li style="width:50%"><button id="map_btnMyPos" style="width:100%; height:60px;">내위치</button></li>
						<li style="width:50%"><button id="map_btn8" style="width:100%; height:60px;">인기있는물품</button></li>
					</ul><br>
			    </div>
			</div>
	    </div>
	

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
<script src="resources/js/jquery-3.1.1.min.js"></script>
<script src="resources/js/wow-js.js"></script>  
</body>
</html>