<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="proposalDetailDiv">
	<div class="divHeader">
		<h3>제안서작성</h3><hr>
	</div>
	<table class="proposalDetailTable">
		<tr>
			<td class="td-1"><h4>제안서 제목</h4></td>
			<td class="td-2"><h4>${udtProposal.title}</h4></td>
				</tr>
	<tr>
		<td class="td-1"><h4>사진</h4></td>
		<td class="td-2">
	   <div>
	       <div class="imgs_wrap">
	           <img id="img1" src="${fileList[0]}"/>
	      <img id="img2" src="${fileList[1]}" />
	      <img id="img3" src="${fileList[2]}" />
	    </div>
	</div></td>
	</tr>
	<tr>
		<td class="td-1"><h4>키워드</h4><input id="keyword" type="hidden" value="${udtProposal.keyword}"></td>
		<td class="td-2" id="keywordDetail"></td>
			</tr>
			<tr>
				<td class="td-1"><h4>간략한 소개</h4></td>
	<td class="td-2"><h4>${udtProposal.comments}</h4></td>
	</tr>
			</table><hr>
		</div>
		<c:if test="${sessionMember.membertype=='셀러'}">
	<div class="seller-ProposalDetail">
		<div class="divHeader">
			<h3>셀러 추가 정보</h3><hr>
		</div>
		<table>
			<tr>
				<td class="td-1"><h4>물품이름</h4></td>
				<td class="td-2"><h4>${udtProposal.name}</h4></td>
			</tr>
			<tr>
				<td class="td-1"><h4>물품분류</h4></td>
	<td class="td-2"><h4>${udtProposal.type1}-${udtProposal.type2}-${udtProposal.type3}</h4></td>
	</tr>
				<tr>
					<td class="td-1"><h4>기대가격</h4></td>
					<td class="td-2"><h4>${udtProposal.price}</h4></td>
	</tr>
	<tr>
		<td class="td-1"><h4>현재재고</h4></td>
		<td class="td-2"><h4>${udtProposal.stock}개</h4></td>
			</tr>
		</table><hr>
	</div>
	</c:if>
	<c:if test="${sessionMember.membertype=='공간제공자'}">
	<div class="seller-ProposalDetail">
		<div class="divHeader">
			<h3>공간제공자 추가 정보</h3><hr>
		</div>
		<table>
			<tr>
				<td class="td-1"><h4>운영시간</h4></td>
				<td class="td-2"><h4>${udtProposal.optime}</h4></td>
			</tr>
			<tr>
				<td class="td-1"><h4>공간분류</h4></td>
	<td class="td-2"><h4>${udtProposal.type1}-${udtProposal.type2}-${udtProposal.type3}</h4></td>
	</tr>
				<tr>
					<td class="td-1"><h4>규모</h4></td>
					<td class="td-2"><h4>${udtProposal.scale}</h4></td>
			</tr>
			<tr>
	<td class="td-1"><h4>주소</h4></td>
	<td class="td-2"><h4>${udtProposal.spaceaddr1}</h4></td>
	</tr>
	<tr>
		<td class="td-1"><h4>상세주소</h4></td>
		<td class="td-2"><h4>${udtProposal.spaceaddr2}</h4><input type="hidden" id="latitude"><input type="hidden" id="longitude"></td>
	</tr>
			</table><hr>
		</div>
		</c:if>
	<div class="proposalBtn">
		<button data-sno="${udtProposal.proposalnum}" class="udtProposal" id="udtProposal${udtProposal.proposalnum}">수정</button>
		<button data-sno="${udtProposal.proposalnum}" class="delProposal" id="udtProposal${udtProposal.proposalnum}">삭제</button>
	</div>
	 	</div>