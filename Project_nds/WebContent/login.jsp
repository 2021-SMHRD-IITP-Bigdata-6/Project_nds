<%@page import="com.memberDTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- Twitter Meta Tags / 트위터 -->
    <meta name="twitter:card" content="instagram clone">
    <meta name="twitter:title" content="instagram">
    <meta name="twitter:description" content="instagram clone">
    <meta name="twitter:image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">

    <!-- Google / Search Engine Tags / 구글 검색 엔진 -->
    <meta itemprop="name" content="instagram">
    <meta itemprop="description" content="instagram clone">
    <meta itemprop="image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
	
    <title>instagram</title>
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
	<style>
		#container{
			
			border: 0;
    		padding: 0;
			height : 100vh;
			background-image : url('https://t1.daumcdn.net/blogfile/fs7/34_blog_2007_08_25_21_50_46d0253424ddd?x-content-disposition=inline&filename=0.jpg');
			background-repeat : no-repeat;
			background-size : cover;
			min-height: 100%;
    		background-position: center;
				
			
		}
	
	</style>


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
            
            
            <div class="right_icons">
             
                
                <a href="login.jsp" class="cicon"><div class="sprite_home_icon" ></div></a>
                <a href="login.jsp" class="cicon"><div class="sprite_survey_icon" ></div></a>
                <a href="login.jsp" class="cicon"><div class="sprite_phone_icon" ></div></a>
                <a href="login.jsp" class="cicon"><div class="sprite_heart_icon_outline" ></div></a>
                <a href="login.jsp" class="cicon"><div class="sprite_map_icon" ></div></a>
                <a href="login.jsp" class="cicon"><div class="sprite_user_icon_outline" ></div></a>
           
            </div>
            
        </section>
    </header>


    <div id="main_container">

        <div class="form_container">

            <div class="form">


                <h1 class="sprite_insta_big_logo title"></h1>

                <form action="LoginCon.do" method="post">
                    <p class="login_user_mb_id">
                        <label for="user_mb_id">사용자명:</label>
                        <input type="text" name="mb_id">
                    </p>

                    <p class="login_user_password">
                        <label for="user_password">비밀번호:</label>
                        <input type="password" name="mb_pw">
                    </p>

                    <input type="submit" id="submit_btn" value="로그인" class="submit_btn">
                    <input type="submit" id="submit_btn" value="회원가입" class="submit_btn">
                    
                   
                </form>

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
<script src="js/insta.js"></script>
</body>
</html>