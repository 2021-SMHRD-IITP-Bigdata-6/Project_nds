<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 

   //클릭한 해당 마크의 정보를 get방식으로 받아 나타내어줌
   String name = request.getParameter("name");
   String gu = request.getParameter("gu");	
   String address = request.getParameter("address");
   String tel =request.getParameter("tel");
%>

<h2>name : <%=name %></h2>
<h2>gu : <%=gu %></h2>
<h2>address : <%=address %></h2>
<h2>tel : <%=tel %></h2>



</body>
</html>