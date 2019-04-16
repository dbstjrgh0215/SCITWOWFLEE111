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
    			<input type="hidden" id="board-num" value="${board.boardnum}">
   				<input type="hidden" id="boardId" value="${board.id}">
    			<input type="hidden" id="sessionId" value="${sessionMember.id}">
	    		<h2 class="board-name" id="boardName">${board.name}</h2>
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
    				<h3 class="board-h">공간소개</h3><hr class="board-hr">
	    			<p class="board-comments">${board.comments}</p>
    			</div>
    			<div class="boardInfo">
    				<h3 class="board-h">공간정보</h3><hr class="board-hr">
    				<div class="boardInfo-table"></div>
	    			<table>
	    				<tr>
	    					<td>공간분류</td>
	    					<td>커피전문점 - 애견카페 - 고양이카페</td>
	    				</tr>
	    				<tr>
	    					<td>운영시간</td>
	    					<td>${boardDetail[0].optime1}${boardDetail[0].optime2}시 ~ ${boardDetail[0].optime3}${boardDetail[0].optime4}시</td>
	    				</tr>
	    				<tr>
	    					<td>휴무일</td>
	    					<td>
	    					<c:if test="${empty boardDetail[0].offday1}">없음</c:if>
	    					<c:if test="${!empty boardDetail[0].offday1}">${boardDetail[0].offday1}</c:if>
	    					<c:if test="${!empty boardDetail[0].offday2}">, ${boardDetail[0].offday2}</c:if>
	    					<c:if test="${!empty boardDetail[0].offday3}">, ${boardDetail[0].offday3}</c:if>
	    					<c:if test="${!empty boardDetail[0].offday4}">, ${boardDetail[0].offday4}</c:if>
	    					<c:if test="${!empty boardDetail[0].offday5}">, ${boardDetail[0].offday5}</c:if>
	    					<c:if test="${!empty boardDetail[0].offday6}">, ${boardDetail[0].offday6}</c:if>
	    					<c:if test="${!empty boardDetail[0].offday7}">, ${boardDetail[0].offday7}</c:if>
	    					</td>
	    				</tr>
	    				<tr>
	    					<td>규모</td>
	    					<td>${board.scale}m<sup>2</sup></td>
	    				</tr>
	    				<tr>
	    					<td>계약기간</td>
	    					<td>
	    					<c:if test="${!empty boardDetail[0].contractPeriod1}">${boardDetail[0].contractPeriod1}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod2}">, ${boardDetail[0].contractPeriod2}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod3}">, ${boardDetail[0].contractPeriod3}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod4}">, ${boardDetail[0].contractPeriod4}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod5}">, ${boardDetail[0].contractPeriod5}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod6}">, ${boardDetail[0].contractPeriod6}</c:if>
	    					<c:if test="${!empty boardDetail[0].contractPeriod7}">, ${boardDetail[0].contractPeriod7}</c:if>
	    					</td>
	    				</tr>
	    			</table>
    			</div>
    			<div class="boardImage">
    				<h3 class="board-h">공간사진</h3><hr class="board-hr">
    				<div class="board-image">
    					<div class="board-image1"><c:if test="${!empty boardDetail[0].image1}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image1}"></c:if></div>
    					<div class="board-image2"><c:if test="${!empty boardDetail[0].image2}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image2}"></c:if></div>
    					<div class="board-image3"><c:if test="${!empty boardDetail[0].image3}"><img class="board-img" src="resources/images/userImage/${board.id}/board/${board.title}/${boardDetail[0].image3}"></c:if></div>
    				</div>
    			</div>
    			<div class="board-precaution">
    				<h3 class="board-h">계약시 주의사항</h3><hr class="board-hr">
	    			<table>
	    				<c:if test="${!empty boardDetail[0].precaution1}"><tr>
	    					<td>1. </td>
	    					<td>${boardDetail[0].precaution1}</td>
	    				</tr></c:if>
	    				<c:if test="${!empty boardDetail[0].precaution2}"><tr>
	    					<td>2. </td>
	    					<td>${boardDetail[0].precaution2}</td>
	    				</tr></c:if>
	    				<c:if test="${!empty boardDetail[0].precaution3}"><tr>
	    					<td>3. </td>
	    					<td>${boardDetail[0].precaution3}</td>
	    				</tr></c:if>
	    				<c:if test="${!empty boardDetail[0].precaution4}"><tr>
	    					<td>4. </td>
	    					<td>${boardDetail[0].precaution4}</td>
	    				</tr></c:if>
    					<c:if test="${!empty boardDetail[0].precaution5}"><tr>
    						<td>5. </td>
    						<td>${boardDetail[0].precaution5}</td>
   						</tr></c:if>
    				</table>
    			</div>
    			<div class="board-map">
    				<h3 class="board-h">공간위치</h3><hr class="board-hr">
    				<p class="board-address">상세주소 : ${board.spaceaddr1} ${board.spaceaddr2}</p>
	    			<div id="staticMap" positionName="${board.name}" latitude="${board.latitude}" longitude="${board.longitude}"></div>
    			</div> 
    		</div>
    		<div class="board-comment">
    			<a class="board-comment-write" id="btnCommentWrite" href="javascript:void(0);">질문 작성하기</a>
    			<h3 class="board-h">Q&A</h3><hr class="board-hr">
    			<table class="comment-table" id="commentTable">
    				<tr>
    					<th>작성자</th>
    					<th>질문제목</th>
    					<th>작성일자</th>
    					<th>비고</th>
    				</tr>
    				<c:forEach var="qna" items="${qnaList}">
    				<tr>
    					<td><input type="hidden" id="qnaNum" value="${qna.qnanum}">${qna.nickname}</td>
    					<td class="commentsTitle"><a href="javascript:void(0);" class="goCommentsDetail" data-sno="${qna.qnanum}" qnaId="${qna.id}">${qna.comments}</a></td>
    					<td>${qna.indate}</td>
    					<td><c:if test="${sessionMember.id==qna.id}"><button class="udtCommentBtn" data-sno="${qna.qnanum}">수정</button><button class="delCommentBtn" data-sno="${qna.qnanum}">삭제</button></c:if></td>
    				</tr>
    				</c:forEach>
    			</table>
    		</div>
    	</div>
   		<div class="similarBoard">
   			<h3 class="board-h">비슷한 공간</h3><hr class="board-hr">
   			<div class="goSimilarDiv">
	   			<a class="similarLeft"><i class="fas fa-chevron-left"></i></a>
	   			<div class="goSimilarBoard">
	   			<ul class="similar-ul" id="similar-ul">
					<c:forEach var="recommend" items="${recommendSpaceList}">
					<li class="similar-li">
		  			<article class="box_similar">
		  				<div class="inner_similar" data-sno="${recommend.boardnum}" memType="${recommend.membertype}" style="cursor:pointer">
							<div class="img_border">
		  						<div class="img_area_similar" data-sno="${recommend.recommendNum}" id="img_area${recommend.recommendNum}">
	  								<c:if test="${!empty recommend.similarImage1}"><img class="img_area_image_similar" src="resources/images/userImage/${recommend.id}/board/${recommend.title}/${recommend.similarImage1}"></c:if>
		  						</div>
				    		</div>
							<div class="info_area">
								<h4>${recommend.title}</h4>
							</div>
							<div class="tag_area">
								<h5>키워드
								<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.similarKeyword1}"><span>#${recommend.similarKeyword1}</span></c:if></a>
								<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.similarKeyword2}"><span>#${recommend.similarKeyword2}</span></c:if></a>
								<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.similarKeyword3}"><span>#${recommend.similarKeyword3}</span></c:if></a>
								<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.similarKeyword4}"><span>#${recommend.similarKeyword4}</span></c:if></a>
								<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty recommend.similarKeyword5}"><span>#${recommend.similarKeyword5}</span></c:if></a></h5>
							</div>
		  				</div>
		  			</article>
		  			</li>
		  			</c:forEach>
	   			</ul>
				</div>
				<a class="similarRight"><i class="fas fa-chevron-right"></i></a>
			</div> 
   		</div> 
	</div>
	<div id="modal-board-qna" class="modal">
   		<div class="modal-board-qna">
    		<div class="modal-board-qnaHeader">
	    		Q&A 작성하기<span class="closeQna">&times;</span> 
    		</div>
			<div class="modal-board-qnaContent" id="modal-board-qnaContent">
				<div class="modal-board-qnaInsert" id="modal-baord-qnaInsert">
					<div class="modal-board-qnaHead" id="modal-board-qnaHead">
						질문
			 		</div>
			 		<textarea class="qnaInsertTextarea" id="qnaInsertTextarea" maxlength="200" placeholder="질문내용을 입력하세요."></textarea>
				</div>
				<div class="modal-board-qnabtn">
					<a href="javascript:void(0);" id="qna-cancel"><span class="modal-board-qna-cancel">취소</span></a>
					<a href="javascript:void(0);" id="qna-regist"><span class="modal-board-qna-regist">등록</span></a>
				</div>
			</div>
		</div>
	</div>
	<div id="modal-board-qnaReply" class="modal">
   		<div class="modal-board-qnaReply">
		</div>
	</div>
	<div class="contractWindow">
		<h3 class="board-h">계약신청방식선택</h3>
		<div class="board-contract">
			<div class="contract-intro">
				<h5>계약을 신청하려면 <font style="color:#FFAF0A;">셀러/공간제공자</font>로 로그인이 필요합니다.</h5>
			</div>
			<div class="contract-select">
				<ul class="contract-select-ul">
					<li class="contract-select-li"><h5><input type="radio" name="contractType" value="online">온라인 신청</h5></li>
					<li class="contract-selectType-li" id="contract-online"><h5>온라인 신청을 하면 작성한 제안서를 상대방에게 전달합니다.</h5></li>
					<li class="contract-select-li"><h5><input type="radio" name="contractType" value="offline">오프라인 신청</h5></li>
					<li class="contract-selectType-li" id="contract-offline"><h5>오프라인 신청을 하면 제안서를 첨부하지않고 계약요청이 있음을 상대방에게 전달합니다.</h5></li>
					<li class="contract-selected-li">내가 선택한 방식 : <span class="selectedContractType"></span></li>
					<li class="contract-selected-li">계약기간 : 
					<select>
						<c:if test="${!empty boardDetail[0].contractPeriod1}"><option>${boardDetail[0].contractPeriod1}</option></c:if>
	   					<c:if test="${!empty boardDetail[0].contractPeriod2}"><option>${boardDetail[0].contractPeriod2}</option></c:if>
	   					<c:if test="${!empty boardDetail[0].contractPeriod3}"><option>${boardDetail[0].contractPeriod3}</option></c:if>
	   					<c:if test="${!empty boardDetail[0].contractPeriod4}"><option>${boardDetail[0].contractPeriod4}</option></c:if>
	   					<c:if test="${!empty boardDetail[0].contractPeriod5}"><option>${boardDetail[0].contractPeriod5}</option></c:if>
	   					<c:if test="${!empty boardDetail[0].contractPeriod6}"><option>${boardDetail[0].contractPeriod6}</option></c:if>
	   					<c:if test="${!empty boardDetail[0].contractPeriod7}"><option>${boardDetail[0].contractPeriod7}</option></c:if>
					</select></li>
					<button class="goContract">계약 요청</button>
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
