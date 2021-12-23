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

					<form action="JoinCon" method="post">
						<p class="join_user_email">
							<label for="user_email">사용자명:</label> <input type="text"
								name="email">
						</p>

						<p class="join_user_password">
							<label for="user_password">비밀번호:</label> <input type="password"
								name="pw">
						</p>
						<p class="join_user_nickname">
							<label for="user_nickname">닉네임:</label> <input type="text"
								name="nickname">
						</p>
						<label for="user_sortation">구분 :</label>
						<label>상담사 <input type="radio" value="상담사" name='sort'>
						</label> 
						<label> 일반회원 <input type="radio" value="일반회원" name='sort' checked="checked">
						</label>
						 <input type="submit" id="submit_btn" value="로그인" class="submit_btn" >
					</form>

				</div>

				<div class="bottom_box">
					<div>
						<span>아이디가 이미 있으신가요?</span><a href="login.jsp">로그인</a>
					</div>
				</div>


			</div>

		</div>


	</section>


	<script src="js/insta.js"></script>
</body>
</html>