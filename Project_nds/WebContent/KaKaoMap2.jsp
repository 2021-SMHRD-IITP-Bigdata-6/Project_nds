<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NDStargram</title>
<style type="text/css">
/* 전체 공간에 지도를 담기위한 css */
html, body, #map {
	width: 100%;
	height: 100%;
}
</style>
<script src="js/jquery-3.6.0.min.js"></script>
<!-- 지도 api불러오기 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5afb8b5a8624742289f1d328bfb669d3&libraries=services,clusterer,drawing"></script>

</head>
<body>
	<!--  지도 담을 공간 만들기 -->
	<div id='map'></div>
	<script type="text/javascript">
// ajax로 음식점 이름, 주소, 전화번호 받아오기
$.ajax({
	url : 'Hospital_info', //요청할 url
	type : 'post',	//전송방식
	dataType : 'json',	//받아올 데이터 타입
	success : function(hospital_info) {
		
		console.log(hospital_info);
		makeMap(hospital_info);
		// makeMap(); //지도를 만들어주는 함수
	},
	error : function(request, error) {
		alert('code :'+request.status+"\n"+"messag : "+request.responseText+"\n"+"error : "+error);
	}
	
});

function makeMap(hospital_info){
    // 지도를 담을 영역 객체 조회
    var container = document.getElementById('map');
    
    //지도를 생성할 때 필요한 기본 옵션
    var options = {
       center : new kakao.maps.LatLng(35.168452238685454, 126.88828343912044), //지도의 중심좌표(위도, 경도)
       level : 4
    //지도의 레벨(확대, 축소 정도) : 숫자가 낮을 수록 더 확대
    }; 
 
    // 지도 생성 해서 map 변수에 담기
    var map = new kakao.maps.Map(container, options);
 
    // 주소-좌표를 변환하는 객체를 생성해서 geocoder 변수에 담기
    var geocoder = new kakao.maps.services.Geocoder();
    
    for (var i = 0; i < hospital_info.length; i ++) {
       // 주소로 좌표를 검색하여 map에 마크로 나타낸다
       geocoder.addressSearch(hospital_info[i].address, info(hospital_info[i].name, hospital_info[i].gu, hospital_info[i].address, hospital_info[i].tel));         
    }
    
    function info(name, gu, address, tel){//좌표 검색과, 해당 좌표에 대한 데이터를 출력하기 위한 클로저 함수
       return function(result, status) {
       
           // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
       
               var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
       
               // 결과값으로 받은 위치를 마커로 표시합니다
               var marker = new kakao.maps.Marker({
                   map: map,
                   position: coords
               });
       
               // 인포윈도우로 장소에 대한 설명을 표시합니다
               var infowindow = new kakao.maps.InfoWindow({
                   content: '업소명 :<div style="width:150px;text-align:left;padding:0px 0;">'+name+'</div><br>'+
                   '광주시 OO구 :<div style="width:150px;text-align:left;padding:0px 0;">'+gu+'</div><br>'+
                   '주소 :<div style="width:150px;text-align:left;padding:0px 0;">'+address+'</div><br>'+
                   '전화번호 :<div style="width:150px;text-align:left;padding:0px 0;">'+tel+'</div>'
               });
               
               
             // mouse를 올리면 infoWindow 보이기
             kakao.maps.event.addListener(marker,'mouseover', function() {
                      infowindow.open(map, marker);
                   });

             // mouse를 이동하면 infoWindow 지우기
             kakao.maps.event.addListener(marker,'mouseout', function() {
                      infowindow.close();
                   });

               
               // 마커에 클릭이벤트를 등록합니다
               kakao.maps.event.addListener(marker, 'click', function() {
                  //클릭한 해당 마크의 name 과 tell 을 쿼리스트링으로 get 방식으로 넘겨줌 
                  location.href = "hospital_info.jsp?name="+name+"&&gu="+gu+"&&address="+address+"&&tel="+tel;
               });
    
           } 
           
       }
    }
 };


</script>
</body>
</html>