<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd";>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
table, td {
      border: 1px solid black;
      border-collapse: collapse;
}
</style>
</head>
<body>
      
      <table>
            <tr>
                  <td>번호</td>
                  <td>${requestScope.dto.sns_seq}</td>
            </tr>
            <tr>
                  <td>제목</td>
                  <td>${requestScope.dto.sns_content}</td>
            </tr>
            <tr>
                  <td>작가</td>
                  <td>${requestScope.dto.mb_id}</td>
            </tr>
            <tr>
                  <td>등록일</td>
                  <td>${requestScope.dto.sns_date}</td>
            </tr>
            <tr>
                  <td colspan="2"><img src="Upload/${requestScope.dto.hash_tag}"></td>
            </tr>
      </table>
      
</body>
</html>