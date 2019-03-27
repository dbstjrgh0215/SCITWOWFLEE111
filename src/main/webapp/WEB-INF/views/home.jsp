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
			<a class="slide-btn" href="goUserBoard">내가쓴글</a>
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
<div class="wrap">
    <div class="main-content" id="main-content">
    	<div class="event">
    		<div class="event-content">
    			<ul class="event-ul">
    				<li class="event-li"><a href="#"><img src="resources/images/eventbanner.jpg"></a></li>
	    			<li class="event-li"><a href="#"><img src="resources/images/eventbanner2.png"></a></li>
	    			<li class="event-li"><a href="#"><img src="resources/images/eventbanner3.jpg"></a></li>
    			</ul>
    		</div>
    		<div class="event-slider">
    			<a href="javascript:void(0);" id="event-slider-left"><i class="fas fa-chevron-left"></i></a>
    			<a href="javascript:void(0);" id="event-slider-right"><i class="fas fa-chevron-right"></i></a>
    		</div>
    	</div>
	    <div class="r-bSeller">
	  		<div class="r-bSeller-header">
	  			<h4>추천공간</h4><hr>
	  		</div>
	  		<div class="r-bSeller-content">
	  		<c:forEach var="recommend" items="${recommendList}">
	  			<article class="box_seller">
	  				<div class="inner" data-sno="${recommend.recommendNum}" >
	  					<a href="javascript:void(0);">
	  						<div class="img_border">
	  						<div class="img_area" data-sno="${recommend.recommendNum}" id="img_area${recommend.recommendNum}">
	  							<ul class="board-ul" id="board-ul${recommend.recommendNum}">
	  								<li class="board-li"><c:if test="${!empty recommend.image1}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/${recommend.image1}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image2}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/${recommend.image2}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image3}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/${recommend.image3}"></c:if></li>
	  							</ul>
	  						</div>
	  						<div class="board-img-slider" data-sno="${recommend.recommendNum}" id="board-img-slider${recommend.recommendNum}">
	  							<a href="javascript:void(0);" data-sno="${recommend.recommendNum}" class="board-img-slider-left"><button class="board-img-slider-btn" id="slide-left" data-sno="${recommend.recommendNum}" ><i class="fas fa-chevron-left"></i></button></a>
	  							<a href="javascript:void(0);" data-sno="${recommend.recommendNum}" class="board-img-slider-right"><button class="board-img-slider-btn" id="slide-right" data-sno="${recommend.recommendNum}" ><i class="fas fa-chevron-right"></i></button></a>
				    		</div>
				    		</div>
	  						<div class="info_area">
	  							<h4>${recommend.title}</h4>
	  						</div>
	  					</a>
						<div class="tag_area">
							<h5>키워드
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword1}"><span>#${recommend.keyword1}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword2}"><span>#${recommend.keyword2}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword3}"><span>#${recommend.keyword3}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword4}"><span>#${recommend.keyword4}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword5}"><span>#${recommend.keyword5}</span></c:if></a></h5>
						</div>
	  				</div>
	  			</article>
	  			</c:forEach>
	  		</div> 
	  	</div>
	  	<div class="r-bSeller">
	  		<div class="r-bSeller-header">
	  			<h4>추천셀러</h4><hr>
	  		</div>
	  		<div class="r-bSeller-content">
	  		<c:forEach var="recommend" items="${recommendList}">
	  			<article class="box_seller">
	  				<div class="inner" data-sno="${recommend.recommendNum}" >
	  					<a href="javascript:void(0);">
	  						<div class="img_border">
	  						<div class="img_area" data-sno="${recommend.recommendNum}" id="img_area${recommend.recommendNum}">
	  							<ul class="board-ul" id="board-ul${recommend.recommendNum}">
	  								<li class="board-li"><c:if test="${!empty recommend.image1}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/${recommend.image1}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image2}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/${recommend.image2}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image3}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/${recommend.image3}"></c:if></li>
	  							</ul>
	  						</div>
	  						<div class="board-img-slider" data-sno="${recommend.recommendNum}" id="board-img-slider${recommend.recommendNum}">
	  							<a href="javascript:void(0);" data-sno="${recommend.recommendNum}" class="board-img-slider-left"><button class="board-img-slider-btn" id="slide-left" data-sno="${recommend.recommendNum}" ><i class="fas fa-chevron-left"></i></button></a>
	  							<a href="javascript:void(0);" data-sno="${recommend.recommendNum}" class="board-img-slider-right"><button class="board-img-slider-btn" id="slide-right" data-sno="${recommend.recommendNum}" ><i class="fas fa-chevron-right"></i></button></a>
				    		</div>
				    		</div>
	  						<div class="info_area">
	  							<h4>${recommend.title}</h4>
	  						</div>
	  					</a>
						<div class="tag_area">
							<h5>키워드
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword1}"><span>#${recommend.keyword1}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword2}"><span>#${recommend.keyword2}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword3}"><span>#${recommend.keyword3}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword4}"><span>#${recommend.keyword4}</span></c:if></a>
							<a href="javascript:void(0);"><c:if test="${!empty recommend.keyword5}"><span>#${recommend.keyword5}</span></c:if></a></h5>
						</div>
	  				</div>
	  			</article>
	  			</c:forEach>
	  		</div> 
	  	</div>
	</div>
    <footer class="site-footer">
		<div class="main-footer">
			푸터
		</div>
	</footer>
	</div>
</body>
 	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>
