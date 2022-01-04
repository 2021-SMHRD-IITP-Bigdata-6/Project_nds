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
      <meta name="description" content="Various hover tooltip styles, shapes and effects for your inspiration" />
      <meta name="keywords" content="tooltip, effect, style, inspiration, css, svg, animation" />
      <meta name="author" content="Codrops" />
      <link rel="shortcut icon" href="../favicon.ico">
      <link rel="stylesheet" type="text/css" href="css/normalizehinfo.css" />
      <link rel="stylesheet" type="text/css" href="css/demohinfo.css" />
      <link rel="stylesheet" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css">
      <link rel="stylesheet" type="text/css" href="css/tooltip-round.css" />
      <!--[if IE]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
      
      <% 

   //클릭한 해당 마크의 정보를 get방식으로 받아 나타내어줌
   String name = request.getParameter("name");
   String gu = request.getParameter("gu");   
   String address = request.getParameter("address");
   String tel =request.getParameter("tel");
   
   HttpSession se = request.getSession();
   memberDTO dto = (memberDTO) se.getAttribute("dto");
%>
      
   </head>
   <body class="color-2">
      <div class="container">
         <!-- Top Navigation -->
         <div class="codrops-top clearfix">
            <span class="right"><span> <%=dto.getId()%>님 </span></a></span>
         </div>
         <div class="content">
            <header class="codrops-header">
               <h1> Hospital_Infomation <span></span></h1>   
               <nav class="codrops-demos">
               </nav>
            </header>
            <div class="dummy dummy-menu">
               <ul>
                  <li><a class="tooltip tooltip-effect-1"> Name <span class="tooltip-content"><p> <%=name %></p>  <i class="fa fa-fw fa-home"></i></span></a></li>
                  <li><a class="tooltip tooltip-effect-2"> 지역 <span class="tooltip-content"><p> <%=gu %> </p><i class="fa fa-fw fa-user"></i></span></a></li>
                  <li><a class="tooltip tooltip-effect-3">주소<span class="tooltip-content"><p> <%=address %> </p><i class="fa fa-fw fa-camera-retro"></i></span></a></li>
                  <li><a class="tooltip tooltip-effect-4">전화번호<span class="tooltip-content"><p> <%=tel %> </p> <i class="fa fa-fw fa-briefcase"></i></span></a></li>
               </ul>
            </div>
            <!-- Related demos -->
            <section class="related">
                  <h3>Dot Navigation Styles</h3>
               </a>
            </section>
         </div><!-- /content -->
      </div><!-- /container -->
   </body>
</html>