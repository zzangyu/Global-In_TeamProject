<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id = "dao" class = "register.MembershipDAO"/>
    <%
    String id = request.getParameter("id");
    boolean check = dao.idCheck(id);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src = "script.js"></script>
<title></title>
</head>
<body bgcolor = "#18ffff">

<div align = "center">
<b><%= id %></b>
 <% 
	if(check) {
		out.println("는 이미 존재하는 아이디입니다.<br><br>");
	}else {
		out.println("사용 가능한 ID입니다.<br><br>");
	}
 %>
 
 <a href = "#" onclick="javascript:self.close()">닫기</a>
</div>




</body>
</html>