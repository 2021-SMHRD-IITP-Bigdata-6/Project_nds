<%@page import="com.snsDTO.snsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.snsDAO.snsDAO"%>
<%@page import="com.memberDTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NDStargram</title>
	<meta name="description" content="A photography-inspired website layout with an expanding stack slider and a background image tilt effect" />
	<meta name="keywords" content="photography, template, layout, effect, expand, image stack, animation, flickity, tilt" />
	<meta name="author" content="Codrops" />
	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/flickity.css" />
	<link rel="stylesheet" type="text/css" href="css/main_ct.css" />
	<link rel="stylesheet" href="css/common.css">
	<script src="js/modernizr.custom.js"></script>
	<%
HttpSession se = request.getSession();
memberDTO dto = (memberDTO) se.getAttribute("dto");
%>
</head>
<body>
	<div class="container">
		<div class="hero">
			<div class="hero__back hero__back--static"></div>
			<div class="hero__back hero__back--mover"></div>
			<div class="hero__front"></div>
		</div>
		<header class="codrops-header">
			<div class="codrops-links">
			  <a href="SnsService" class="cicon"><div class="sprite_home_icon" ></div></a>
			</div>
			<h1 class="codrops-title">상담사 연결 페이지 <span></span></h1>
			<nav class="menu">
				 <p> <%=dto.getId()%> 님 </p>
			</nav>
		</header>
		<div class="stack-slider">
			<div class="stacks-wrapper">
				<div class="stack">
					<h2 class="stack-title"><a href="#" data-text="이전으로"><span>이동현 상담사 프로필</span></a></h2>
					<div class="item">
						<div class="item__content">
							<img src="imgs/type1/1.jpg" alt="img01" />
							<h3 class="item__title"> 이동현 상담사  <span class="item__date">01/01/2020</span></h3>
							<div class="item__details">
								<ul>
									<li>이름 : <span>이동현</span></li>
									<li>나이:<span>26</span></li>
									<li>상담 경력: <span> 4년</span></li>
									<li>zoom <a> 연결하기 </a></li>
									<li>관련 자격증 및<span>자격증 내용</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="stack">
					<h2 class="stack-title"><a href="#" data-text="이전으로"><span>나현우 상담사 프로필</span></a></h2>
					<div class="item">
						<div class="item__content">
							<img src="imgs/type2/1.jpg" alt="img01" />
							<h3 class="item__title">나현우 상담사 <span class="item__date">01/01/2020</span></h3>
							<div class="item__details">
								<ul>
									<li>이름 : <span>나현우</span></li>
									<li>나이:<span>26</span></li>
									<li>상담 경력: <span> 4년</span></li>
									<li>zoom <a> 연결하기 </a></li>
									<li>관련 자격증 및 수상경력<span>자격증 내용</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="stack">
					<h2 class="stack-title"><a href="#" data-text="이전으로"><span>박경섭 상담사 프로필</span></a></h2>
					<div class="item">
						<div class="item__content">
							<img src="imgs/type3/1.jpg" alt="img01" />
							<h3 class="item__title">박경섭 상담사 <span class="item__date">01/01/2020</span></h3>
							<div class="item__details">
								<ul>
									<li>이름 : <span>박경섭</span></li>
									<li>나이:<span>26</span></li>
									<li>상담 경력: <span> 4년</span></li>
									<li>zoom <a href="https://us04web.zoom.us/j/2507538885?pwd=SEx4ZTNIUmFlWG1qb3UzeHRIYjR1dz09"> 연결하기 </a></li>
									<li>관련 자격증 및<span>자격증 내용</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div class="stack">
					<h2 class="stack-title"><a href="#" data-text="이전으로"><span>나예호 상담사 프로필</span></a></h2>
					<div class="item">
						<div class="item__content">
							<img src="imgs/type4/1.jpg" alt="img01" />
							<h3 class="item__title">나예호 상담사 <span class="item__date">01/01/2020</span></h3>
							<div class="item__details">
								<ul>
									<li>이름 : <span>나예호</span></li>
									<li>나이:<span>20</span></li>
									<li>상담 경력: <span> 4년</span></li>
									<li>zoom <a> 연결하기 </a></li>
									<li>관련 자격증 및<span>자격증 내용</span></li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			<!-- /stacks-wrapper -->
		</div>
		<!-- /stacks -->
		<img class="loader" src="imgs/three-dots.svg" width="60" alt="Loader image" />
	</div>
	<!-- /container -->
	<!-- Flickity v1.0.0 http://flickity.metafizzy.co/ -->
	<script src="./js/flickity.pkgd.min.js"></script>
	<script src="./js/smoothscroll.js"></script>
	<script src="./js/main.js"></script>
</body>
</html>