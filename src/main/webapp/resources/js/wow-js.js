
$(function() { 
	var menu = $(".site-header").offset();
	$(window).scroll( function() {
		if($(document).scrollTop()>menu.top) {
			$('.site-header').addClass('fixed');  
		} else {
			$('.site-header').removeClass('fixed');
		}
	});	 
	
	$("#btnSearchM").on("click", function(){
		$.ajax({
			url:"goMap",
			data:{},
			type:"get",
			success:function(serverData){
				barclose();
				$("#main-content").html(serverData);
				map();
			}
		});
	});
	
	
	$("#btnNotice").on("click",function(){
		var status = document.getElementById("notice").style.display;
		barclose();
		if(status != 'block'){   
			document.getElementById("notice").style.display = 'block'
		}
	});
	
	$("#btnSlide").on("click", function(){  
		var status = document.getElementById("sidenav").style.display;
		barclose();
	    if(status != 'block'){
	    	document.getElementById("sidenav").style.display = 'block';
	    }
	});  
	
	$("#btnBackMenu").on("click",function(){
		barclose();
	});
	
	$("#btnBackNotice").on("click",function(){
		barclose();
	});
	  
	$("#btnLogin").on("click", function(){
		var id = $("#loginId").val();
		var pw = $("#loginPw").val();
		$.ajax({
			url:"login",
			data:{id:id,
				  pw:pw},
			type:"post",
			success:function(serverData){
				if(serverData=="success"){
					location.href="goHome";
				} else {
					if(id==""){
						$("#loginIdFail").html("아이디를 입력해주세요!");
						$("#loginpwFail").html("");
					} else if(pw==""){
						$("#loginIdFail").html("");
						$("#loginPwFail").html("비밀번호를 입력해주세요!");
					} else {
						$("#loginIdFail").html("");
						$("#loginPwFail").html("아이디 또는 비밀번호를 확인해주세요!");
					}
				}
			}
		});
	});
	
	$("#btnGoLogin").on("click",function(){
		location.href="goLogin";
	});
	
	$("#btnGoSignUp").on("click",function(){
		location.href="goSignUp";
		execDaumPostcode();
	});
	
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#foo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function() {
        readURL(this);
    });

	
	$("#btnSignUp").on("click",function(){
		var id = $("#signId").val();
		var pw = $("#signPw").val();
		var name = $("#signName").val();
		var nickname = $("#signNickname").val();
		var phone = $("#signPhone1").val()+"-"+$("#signPhone2").val()+"-"+$("#signPhone3").val();
		var email = $("#signEmail").val()+"@"+$("#signMailaddr").val();
		var birthdate = $("#signBirthdate").val();
		var gender = $("#signGender").val();
		var address1 = $("#address").val();
		var address2 = $("#detailAddress").val();
		var membertype = $("#signMembertype").val();
		var latitude = $("#latitude").val();
        var longitude = $("#longitude").val();
		
		var member = {
		  'id':id,
		  'pw':pw,
		  'name':name,
		  'nickname':nickname,
		  'phone':phone,
		  'email':email,
		  'birthdate':birthdate,
		  'gender':gender,
		  'address1':address1,
		  'address2':address2,
		  'membertype':membertype,
		}
		
		if(id==""){
			alert("아이디를 입력해주세요!");
			return;
		} else if(pw=="") {
			alert("비밀번호를 입력해주세요!");
			return;
		} else if(name=="") {
			alert("이름을 입력해주세요!");
			return;
		} else if(nickname==""){
			alert("닉네임을 입력해주세요!");
			return;
		} else if(phone=="") {
			alert("전화번호를 입력해주세요!");
			return;
		} else if(email=="") {
			alert("이메일을 입력해주세요!");
			return;
		} else if(address1=="") {
			alert("주소를 입력해주세요!");
			return;
		} else if(address2=="") {
			alert("상세주소를 입력해주세요!");
			return;
		} 
		
		$.ajax({
			url:"signUp",
			data:member,
			type:"post",
			success:function(serverData){
				if(serverData==1){
					if(membertype=="user"){
						alert("회원가입을 축하합니다!")
						location.href="goLogin";
					} else {
						var redirect = "id="+id+"&membertype="+membertype+"&latitude="+latitude+"&longitude="+longitude;
						location.href="goExtraInfo?"+redirect;
					}
				} else {
					return;
				}
			}
		});
	});
	
	uploadImg();
	
	$("#btnExtraInsert").on('click', function(){
		var id = $("#id").val();
		var membertype = $("#membertype").val();
		var name = $("#name").val();
		var tel = $("#tel").val();
		var type1 = $("#type1").val();
		var type2 = $("#type2").val();
		var type3 = $("#type3").val();
		var keyword = $("#keyword").val();
		var img = $("#img").val();
		var comments = $("#comments").val();
		var productName = $("#productName").val();
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		var extra;
		
		$("#imgForm").submit();
		
		var seller = {
			'id':id,
			'membertype':membertype,
			'sellername':name,
			'tel':tel,
			'prod_type1':type1,
			'prod_type2':type2,
			'prod_type3':type3,
			'keyword':keyword,
			'img':img,
			'comments':comments,
			'productname':productName
		}
		
		var space = {
			'id':id,
			'membertype':membertype,
			'spacename':name,
			'tel':tel,
			'space_type1':type1,
			'space_type2':type2,
			'space_type3':type3,
			'keyword':keyword,
			'img':img,
			'comments':comments,
			'latitude':latitude,
			'longitude':longitude
		}
		
		if(membertype=='seller'){
			extra = seller;
		} else {
			extra = space;
		}
		
		$.ajax({
			url:"insertExtraInfo",
			data:extra,
			type:"post",
			success:function(serverData){
				if(serverData=='success'){
					location.href="goSignEnd";
				}
			}
		});
	});
	
	$("#btnGoProposal").on('click', function(){
		location.href="goProposal"; 
	});
	
	$("#btnLogout").on("click", function(){
		location.href="logout";
	});
	
	proposal();
});


function uploadImg(){
	var sel_files = [];
	
	$("#input_imgs").on("change", handleImgFileSelect);
	
	function fileUploadAction(){
		$("#input_imgs").trigger('click');
	}
	
	function handleImgFileSelect(e){
		// 이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap0").empty();
		$(".imgs_wrap1").empty();
		$(".imgs_wrap2").empty();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		var index = 0;
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var html = "<img src=\""+ e.target.result +"\" data-file='"+f.name+"' class='selProductFile'>";
				$(".imgs_wrap"+index).css("background-image","");
				$(".imgs_wrap"+index).append(html);
				index++;
			}
			reader.readAsDataURL(f);
		});
	}
	
	function deleteImageAction(index) {
		sel_files.splice(index,1);
		
		var img_id = "#img_id"+index;
		$(img_id).remove();
	}
}

function barclose(){
    document.getElementById("sidenav").style.display = 'none';
    document.getElementById("notice").style.display = 'none';
}

function map(){
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
}

function execDaumPostcode() {
	//주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("address").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    var latitude = result.y;
                    var longitude = result.x;
                    
                    $("#latitude").val(latitude);
                    $("#longitude").val(longitude);
                }
            });
        }
    }).open();
}

function proposal(){
	$('#btnRegistProposal').on('click',function(){
		location.href="goProposalWrite";
	});
	
	
}


