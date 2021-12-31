<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<!-- Facebook Meta Tags / 페이스북 오픈 그래프 -->
<meta property="og:url" content="http://kindtiger.dothome.co.kr/insta">
<meta property="og:type" content="website">
<meta property="og:title" content="instagram">
<meta property="og:description" content="instagram clone">
<meta property="og:image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
.
<!-- Twitter Meta Tags / 트위터 -->
<meta name="twitter:card" content="instagram clone">
<meta name="twitter:title" content="instagram">
<meta name="twitter:description" content="instagram clone">
<meta name="twitter:image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">

<!-- Google / Search Engine Tags / 구글 검색 엔진 -->
<meta itemprop="name" content="instagram">
<meta itemprop="description" content="instagram clone">
<meta itemprop="image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">


<title>instagram</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/login.css">
<link rel="shortcut icon" href="imgs/instagram.png">

</head>
<body>


	<section id="container">



		<header id="header">
			<section class="h_inner">

				<h1 class="logo">
					<a href="index.jsp">
						<div class="sprite_insta_icon"></div>
						<div>
							<div class="sprite_write_logo"></div>
						</div>
					</a>
				</h1>

				<div class="search_field">
					<input type="text" placeholder="검색" tabindex="0">

					<div class="fake_field">
						<span class=sprite_small_search_icon></span> <span>검색</span>
					</div>
				</div>


				<div class="right_icons">
					<a href="new_post.jsp"><div class="sprite_camera_icon"></div></a>
					<a href="login.jsp"><div class="sprite_compass_icon"></div></a> <a
						href="follow.jsp"><div class="sprite_heart_icon_outline"></div></a>
					<a href="profile.jsp"><div class="sprite_user_icon_outline"></div></a>
				</div>
			</section>
		</header>



		<div id="main_container">

			<div class="form_container">

				<div class="form">


					<h1 class="sprite_insta_big_logo title"></h1>

			
						<p class="join_user_mb_id">
							<label for="user_mb_id">사용자명:</label> <input type="text"
								name="mb_id" id="Join_ID">
								<button type="button" id ="Check" onclick="IdCheck()">중복체크</button>
								<p id="result"> </p>
						</p>

						<p class="join_user_mb_pw">
							<label for="user_mb_pw">비밀번호:</label> <input type="password"
								name="mb_pw" id="Join_PW">
						</p>
						<p class="join_user_mb_nick">
							<label for="user_mb_nick">닉네임:</label> <input type="text"
								name="mb_nick" id="Join_Nick">
						</p>
						<p class="join_user_mb_tel">
							<label for="user_mb_tel">전화번호:</label> <input type="text"
								name="mb_tel" id="Join_TEL">
						</p>
						<label for="user_mb_part">구분 :</label>
						<label>상담사 <input type="radio" value="0" name='mb_part'>
						</label> 
						<label> 일반회원 <input type="radio" value="1" name='mb_part' checked="checked">
						</label>
						 <input type="submit" id="submit_btn" value="회원가입" class="submit_btn" onClick="join_form()" >
					

				</div>

				<div class="bottom_box">
					<div>
						<span>아이디가 이미 있으신가요?</span><a href="login.jsp">로그인</a>
					</div>
				</div>
			</div>
		</div>
	</section>
			<script src="js/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">
			function IdCheck() {
				$.ajax({
					url : "check.do",
					type : "get",
					data: {
						"id" : $('#Join_ID').val()
					},
					success : function(res) {
						console.log(res)
						
						if(res == 'true'){
							$('#result').html("중복된 아이디 입니다.").css("color","red");
						}
						else{
							$('#result').html("사용가능한 아이디 입니다.").css("color","green");
						}
					},
					error : function () {
					 	alert("요청실패!");
					}
					
				});
			}
			function join_form(){
				$.ajax({
					url : "JoinCon.do",
					type : "post",
					data: {
						"mb_id" : $('#Join_ID').val(),
						"mb_pw" : $('#Join_PW').val(),
						"mb_nick" : $('#Join_Nick').val(),
						"mb_tel" : $('#Join_TEL').val(),
						"mb_part" : $('input[name = mb_part]').val(),
					},
					success : function() {
						console.log("회원가입 성공");
						location.reload();
						location.replace("login.jsp")
	
					},
					error : function () {
					 	alert("요청실패!");
					}
					
				});
			}
			</script>

</body>
</html>