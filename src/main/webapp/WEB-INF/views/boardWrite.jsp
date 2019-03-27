<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="insertBoard" method="post" id="boardWriteForm" enctype="multipart/form-data">
	<input type="hidden" id="form_id" name="id" value="${selectProposal.id}">
	<input type="hidden" id="form_membertype" name="membertype" value="${selectProposal.membertype}">
	<input type="hidden" id="form_title" name="title" value="${selectProposal.title}">
	<input type="hidden" id="form_comments" name="comments" value="${selectProposal.comments}">
	<input type="hidden" id="form_precaution" name="precaution" value="">
	<input type="hidden" id="form_offday" name="offday" value="">
	<input type="hidden" id="form_keyword" name="keyword" value="">
	<input type="hidden" id="form_name" name="name" value="${selectProposal.name}">
	<input type="hidden" id="form_type1" name="type1" value="${selectProposal.type1}">
	<input type="hidden" id="form_type2" name="type2" value="${selectProposal.type2}">
	<input type="hidden" id="form_type3" name="type3" value="${selectProposal.type3}">
	<input type="hidden" id="form_price" name="price" value=0>
	<input type="hidden" id="form_stock" name="stock" value=0>
	<input type="hidden" id="form_optime" name="optime" value="">
	<input type="hidden" id="form_scale" name="scale" value=0>
	<input type="hidden" id="form_spaceaddr1" name="spaceaddr1" value="${selectProposal.spaceaddr1}">
	<input type="hidden" id="form_spaceaddr2" name="spaceaddr2" value="${selectProposal.spaceaddr2}">
	<input type="hidden" id="form_latitude" name="latitude" value="${selectProposal.latitude}">
	<input type="hidden" id="form_longitude" name="longitude" value="${selectProposal.longitude}">
<div class="boardWriteContent">
	<h4>공고문 제목</h4><br>
	<span class="inputNorm"><input type="text" id="title" value="${selectProposal.title}"></span>
	<c:if test="${selectProposal.membertype=='공간제공자'}">
	<h4>공간소개</h4><br>
	<textarea rows="10" cols="100" id="comments">${selectProposal.comments}</textarea><br>
   	<h4>키워드</h4></br>
   	<span class="inputNorm"><input type="text" id="keyword"></span>
   	<button id="keywordRegist" type="button">등록</button><button id="selectKeyword" type="button">추천키워드에서선택 <i class="fas fa-chevron-down"></i></button></br>
 	<table id="keywordTable" class="keywordTable-bw">
 	<tr id="keywordFilter">
   						
   	</tr>
   	<tr id="keywordSelected">
 		<td class="td-1"><h4>나의 키워드</h4><p>(<font id="keywordCount">0</font> / 5)</p></td>
 		<td class="td-2"><input type="hidden" id="keywordContent1" value="">
 		<input type="hidden" id="keywordContent2" value=""><input type="hidden" id="keywordContent4" value="">
 		<input type="hidden" id="keywordContent3" value=""><input type="hidden" id="keywordContent5" value=""></td>
 	</tr>
 	</table>
	<h4>사진</h4></br>
	<div>
	<div class="input_wrap">
		<a href="javascript:void(0);" id="fileUpload" class="my_button">파일업로드</a>
		<input type="file" id="image" name="uploadFile" multiple/>
	</div>
	</div> 
    <div>
        <div class="imgs_wrap">
            <img id="img1" <c:if test="${fileList[0]}">src="${fileList[0]}"</c:if>/>
            <img id="img2" <c:if test="${fileList[1]}">src="${fileList[1]}"</c:if> />
            <img id="img3" <c:if test="${fileList[2]}">src="${fileList[2]}"</c:if> />
        </div>
        <a href="javascript:void(0);" id="imageClear">전체삭제</a>
        <h5>사진파일은 3개까지 등록가능합니다.</h5>
    </div>
	<h4>이용시간</h4><br>
	<select id="optime1"><option>오전</option><option>오후</option></select>
	<select id="optime2"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option></select>시 ~ 
	<select id="optime3"><option>오전</option><option>오후</option></select>
	<select id="optime4"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option></select>시<br>
	<h4>규모</h4><br>
	<input type="number" id="scale"><select id="scale2"><option>m<sup>2</sup></option><option>평</option></select><br>
	<h4>휴무일</h4><br>
	<div class="offday">
	<ul class="ul-offday">
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=1 id="offday1" class="offday-a"><i data-sno=1 id="offday-icon1" class="fas fa-check"></i>　월</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=2 id="offday2" class="offday-a"><i data-sno=2 id="offday-icon2" class="fas fa-check"></i>　화</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=3 id="offday3" class="offday-a"><i data-sno=3 id="offday-icon3" class="fas fa-check"></i>　수</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=4 id="offday4" class="offday-a"><i data-sno=4 id="offday-icon4" class="fas fa-check"></i>　목</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=5 id="offday5" class="offday-a"><i data-sno=5 id="offday-icon5" class="fas fa-check"></i>　금</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=6 id="offday6" class="offday-a"><i data-sno=6 id="offday-icon6" class="fas fa-check"></i>　토</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=7 id="offday7" class="offday-a"><i data-sno=7 id="offday-icon7" class="fas fa-check"></i>　일</a></span></li>
	</ul>
	</div>
	<div id="offdaySelected">
		<input type="hidden" id="offdayContent1" value="">
		<input type="hidden" id="offdayContent2" value=""><input type="hidden" id="offdayContent4" value="">
		<input type="hidden" id="offdayContent3" value=""><input type="hidden" id="offdayContent5" value="">
		<input type="hidden" id="offdayContent6" value=""><input type="hidden" id="offdayContent7" value="">
	</div>
	<h4>주의사항</h4><br>
	<textarea rows="10" cols="100" id="precaution">${selectProposal.comments}</textarea><br>
	</c:if>
	<c:if test="${selectProposal.membertype=='셀러'}">
	<h4>셀러소개</h4><br>
	<textarea rows="10" cols="100" id="comments">${selectProposal.comments}</textarea><br>
	<h4>키워드</h4></br>
   	<span class="inputNorm"><input type="text" id="keyword" value="${udtProposal.keyword}"></span>
   	<button id="keywordRegist" type="button">등록</button><button id="selectKeyword" type="button">추천키워드에서선택 <i class="fas fa-chevron-down"></i></button></br>
 	<table id="keywordTable" class="keywordTable-bw">
 	<tr id="keywordFilter">
   						
   	</tr>
   	<tr id="keywordSelected">
 		<td class="td-1"><h4>나의 키워드</h4><p>(<font id="keywordCount">0</font> / 5)</p></td>
 		<td class="td-2"><input type="hidden" id="keywordContent1" value="">
 		<input type="hidden" id="keywordContent2" value=""><input type="hidden" id="keywordContent4" value="">
 		<input type="hidden" id="keywordContent3" value=""><input type="hidden" id="keywordContent5" value=""></td>
 	</tr>
 	</table>
 	<h4>사진</h4></br>
 	<div>
	<div class="input_wrap">
		<a href="javascript:void(0);" id="fileUpload" class="my_button">파일업로드</a>
		<input type="file" id="image" name="uploadFile" multiple/>
	</div>
	</div> 
    <div>
        <div class="imgs_wrap">
            <img id="img1" <c:if test="${fileList[0]}">src="${fileList[0]}"</c:if>/>
            <img id="img2" <c:if test="${fileList[1]}">src="${fileList[1]}"</c:if> />
            <img id="img3" <c:if test="${fileList[2]}">src="${fileList[2]}"</c:if> />
        </div>
        <a href="javascript:void(0);" id="imageClear">전체삭제</a>
        <h5>사진파일은 3개까지 등록가능합니다.</h5>
    </div>
	<h4>희망가격</h4><br>
	<span class="inputNorm"><input type="number" id="price">원</span><br>
	<h4>현재재고상태</h4><br>
	<span class="inputNorm"><input type="number" id="stock">개</span><br>
	<h4>희망일</h4><br>
	<div class="offday">
	<ul class="ul-offday">
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=1 id="offday1" class="offday-a"><i data-sno=1 id="offday-icon1" class="fas fa-check"></i>　월</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=2 id="offday2" class="offday-a"><i data-sno=2 id="offday-icon2" class="fas fa-check"></i>　화</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=3 id="offday3" class="offday-a"><i data-sno=3 id="offday-icon3" class="fas fa-check"></i>　수</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=4 id="offday4" class="offday-a"><i data-sno=4 id="offday-icon4" class="fas fa-check"></i>　목</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=5 id="offday5" class="offday-a"><i data-sno=5 id="offday-icon5" class="fas fa-check"></i>　금</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=6 id="offday6" class="offday-a"><i data-sno=6 id="offday-icon6" class="fas fa-check"></i>　토</a></span></li>
		<li class="li-offday"><span class="span-offday"><a href="javascript:void(0);" data-sno=7 id="offday7" class="offday-a"><i data-sno=7 id="offday-icon7" class="fas fa-check"></i>　일</a></span></li>
	</ul>
	</div>
	<div id="offdaySelected">
		<input type="hidden" id="offdayContent1" value="">
		<input type="hidden" id="offdayContent2" value=""><input type="hidden" id="offdayContent4" value="">
		<input type="hidden" id="offdayContent3" value=""><input type="hidden" id="offdayContent5" value="">
		<input type="hidden" id="offdayContent6" value=""><input type="hidden" id="offdayContent7" value="">
	</div>
	<br><h4>주의사항</h4><br>
	<textarea rows="10" cols="100" id="precaution">${selectProposal.comments}</textarea><br>
	</c:if>
	<button class="btnBoardWrite" id="btnBoardWrite">등록</button>
</div>
</form>