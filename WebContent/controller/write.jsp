<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myDiary.*" %>
<%@page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Timestamp date = Timestamp.valueOf(request.getParameter("date"));
	DiaryDTO dto = new DiaryDTO();
	dto.setId((String)session.getAttribute("id"));
	dto.setRegDate(date);
	dto.setContent(request.getParameter("newContent"));
	
	System.out.println(dto);
	
	DiaryDAO dao = new DiaryDAO();
	int ok = dao.insertDiary(dto);
	
	if(ok==1)
		response.sendRedirect("../view/main.jsp");
	else {
%>
	<script>
		alert("일기 작성 실패");
	</script>
<%
	}
%>