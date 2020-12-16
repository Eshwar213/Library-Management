<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*" %>
<html>
<head><title>reports</title></head>
<body>
<%
	 Connection conn = null; 
  try
   {
	String student_id=request.getParameter("STUDENT_ID");
	 Class.forName("oracle.jdbc.driver.OracleDriver");
       	 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr"); 
	out.println("connection established");
        	
	Statement stmt=conn.createStatement();
    		ResultSet rs=pstmt.executeQuery();
           
	if(rs.next())
	{
//out.println("Report generation ");
out.println("control enterd into loop");
%>

<h3>Student Report Found</h3>
<br>student_id:<%=rs.getString(1)%>
<br>student_branch:<%= rs.getString(2)%>
<br>student_year:<%= rs.getString(3)%>
<br>book_author:<%= rs.getString(4)%>
<br>book_edition:<%= rs.getString(5)%>
<br>in_time:<%= rs.getString(6)%>
<br>feedback:<% rs.getString(7)%>
<br>out_time:<% rs.getString(8)%>

<%

	}
	rs.close();
	pstmt.close();
	conn.close();
}
catch(Exception ex)
{
	out.println("Error:"+ex);
}
%>
<hr size=5 color=red>
<a href="adminform.html">find another Student Report</a>
</body>
</html>


          