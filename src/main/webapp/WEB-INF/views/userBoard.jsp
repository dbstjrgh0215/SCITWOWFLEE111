<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글</title>
	<link rel="stylesheet" href="resources/jqueryui/jquery-ui.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/wow-css.css"> 
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
		<div class="userBoard">
	    	<div class="userBoard-header">
	   			<h3>내가 쓴 글</h3>
	   			<div class="userBoard-explain">
	   				<ul>
	   					<li><h5>공고문은 제안서를 통해 등록할 수 있습니다.</h5></li>
	   					<li><h5>공고문은 제안서를 기반으로 작성되며 추가정보를 입력하여 게시글의 내용을 추가합니다.</h5></li>
	   					<li><h5>공고문은 계약이 완료되면 자동으로 삭제되며 제안서를 통해 다시 등록할 수 있습니다.</h5></li>
	   				</ul>
	   			</div>
	   		</div>
			<div class="userBoardList">
				<button class="btnRegistBoard" id="btnRegistBoard">공고문 작성 <i class="fas fa-chevron-right"></i></button>
				<div class="userBoardDiv"> 
				<table id="userBoardTable" class="userBoardTable"> 
					<tr>
						<th class="userBoard-td-1">공고문 제목</th>
						<th class="userBoard-td-2">최종 수정일</th>
						<th class="userBoard-td-3">관리</th>
					</tr>
					<c:forEach var="list" items="${listUserBoard}">
						<tr class="userBoard-tr">
							<td class="userBoard-td-1"><a data-sno="${list.boardnum}" id="userBoard${list.boardnum}" class="userBoardDetail" href="#goUserBoardDetail?userBoardnum=${list.boardnum}">${list.title}</a></td>
							<td class="userBoard-td-1">${list.indate}</td>
							<td class="td-control"><button data-sno="${list.boardnum}" class="udtuserBoard" id="udtuserBoard${list.boardnum}">수정</button><button data-sno="${list.boardnum}" class="deluserBoard" id="deleteuserBoard${list.boardnum}">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
		
		<div id="modal-userBoard-proposalList" class="modal">
    		<div class="modal-content">
			<span class="close2">&times;</span> 
				<div id="modal-userBoard-proposalListContent" class="modal-userBoard-proposalListContent">
					<div class="userBoard-proposalListDiv" id="userBoard-proposalListDiv">
						<table id="proposalTable" class="proposalTable2"> 
							<tr>
								<th></th>
								<th class="proposal-td-1">제안서 제목</th>
								<th class="proposal-td-2">최종 수정일</th>
								<th class="proposal-td-3">관리</th>
							</tr>
							<c:forEach var="list" items="${listProposal}">
								<tr class="proposal-tr">
									<td><input type="radio" name="selectProposal" value="${list.proposalnum}"></td>
									<td class="proposal-td-1"><a data-sno="${list.proposalnum}" id="proposal${list.proposalnum}" class="proposalDetail" href="#goProposalDetail?proposalnum=${list.proposalnum}">${list.title}</a></td>
									<td class="proposal-td-1">${list.indate}</td>
									<td class="td-control"><button data-sno="${list.proposalnum}" class="udtProposal" id="udtProposal${list.proposalnum}">수정</button><button data-sno="${list.proposalnum}" class="delProposal" id="deleteProposal${list.proposalnum}">삭제</button></td>
								</tr>
							</c:forEach>
							<tr class="userBoardWrite">
								<td colspan="3" id="userBoardWrite">공고문을 작성할 제안서를 먼저 선택해주세요!</td>
								<td class="td-control"><button id="btnGoBoardWrite">작성</button></td>
							</tr>
						</table>
			 		</div>
				</div>
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
 
	<script src="resources/js/jquery-3.1.1.min.js"></script>
	<script src="resources/jqueryui/jquery-ui.js"></script>
 	<script src="resources/js/wow-js.js"></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
 	
</html>


