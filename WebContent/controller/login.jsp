<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myDiary.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	UserDTO dto = new UserDTO();
	dto.setId(request.getParameter("id"));
	dto.setPw(request.getParameter("pw"));
	
	UserDAO dao = new UserDAO();
	
	int result = dao.login(dto);
	
	if(result == 1) {
		session.setAttribute("id", dto.getId());
		response.sendRedirect("../view/main.jsp");
	} else {
%>
<script> 
	alert("로그인 실패! 로그인 화면으로 돌아갑니다.");
	history.back();
</script>
<%		
	}
%>