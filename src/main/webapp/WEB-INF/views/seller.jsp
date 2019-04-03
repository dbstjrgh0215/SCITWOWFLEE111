<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.name}</title>
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
   		<div class="boardDetail-image">
    		<div class="board-content-image">
    			<ul class="board-content-image-ul"> 
    				<li class="board-content-image-li"><c:if test="${!empty boardDetail[0].image1}"><img src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image1}"></c:if></li>
	    			<li class="board-content-image-li"><c:if test="${!empty boardDetail[0].image2}"><img src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image2}"></c:if></li>
	    			<li class="board-content-image-li"><c:if test="${!empty boardDetail[0].image3}"><img src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image3}"></c:if></li>
    			</ul>
    		</div>
    		<div class="board-content-image-slider">
    			<a href="javascript:void(0);" id="board-content-image-slider-left"><i class="fas fa-chevron-left"></i></a>
    			<a href="javascript:void(0);" id="board-content-image-slider-right"><i class="fas fa-chevron-right"></i></a>
    		</div>
   		</div>
    	<div class="board">
    		<div class="board-header">
	    		<h2 class="board-name">${board.name}</h2>
	    		<h3 class="board-title">${board.title}</h3>
    		</div>
    		<div class="board-tag">
    			<c:if test="${!empty boardDetail[0].keyword1}"><a href="#"><span class="board-keyword">#${boardDetail[0].keyword1}</span></a></c:if>
    			<c:if test="${!empty boardDetail[0].keyword2}"><a href="#"><span class="board-keyword">#${boardDetail[0].keyword2}</span></a></c:if>
    			<c:if test="${!empty boardDetail[0].keyword3}"><a href="#"><span class="board-keyword">#${boardDetail[0].keyword3}</span></a></c:if>
    			<c:if test="${!empty boardDetail[0].keyword4}"><a href="#"><span class="board-keyword">#${boardDetail[0].keyword4}</span></a></c:if>
    			<c:if test="${!empty boardDetail[0].keyword5}"><a href="#"><span class="board-keyword">#${boardDetail[0].keyword5}</span></a></c:if>
    		</div>
    		<div class="board-content">
    			<div class="boardComment">
    				<h3 class="board-h">셀러소개</h3><hr class="board-hr">
	    			<p class="board-comments">${board.comments}</p>
    			</div>
    			<div class="boardInfo">
    				<h3 class="board-h">셀러정보</h3><hr class="board-hr">
    				<div class="boardInfo-table"></div>
	    			<table>
	    				<tr>
	    					<td>물품분류</td>
	    					<td>
	    					<c:if test="${!empty boardDetail[0].type1}">${boardDetail[0].type1}</c:if>
	    					<c:if test="${!empty boardDetail[0].type2}">${boardDetail[0].type2}</c:if>
	    					<c:if test="${!empty boardDetail[0].type3}">${boardDetail[0].type3}</c:if>
	    					<c:if test="${!empty boardDetail[0].type4}">${boardDetail[0].type4}</c:if>
	    					<c:if test="${!empty boardDetail[0].type5}">${boardDetail[0].type5}</c:if>
	    					<c:if test="${!empty boardDetail[0].type6}">${boardDetail[0].type6}</c:if>
	    					<c:if test="${!empty boardDetail[0].type7}">${boardDetail[0].type7}</c:if>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td>희망판매가격</td>
	    					<td>${board.price}원</td>
	    				</tr>
	    				<tr>
	    					<td>현재재고</td>
	    					<td>${board.stock}개</td>
	    				</tr>
	    				<tr>
	    					<td>계약기간</td>
	    					<td>
	    					<c:if test="${!empty boardDetail[0].contractPeriod1}">${boardDetail[0].contractPeriod1}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod2}">${boardDetail[0].contractPeriod2}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod3}">${boardDetail[0].contractPeriod3}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod4}">${boardDetail[0].contractPeriod4}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod5}">${boardDetail[0].contractPeriod5}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod6}">${boardDetail[0].contractPeriod6}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod7}">${boardDetail[0].contractPeriod7}</c:if>
	    					</td>
	    				</tr>
	    			</table>
    			</div>
    			<div class="boardImage">
    				<h3 class="board-h">셀러사진</h3><hr class="board-hr">
    				<div class="board-image">
    					<div class="board-image1"><c:if test="${!empty boardDetail[0].image1}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image1}"></c:if></div>
    					<div class="board-image2"><c:if test="${!empty boardDetail[0].image2}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image2}"></c:if></div>
    					<div class="board-image3"><c:if test="${!empty boardDetail[0].image3}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image3}"></c:if></div>
    				</div>
    			</div>
    			<div class="board-precaution">
    				<h3 class="board-h">계약시 주의사항</h3><hr class="board-hr">
	    			<p class="board-comments">${board.precaution}</p>
    			</div>
    		</div>
    		<div class="board-comment">
    			<h3 class="board-h">댓글</h3><hr class="board-hr">
    			<table class="comment-table">
    				<tr>
    					<th>작성자</th>
    					<th>댓글</th>
    					<th>작성일자</th>
    				</tr>
    				<tr>
    					<td>윤석호</td>
    					<td>지난번에 방문했었는데 고양이들이 너무 귀여웠어요!</td>
    					<td>2019-03-28</td>
    				</tr>
    				<tr>
    					<td class="comment-td1" colspan="2"><input class="comment-insert" type="text"></td>
    					<td><button>입력</button></td>
    				</tr>
    			</table>
    		</div>
    	</div>
    	<div class="sellerOtherBoard">
   			<h3 class="board-h">이 상품을 판매하는 셀러의 다른 상품</h3><hr class="board-hr">
   			<div class="board-image">
  					<div class="board-image1"><c:if test="${!empty boardDetail[0].image1}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image1}"></c:if></div>
  					<div class="board-image2"><c:if test="${!empty boardDetail[0].image2}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image2}"></c:if></div>
  					<div class="board-image3"><c:if test="${!empty boardDetail[0].image3}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image3}"></c:if></div>
  				</div>
   		</div>
   		<div class="similarBoard">
   			<h3 class="board-h">비슷한 셀러</h3><hr class="board-hr">
   			<div class="board-image">
  					<div class="board-image1"><c:if test="${!empty boardDetail[0].image1}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image1}"></c:if></div>
  					<div class="board-image2"><c:if test="${!empty boardDetail[0].image2}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image2}"></c:if></div>
  					<div class="board-image3"><c:if test="${!empty boardDetail[0].image3}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image3}"></c:if></div>
  				</div>
   		</div>
	</div>
	<div class="contractWindow2">
		<h3 class="board-h">계약신청방식선택</h3>
		<div class="board-contract">
			<div class="contract-intro">
				<h5>계약을 신청하려면 <font style="color:#FFAF0A;">셀러/공간제공자</font>로 로그인이 필요합니다.</h5>
			</div>
			<div class="contract-select">
				<ul class="contract-select-ul">
					<li class="contract-select-li"><h5><input type="radio" name="contractType" value="online">온라인 신청</h5></li>
					<li class="contract-selectType-li" id="contract-online"><h5>온라인 신청을 하면 작성한 제안서를 상대방에게 전달합니다.</h5></li>
					<li class="contract-select-li"><h5><input type="radio" name="contractType" value="online">오프라인 신청</h5></li>
					<li class="contract-selectType-li" id="contract-offline"><h5>오프라인 신청을 하면 제안서를 첨부하지않고 계약요청이 있음을 상대방에게 전달합니다.</h5></li>
					<li class="contract-select-li"><span id="selectedContractType"></span><button class="btnContract">계약 요청</button></li>
				</ul>
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
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>
