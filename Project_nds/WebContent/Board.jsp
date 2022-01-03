<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<td>Num</td>
			<td>Title</td>
			<td>Author</td>
			<td>FileName</td>
			<td>Date</td>
		</tr>
		<c:forEach items="${list}" var="i">
			<tr>
				<td>${i.sns_seq}</td>
				<td>${i.sns_content}</td>
				<td>${i.mb_id}</td>
				<td>${i.hash_tag}</td>
				<td><a href="SelectOne?num=${i.sns_seq}">${i.hash_tag}</a></td>
				<td>${i.sns_date}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>