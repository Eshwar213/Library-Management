<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*" %>
<html>
    
            
    <title>registration</title>
<body>

        <%
         String name=request.getParameter("name");
         String desig=request.getParameter("desig");
        String empid=request.getParameter("empid");
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
        String sql="insert into ADMIN(NAME,DESIG,EMPID,USERNAME,PWD,CPWD,ROLE) values(?,?,?,?,?,?,?)";
           


	PreparedStatement pstmt=conn.prepareStatement(sql);
	                   pstmt.setString(1,username);
            		pstmt.setString(2,desig);
            		pstmt.setString(3,empid);
		pstmt.setString(4,username);
             		pstmt.setString(5,pwd);
		pstmt.setString(6,cpwd);
		pstmt.setString(7,role);
           	 out.println("Registration Successful");
          pstmt.executeQuery();
            }


catch (Exception e)
{%>
 <%=e%>   
 <%}

%>

<hr size=5 color=red>
<a href="admin.html">Go back</a>
</body>


</html>

