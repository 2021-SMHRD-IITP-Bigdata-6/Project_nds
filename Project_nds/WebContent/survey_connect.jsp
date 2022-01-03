<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Expanding Bar Menus | Demo 1 | Codrops</title>
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700i" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/normalizetm.css" />
		<link rel="stylesheet" type="text/css" href="css/demotm.css" />
		<link rel="stylesheet" type="text/css" href="css/componenttm.css" />
		<script>document.documentElement.className = 'js';</script>
	
	<style> 
	#atagid{
		position: relative;
		z-index: 2000;
	}
	</style>
	</head>
	<body class="demo-1">
		
		<main class="view">
			<div class="content">
				<div class="deco">
					<p class="deco__text"></p>
				</div>
				<header class="codrops-header">
					<div class="codrops-links">
					</div>
					<p class="codrops-header__info"> <br/>MBTI 검사<br/>Covid19 우울증(Depression) 자가진단<br/>스트레스,불안,공황 테스트</p>
					<span class="codrops-header__deco"></span>
					<h1 class="codrops-header__title">자가진단 키트</h1>
					<nav class="demos">
					</nav>
				</header>
			</div>
			<button class="btn btn--menu">
			</button>
			<nav class="tabsnav tabsnav--vertical tabsnav--ander">
				<div class="tabsnav__item" onclick="location.href='survey.jsp'">
					<div class="tabsnav__bar"></div>
					<h3 class="tabsnav__title"> MBTI </h3>
				</div>
				<div class="tabsnav__item" onclick="location.href='survey3.jsp'">
					<div class="tabsnav__bar"></div>
					<h3 class="tabsnav__title">Covid19 Depression</h3>
				</div>
				<div class="tabsnav__item" onclick="location.href='survey2.jsp'">
					<div class="tabsnav__bar"></div>
					<h3 class="tabsnav__title">Stress,unrest,scare</h3>
				</div>
			</nav>
		</main>
	</body>
</html>
