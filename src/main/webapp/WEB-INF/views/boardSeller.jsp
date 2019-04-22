<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
					<div class="detail_area">
						<h5><i class="fas fa-heart"></i> ${recommend.cntZzim} <i class="fas fa-eye"></i> ${recommend.count} <i class="far fa-comment-dots"></i> ${recommend.cntQna}</h5>
					</div>
  				</div>
  			</article>
  			</c:forEach>
  		</div> 
  	</div>
   	<div class="bSeller">
   		
   		<div class="bSeller-header"> 
   			<h4>셀러목록</h4><hr>
   		</div> 
   		
   		<c:forEach var="seller" items="${sellerList}">
  			<article class="box_seller">
  				<div class="inner" data-sno="${seller.sellerNum}">
  					<a href="goSellerDetail?boardnum=${seller.boardnum}">
  					<div class="img_border">
  						<div class="img_area" data-sno="${seller.sellerNum}" id="img_area${seller.sellerNum}">
  							<ul class="board-ul" id="board-ul${seller.sellerNum}">
  								<li class="board-li"><c:if test="${!empty seller.image1}"><img class="img_area_image" src="resources/images/userImage/${seller.id}/board/${seller.title}/${seller.image1}"></c:if></li>
  								<li class="board-li"><c:if test="${!empty seller.image2}"><img class="img_area_image" src="resources/images/userImage/${seller.id}/board/${seller.title}/${seller.image2}"></c:if></li>
  								<li class="board-li"><c:if test="${!empty seller.image3}"><img class="img_area_image" src="resources/images/userImage/${seller.id}/board/${seller.title}/${seller.image3}"></c:if></li>
  							</ul>
  						</div>
  						<div class="board-img-slider" data-sno="${seller.sellerNum}" id="board-img-slider${seller.sellerNum}">
  							<a href="javascript:void(0);" data-sno="${seller.sellerNum}" class="board-img-slider-left"><button class="board-img-slider-btn" id="slide-left" data-sno="${seller.sellerNum}" ><i class="fas fa-chevron-left"></i></button></a>
  							<a href="javascript:void(0);" data-sno="${seller.sellerNum}" class="board-img-slider-right"><button class="board-img-slider-btn" id="slide-right" data-sno="${seller.sellerNum}" ><i class="fas fa-chevron-right"></i></button></a>
			    		</div>
  					</div>
  						<div class="info_area">
  							<h4>${seller.title}</h4>
  						</div>
  					</a>
					<div class="tag_area">
						<h5>키워드
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty seller.keyword1}"><span>#${seller.keyword1}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty seller.keyword2}"><span>#${seller.keyword2}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty seller.keyword3}"><span>#${seller.keyword3}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty seller.keyword4}"><span>#${seller.keyword4}</span></c:if></a>
						<a href="javascript:void(0);" class="clickKeyword"><c:if test="${!empty seller.keyword5}"><span>#${seller.keyword5}</span></c:if></a></h5>
					</div>
					<div class="detail_area">
						<h5><i class="fas fa-heart"></i> ${seller.cntZzim} <i class="fas fa-eye"></i> ${seller.count} <i class="far fa-comment-dots"></i> ${seller.cntQna}</h5>
					</div>
  				</div>
  			</article>
  			</c:forEach>
   	</div>
   	
