<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안서 관리</title>
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
     
    <div class="main-content" id="main-content">
		<div class="proposal">
	    	<div class="proposal-header">
	   			<h3>제안서관리</h3>
	   			<div class="proposal-explain">
	   				<ul>
	   					<li><h5>제안서는 최대 5개까지 등록할 수 있습니다.</h5></li>
	   					<li><h5>계약요청 후 제안서의 내용을 수정해도 요청한 제안서에는 반영되지 않습니다.</h5></li>
	   				</ul>
	   			</div>
	   		</div>
			<div class="proposalList">
				<button class="btnRegistProposal" id="btnRegistProposal">제안서 작성</button>
				<div class="proposalDiv"> 
				<table class="proposalTable"> 
					<tr>
						<th>제안서 제목</th>
						<th>최종 수정일</th>
						<th>관리</th>
					</tr>
					<c:forEach var="list" items="${listProposal}">
						<tr>
							<td><a data-sno="${list.proposalnum}" id="proposal${list.proposalnum}" class="proposalDetail" href="#goProposalDetail?proposalnum=${list.proposalnum}">${list.title}</a></td>
							<td>${list.indate}</td>
							<td class="td-control"><button data-sno="${list.proposalnum}" class="udtProposal" id="udtProposal${list.proposalnum}">수정</button><button data-sno="${list.proposalnum}" class="delProposal" id="deleteProposal${list.proposalnum}">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
		
		<div id="modal-proposal" class="modal">
    		<div class="modal-content">
			<span class="close">&times;</span> 
				<div id="modal-proposalContent" class="modal-proposalContent">
					
				</div>
			</div>
		</div>
	</div>
</body>
 
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
 	
</html>


