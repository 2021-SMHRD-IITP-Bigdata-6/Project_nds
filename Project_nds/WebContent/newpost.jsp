<%@page import="com.snsDAO.snsDAO"%>
<%@page import="com.memberDAO.memberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.snsDTO.snsDTO"%>
<%@page import="com.memberDTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd";>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>title</title>
<style>
#outer {
	display: flex;
	justify-content: center;
	align-items: center;
}

#user_feed {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 15px;
}

textarea {
	outline: none;
	width: 56%;
	height: 6.25em;
	border: ridge;
	margin-top: 2px;
	margin-left: 21%;
}

.heart_btn {
	cursor: pointer;
}

.user_name {
	display: flex;
	justify-content: center;
	align-items: center;
}

.user_juno {
	border: 1;
}

.comment-detail {
	
}

.user_feedbox {
	margin-top: 3px;
	margin-bottom: 3px;
	outline: 2px solid #fafafa;
	border-radius: 10px;
	border-color: #fafafa;
}

article>div {
	position: relative;
	width: 500px;
	height: auto;
}

body {
	background-color: #fafafa;
}

#actor_comment {
	resize: none;
}

#reg_btn {
	background-color: #fafafa;
	border: revert;
	color: #262626;
	cursor: pointer;
	font-family: 'BenchNine', Arial, sans-serif;
	line-height: 1rem;
	outline: none;
	text-transform: uppercase;
	font-weight: 600;
	padding: 4px 14px;
	font-size: 12px;
	margin-left: 309px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 15px
}

.contents {
	outline: 1px solid #fafafa;
	border-radius: 100px;
}

.btn_upload {
	
}

.middle > img {
	witdh: 500px;
	height :500%;
	object-fit:cover;
	object-position:;
	
}

.middle {
	width:380px;
	height:97px;
	overflow:hidden;
	margin:0 auto;
	text-align: center;
}

.contents .middle {
	width:50%;

}

#file {
	margin-left:21%;
	margin-top: 1%;
}

</style>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/style.css">


</head>
<%
HttpSession se = request.getSession();
memberDTO dto = (memberDTO) se.getAttribute("dto");
snsDAO dao = new snsDAO();
%>
<body>
	<script type="text/javascript" src=js/jquery-3.6.0.min.js></script>
	<script>
		let like_boolean = 0;
		let sc = false;
	</script>
	<section id="container"> <header id="header"> <section
		class="inner" style="width : 550px">

	<h1 class="logo">
		<a href="SnsService">
			<div class="sprite_insta_icon"></div>
			<div class="sprite_write_logo"></div>
		</a>
	</h1>
	<div class="search_box">
		<input type="text" placeholder="검색" id="search-field">
		<div class="fake_field">
			<span class="sprite_small_search_icon"></span> <span>검색</span>
		</div>
	</div>
	<div></div>
	<div class="right_icons" style="width: 10px">
		<a href="Start.jsp" class="cicon"><div class="sprite_home_icon"></div></a>
		<a href="mb_part1Cn.jsp" class="cicon"><div class="sprite_phone_icon"></div></a>
		<a href="survey_connect.jsp" class="cicon"><div class="sprite_heart_icon_outline"></div></a> 
		<a href="KaKaoMap2.jsp" class="cicon"><div class="sprite_map_icon"></div></a> 
		<a href="newpost.jsp" class="cicon"><div class="sprite_user_icon_outline" onClick=""></div></a>
	</div>


	</section> </header> <section id="main_container">
	<div id="inner">
		<div class="contents_box">
			<article class="contents"> <header class="top"
				style="width: 376px; height: 30px; margin-left:22%;">
			<div class="user_container">
				<div class="profile_img">
					<img src="imgs/thumb.jpeg" alt="프로필이미지">
				</div>
				<div class="user_name">
					<div class="nick_name m_text" id="actor_id"><%=dto.getId() %></div>
				</div>

			</div>

			</header> 
			<div class="middle">
			</div>
			<form action="UploadService" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="mb_id" value="이동현"
					style="border: none; border-right: 0px; border-top: 0px; border-left: 0px; border-bottom: 0px"
					readonly>
				<textarea name="sns_content" placeholder="지금 무슨생각을 하고 계신가요?"> </textarea>
				<input accept="image/*" type="file" value="파일 선택" id="file"
					name="file" onchange="setThumbnail(event);" /> <input
					type="submit" id=reg_btn value="게시" />
			</form>
		</div>
</body>
<script type="text/javascript">
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div.middle").appendChild(img);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>

</html>