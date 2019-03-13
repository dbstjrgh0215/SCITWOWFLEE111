
$(function() { 
	var menu = $(".site-header").offset();
	$(window).scroll( function() {
		if($(document).scrollTop()>menu.top) {
			$('.site-header').addClass('fixed');  
		} else {
			$('.site-header').removeClass('fixed');
		}
	});
	
	$("#btnSearchM").click(function(){
		location.href="goMap";
	}) ;
	
	$("#btnSlide").click(function(){     
	    if($("#sidenav").width() == 0){      
	        document.getElementById("sidenav").style.width = "35%";
	    }else{
	        document.getElementById("sidenav").style.width = "0";
	    }    
	});  
	  
	$("#btnLogin").click(function(){
		location.href="goLogin";
	});
	
	$("#btnProposal").click(function(){
		location.href="goProposal";
	});
	 
	if(typeof daum !== 'undefined'){
		//지도 관련
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		var marker = null;
		var mapContainer = document.getElementById('map_map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new daum.maps.LatLng(37.513220, 127.058581), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
		imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
		imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(serverData) {
			$.each(serverData, function(index,item){
				//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
				markerPosition = new daum.maps.LatLng(item.latitude, item.longitude); // 마커가 표시될 위치입니다
				
				//마커를 생성합니다
				marker = new daum.maps.Marker({
				position: markerPosition,
				image: markerImage // 마커이미지 설정 
				});
				
				marker.setMap(map);
				markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			});
		}
		
		function panTo() {
		 	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		    if (navigator.geolocation) {
		        
		        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		        navigator.geolocation.getCurrentPosition(function(position) {
		            
		            var lat = position.coords.latitude, // 위도
		                lon = position.coords.longitude; // 경도
		            
		            var locPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            
		         	// 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new daum.maps.LatLng(37.513220, 127.058581);
		            
				 	// 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(locPosition);  
				    
		          });
		        
		    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		        
		        var locPosition = new daum.maps.LatLng(33.450701, 126.570667);    
		         
		     	// 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.panTo(locPosition);  
		    }
		 	
		 	
		}      
		
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		$('#map_btn1').on('click',function(){
			$.ajax({
				url:"clickBtn1",
				data:{spacename:"aaa"},
				type:"get",
				success:function(serverData){
					removeMarker(); 
					addMarker(serverData);
				}
			});
		});
		
		$('#map_btn2').on('click',function(){
			$.ajax({
				url:"clickBtn2",
				data:{spacename:"bbb"},
				type:"get",
				success:function(serverData){
					removeMarker(); 
					addMarker(serverData);
				}
			});
		});
		
		$('#map_btnMyPos').on('click', function(){
			panTo();
		});

	}
});

$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
