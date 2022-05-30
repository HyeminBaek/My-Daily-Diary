<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myDiary.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="myDiary.UserDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	UserDAO dao = new UserDAO();
	dao.insertUser(dto);
	response.sendRedirect("../view/main.jsp");
%>