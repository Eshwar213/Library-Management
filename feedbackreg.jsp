<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*" %>
<html>
    
            
    <title>registration</title>

        <%
         String student_id=request.getParameter("student_id");
         String student_branch=request.getParameter("student_branch");
         String student_year=request.getParameter("student_year");
         String book_author=request.getParameter("book_author");
         String book_edition=request.getParameter("book_edition");
         String in_time=request.getParameter("in_time");
         String feedback=request.getParameter("feedback");
         String out_time=request.getParameter("out_time");
         %>
         
         <% 
        Connection conn = null;
          
   	 try
    	{
          Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");          
        		String sql="insert into REPORT(STUDENT_ID,STUDENT_BRANCH,STUDENT_YEAR,BOOK_AUTHOR,BOOK_EDITION,IN_TIME,FEEDBACK,OUT_TIME) values(?,?,?,?,?,?,?,?)";


	PreparedStatement pstmt=conn.prepareStatement(sql);

            		pstmt.setString(1,student_id);
            		pstmt.setString(2,student_branch);
            		pstmt.setString(3,student_year);
            		pstmt.setString(4,book_author);
            		pstmt.setString(5,book_edition);
            		pstmt.setString(6,in_time);
            		pstmt.setString(7,feedback);
            		pstmt.setString(8,out_time);
            		
          	 
          pstmt.executeQuery();
out.println("Thank you");
            }


catch (Exception e)
{%>
 <%=e%>   
 <%}

%>


</html>

