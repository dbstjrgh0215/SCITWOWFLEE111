<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>
	<link rel="stylesheet" href="resources/css/wow-css.css"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
	    <!-- 지도를 표시할 div 입니다 -->
	    <input type="hidden" id="text" value="${text}">
		<div class="map_wrap" style="height:100%;"> 
		    <div class="map_map" id="map_map" style="width:100%;height:100%;position:relative;overflow:hidden;">
		    </div>
			    <div class="map_category" >
			    	<div class="map_header">
			    		<span class="category_header"><img src="resources/images/logo.png"><h5> 와우플리 장소검색</h5></span><br>
			    		<span>검색 : <input type="text" id="mapSearchText"><button id="mapSearchBtn"><i class="fas fa-search"></i></button></span><br>
			    		<span>분류 : <select><option>대분류</option></select><button><i class="fas fa-search"></i></button></span>
			    	</div>
			    	<div class="category_content">
				    	<ul style="width:100%;">
				    		<li style="width:33%"><button id="map_btn1" style="width:100%; height:60px;"><img src="resources/images/logo.png">카페</button></li>
				    		<li style="width:33%"><button id="map_btn2" style="width:100%; height:60px;"><img src="resources/images/logo.png">서점</button></li>
				    		<li style="width:33%"><button id="map_btn3" style="width:100%; height:60px;"><img src="resources/images/logo.png">꽃</button></li> 
				   		</ul><br>
				   		<ul style="width:100%">
				    		<li style="width:33%"><button id="map_btn4" style="width:100%; height:60px;"><img src="resources/images/logo.png">레스토랑</button></li>
							<li style="width:33%"><button id="map_btn5" style="width:100%; height:60px;"><img src="resources/images/logo.png">카페</button></li>
							<li style="width:33%"><button id="map_btn6" style="width:100%; height:60px;"><img src="resources/images/logo.png">편의점</button></li>
						</ul><br>
						<ul style="width:100%">
							<li style="width:50%"><button id="map_btnMyPos" style="width:100%; height:60px;"><i class="fas fa-street-view"></i>내위치</button></li>
							<li style="width:50%"><button id="map_btn8" style="width:100%; height:60px;"><i class="far fa-grin-hearts"></i>인기있는물품</button></li>
						</ul><br>
			    	</div>
			    </div>
			</div>
</body>
 	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a5ef94da1ecf3b9c86e43db1a1d3957&libraries=services"></script>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
 	<script src="resources/js/wow-js.js"></script>
</html>	