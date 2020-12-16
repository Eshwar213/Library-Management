<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Demo with JSP</title>
    </head>
    <body>
<%
	session.removeAttribute("uname1");
	session.removeAttribute("upwd1");
	session.invalidate();
	response.sendRedirect("student.html");
%>
<h1>you have successfully logged out</h1>
</body>
</html>
	