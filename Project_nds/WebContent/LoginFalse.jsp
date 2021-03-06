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

    <title>NDStargram</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="shortcut icon" href="imgs/instagram.png">
<%
memberDTO dto = null;
HttpSession se = request.getSession(); %>
<% dto = (memberDTO)se.getAttribute("dto");
boolean login_check = true;
if(dto==null){
	login_check = false;
}
%>
</head>
<script src="js/jquery-3.6.0.min.js"></script>
<body>


<section id="container">

    <header id="header">
        <section class="h_inner">

            <h1 class="logo">
                <a href="login.jsp">
                <div>
                    <div class="sprite_shimpyo_icon"></div>
                    </div>
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

              <h1>아이디 및 비빌번호가 틀렸습니다 </h1>
				
            </div>

            <div class="bottom_box">
              <a href="login.jsp">로그인 페이지로 이동하기</a><br>
				<a href="joinpage.jsp">회원가입 페이지 이동</a>
            </div>

        </div>
    </div>

</section>
            <script type="text/javascript">
          		$(".cicon").click(function() {
          			console.log(<%=login_check%>)
          			if(<%=login_check %> == false){
						alert("로그인을 해주세요!");
          			}
          		});
          	</script>
</body>
</html>