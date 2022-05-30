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
<script src="../js/myDiary.js"></script>
</head>
<body>
<h1><%=session.getAttribute("id")%>'s Daily Diary
	</h1>
	<main>
	<div class="calendar-wrapper" id="calendar-wrapper">
		<form action="../controller/update.jsp?date=${date }" method="post" id="updateForm">
			<textarea id="newContent" name="newContent" placeholder="일기를 입력하세요" style="width:630px; height:200px"></textarea>
		</form>
	</div>
	</main>
	<div class="row d-flex justify-content-center align-items-center h-100">
		<div id="content" class="mb-md-5 mt-md-4 pb-5">
			<button id="update" name="update" class="btn btn-primary px-5" type="button">수정</button>
			<button  type="reset" class="btn btn-secondary px-5">내용리셋</button>
		</div>
	</div>
	<footer>
		<a href="main.jsp">메인으로 이동</a>
	</footer>
</body>
</html>