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
		<div class="sidenav-menu">
			<a class="slide-btn" href="#">계약관리<i class="fas fa-chevron-right"></i></a>
			<a class="slide-btn" href="#">지원관리<i class="fas fa-chevron-right"></i></a>
			<a class="slide-btn" href="goProposal">제안서관리<i class="fas fa-chevron-right"></i></a>
			<a class="slide-btn" href="goUserBoard">내가쓴글<i class="fas fa-chevron-right"></i></a>
		</div>
	</div>
	
	<div id="notice" class="notice">
		<div class="notice-header">
			<font class="notice-name">알림</font>
		</div>
	</div>
	
	<div id="searchModal" class="search">
	<span class="closeSearch">&times;</span> 
		<div id="searchFilter" class="search">
			<div class="searchSection">
				<div class="searchWrap">
					<form class="searchForm">
						<input type="text" id="searchText" class="searchText" placeholder="키워드를 검색해보세요.">
						<a class="searchIcon" href="javascript:void(0);" id="goSearch"><i class="fas fa-search"></i></a>
					</form>
				</div>
				<div class="searchTable">
					<h4>추천검색어</h4>
					<div class="searchKeywordDiv">
					<ul class="ul-searchKeyword">
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=1><a href="javascript:void(0);" data-sno=1 id="keyword-a1"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　카페</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=2><a href="javascript:void(0);" data-sno=2 id="keyword-a2"><i data-sno=2 id="keyword-icon2" class="fas fa-check"></i>　애견카페</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=3><a href="javascript:void(0);" data-sno=3 id="keyword-a3"><i data-sno=3 id="keyword-icon3" class="fas fa-check"></i>　헤어밴드</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=4><a href="javascript:void(0);" data-sno=4 id="keyword-a4"><i data-sno=4 id="keyword-icon4" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=5><a href="javascript:void(0);" data-sno=5 id="keyword-a5"><i data-sno=5 id="keyword-icon5" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=6><a href="javascript:void(0);" data-sno=6 id="keyword-a6"><i data-sno=6 id="keyword-icon6" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=7><a href="javascript:void(0);" data-sno=7 id="keyword-a7"><i data-sno=7 id="keyword-icon7" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=8><a href="javascript:void(0);" data-sno=8 id="keyword-a8"><i data-sno=8 id="keyword-icon8" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=9><a href="javascript:void(0);" data-sno=9 id="keyword-a9"><i data-sno=9 id="keyword-icon9" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=10><a href="javascript:void(0);" data-sno=10 id="keyword-a10"><i data-sno=10 id="keyword-icon10" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=11><a href="javascript:void(0);" data-sno=11 id="keyword-a11"><i data-sno=11 id="keyword-icon11" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=12><a href="javascript:void(0);" data-sno=12 id="keyword-a12"><i data-sno=12 id="keyword-icon12" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=13><a href="javascript:void(0);" data-sno=13 id="keyword-a13"><i data-sno=13 id="keyword-icon13" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=14><a href="javascript:void(0);" data-sno=14 id="keyword-a14"><i data-sno=14 id="keyword-icon14" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword" data-sno=15><a href="javascript:void(0);" data-sno=15 id="keyword-a15"><i data-sno=15 id="keyword-icon15" class="fas fa-check"></i>　악세서리</a></span></li>
					</ul>
					</div>
					<h4>추천검색장소</h4>
					<div class="searchLocationDiv">
					<ul class="ul-searchKeyword">
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
						<li class="li-searchKeyword"><span class="span-searchKeyword"><a href="javascript:void(0);"><i data-sno=1 id="keyword-icon1" class="fas fa-check"></i>　악세서리</a></span></li>
					</ul>
					</div>
				</div>
			</div>
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
	  		<c:forEach var="recommend" items="${recommendSpaceList}">
	  			<article class="box_seller">
	  				<div class="inner" data-sno="${recommend.recommendNum}" >
	  					<a href="goSpaceDetail?boardnum=${recommend.boardnum}">
	  						<div class="img_border">
	  						<div class="img_area" data-sno="${recommend.recommendNum}" id="img_area${recommend.recommendNum}">
	  							<ul class="board-ul" id="board-ul${recommend.recommendNum}">
	  								<li class="board-li"><c:if test="${!empty recommend.image1}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image1}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image2}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image2}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image3}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image3}"></c:if></li>
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
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword1}"><span>#${recommend.keyword1}</span></c:if></a>
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword2}"><span>#${recommend.keyword2}</span></c:if></a>
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword3}"><span>#${recommend.keyword3}</span></c:if></a>
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword4}"><span>#${recommend.keyword4}</span></c:if></a>
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword5}"><span>#${recommend.keyword5}</span></c:if></a></h5>
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
	  		<c:forEach var="recommend" items="${recommendSellerList}">
	  			<article class="box_seller">
	  				<div class="inner" data-sno="${recommend.recommendNum}" >
	  					<a href="goSellerDetail?boardnum=${recommend.boardnum}">
	  						<div class="img_border">
	  						<div class="img_area" data-sno="${recommend.recommendNum}" id="img_area${recommend.recommendNum}">
	  							<ul class="board-ul" id="board-ul${recommend.recommendNum}">
	  								<li class="board-li"><c:if test="${!empty recommend.image1}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image1}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image2}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image2}"></c:if></li>
	  								<li class="board-li"><c:if test="${!empty recommend.image3}"><img class="img_area_image" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.image3}"></c:if></li>
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
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword1}"><span>#${recommend.keyword1}</span></c:if></a>
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword2}"><span>#${recommend.keyword2}</span></c:if></a>
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword3}"><span>#${recommend.keyword3}</span></c:if></a>
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword4}"><span>#${recommend.keyword4}</span></c:if></a>
							<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.keyword5}"><span>#${recommend.keyword5}</span></c:if></a></h5>
						</div>
	  				</div>
	  			</article>
	  			</c:forEach>
	  		</div> 
	  	</div>
	</div>
    <footer class="site-footer">
		<div class="main-footer">
			<div class="footer-logo">
				<img src="resources/images/logo.png"><br>
			</div>
		</div>
	</footer>
	</div>
</body>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>
