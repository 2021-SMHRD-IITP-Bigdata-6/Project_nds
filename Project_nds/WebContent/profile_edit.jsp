<%@page import="com.memberDTO.memberDTO"%>
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
    <meta property="og:image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
    .
    <!-- Twitter Meta Tags / 트위터 -->
    <meta name="twitter:card" content="instagram clone">
    <meta name="twitter:title" content="instagram">
    <meta name="twitter:description" content="instagram clone">
    <meta name="twitter:image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">

    <!-- Google / Search Engine Tags / 구글 검색 엔진 -->
    <meta itemprop="name" content="instagram">
    <meta itemprop="description" content="instagram clone">
    <meta itemprop="image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
<%
memberDTO dto = null;
HttpSession se = request.getSession(); %>
<% dto = (memberDTO)se.getAttribute("dto");%>
    <title>공터</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="shortcut icon" href="imgs/instagram.png">

</head>
<script src="js/jquery-3.6.0.min.js"></script>
<body>

<section id="container">

    <header id="header">
        <section class="h_inner">

            <h1 class="logo">
                <a href="login.jsp">
                    <div class="sprite_insta_icon"></div>
                    <div>
                        <div class="sprite_write_logo"></div>
                    </div>
                </a>
            </h1>

            <div class="search_field">
                <input type="text" placeholder="검색" tabindex="0">

                <div class="fake_field">
                    <span class=sprite_small_search_icon></span>
                    <span>검색</span>
                </div>
            </div>
            
            <div class="right_icons">
             
                
                <a href="login.jsp" class="cicon"><div class="sprite_camera_icon" ></div></a>
                <a href="login.jsp" class="cicon"><div class="sprite_compass_icon" ></div></a>
                <a href="login.jsp" class="cicon"><div class="sprite_heart_icon_outline" ></div></a>
                <a href="login.jsp" class="cicon"><div class="sprite_user_icon_outline" ></div></a>
           
            </div>
            
        </section>
    </header>


    <div id="main_container">

        <div class="form_container">

            <div class="form">


                <h1 class="sprite_insta_big_logo title"></h1>

                <form action="UpdateCon.do" method="post">
                <p> <%=dto.getNickname()%>님의 프로필 편집</p> 
                    <p class="edit_user_password">
                        <label for="user_epassword"> 비밀번호 변경:</label>
                        <input type="password" name="mb_pw">
                    </p>
                    <p class="edit_user_tel">
                        <label for="user_etel">전화번호 변경 :</label>
                        <input type="text" name="mb_tel">
                    </p>
                    <p class="edit_user_nickname">
                        <label for="user_enick"> 닉네임 변경 :</label>
                        <input type="text" name="mb_nick">
                    </p>

                    <input type="submit" id="submit_btn" value="변경하기" class="submit_btn">
                </form>

            </div>

        </div>
    </div>

</section>
<script src="js/insta.js"></script>
</body>
</html>