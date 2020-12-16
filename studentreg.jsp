<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*" %>
<html>
    
            
    <title>registration</title>
<body>

        <%
          String name=request.getParameter("name");
         String regno=request.getParameter("regno");
          String branch=request.getParameter("branch");
         String year=request.getParameter("year");
         String username=request.getParameter("username");
         String pwd=request.getParameter("pwd");
         String cpwd=request.getParameter("cpwd");
          String role=request.getParameter("role");
         %>
         
         <% 
        Connection conn = null;
          
   	 try
    	{
          Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");          
        String sql="insert into STUDENT(NAME,REGNO,BRANCH,YEAR,USERNAME,PWD,CPWD,ROLE) values(?,?,?,?,?,?,?,?)";           


	PreparedStatement pstmt=conn.prepareStatement(sql);

            		pstmt.setString(1,name);
            		pstmt.setString(2,regno);
		pstmt.setString(3,branch);
            		pstmt.setString(4,year);
		pstmt.setString(5,username);
            		pstmt.setString(6,pwd);
		pstmt.setString(7,cpwd);
            		pstmt.setString(8,role);
            		
          	 out.println("Registration Successful");
          pstmt.executeQuery();
            }


catch (Exception e)
{%>
 <%=e%>   
 <%}

%>

<hr size=5 color=red>
<a href="student.html">Go back</a>
</body>


</html>

