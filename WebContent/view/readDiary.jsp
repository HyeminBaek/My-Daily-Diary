<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="myDiary.DiaryDTO"%>
<%@page import="myDiary.DiaryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Timestamp date = Timestamp.valueOf(request.getParameter("date"));
	DiaryDAO dao = new DiaryDAO();
	DiaryDTO dto = dao.diaryRead((String) session.getAttribute("id"), date);
	String content = dto.getContent();
%>
<c:set var="content" value="<%=content %>" />
<c:set var="date" value="<%=date %>" />
<c:if test="${content==null }">
	<script>
		alert("일기 작성페이지로 이동합니다");
		location.replace("writeForm.jsp?date=${date}");
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Daily Diary; read</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="../css/page.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/theme.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
</head>
<body>
	<h1><%=session.getAttribute("id")%>'s Daily Diary
	</h1>
	<main>
	<div class="calendar-wrapper" id="calendar-wrapper">
		<%=content%>
	</div>
	</main>
	<div class="row d-flex justify-content-center align-items-center h-100">
		<div id="content" class="mb-md-5 mt-md-4 pb-5">
			<button id="update" class="btn btn-primary px-5" type="button" onclick="location.href='updateForm.jsp?date=${date}'">수정</button>
			<button id="delete" class="btn btn-secondary px-5" type="button" onclick="location.href='deleteForm.jsp?date=${date}'">삭제</button>
		</div>
	</div>
	<footer>
		<a href="main.jsp">메인으로 이동</a>
	</footer>
</body>
</html>