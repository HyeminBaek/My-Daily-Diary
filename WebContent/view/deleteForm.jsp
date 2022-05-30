<%@page import="myDiary.DiaryDTO"%>
<%@page import="myDiary.DiaryDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Timestamp date = Timestamp.valueOf(request.getParameter("date"));
%>
<c:set var="date" value="<%=date %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Daily Diary; update</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="../css/page.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/theme.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1><%=session.getAttribute("id")%>'s Daily Diary
	</h1>
	<main style="padding:10px; align-items: center;">
	<div style="font-weight: bold;">
		정말로 삭제하시겠습니까?
	</div>
	</main>
	<div class="row d-flex justify-content-center align-items-center h-100">
		<div id="content" class="mb-md-5 mt-md-4 pb-5">
			<button id="delete" name="delete" class="btn btn-primary px-5" type="button" onclick="location.href='../controller/delete.jsp?date=${date }'">예</button>
			<button id="back" name="back" type="button" class="btn btn-secondary px-5" onclick="history.back()">아니오</button>
		</div>
	</div>
	<footer>
		<a href="main.jsp">메인으로 이동</a>
	</footer>
</body>
</html>