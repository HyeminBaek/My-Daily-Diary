<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myDiary.*" %>
<%@page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Timestamp date = Timestamp.valueOf(request.getParameter("date"));
	
	DiaryDAO dao = new DiaryDAO();
	int ok = dao.deleteDiary(date);
	
	if(ok==1){
%>		
	<script>
		alert("일기 삭제 성공");
		location.replace("../view/main.jsp");
	</script>
<% 
	} else {
%>
	<script>
		alert("일기 수정 실패");
	</script>
<%
	}
%>