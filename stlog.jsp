<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<html>

<%
	try
	{
		String uname1 = request.getParameter("uname");   
        		String upwd1 = request.getParameter("upwd");
	
		Connection conn =null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
                   	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr"); 

        		//Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javademo?" + "user=root&password=");    

        		Statement pst = conn.createStatement();   
		
		ResultSet rs;

		rs=pst.executeQuery("Select  username,pwd from student where username='"+uname1+"' and pwd='"+upwd1+"'");
        		
		//pst.setString(5,uname1);
        		//pst.setString(6,upwd1);
        		
		//ResultSet rs = pst.executeQuery();                        
        		//if((username.equals("uname1")) && (pwd.equals("upwd1")))
		if(rs.next())
        		{
			session.setAttribute("uname1" ,uname1);
                   		response.sendRedirect("library_form1.html");       

			//out.println("valid login credentials");               
                 		}
        		else
           		out.println("Invalid login credentials");            
   	}

	catch(SQLException e1)
	{
		out.println("Something went wrong inSQL Statement !! Please try again");       
	}
   	
	catch(Exception e)
	{       
       		out.println("Something went wrong !! Please try again");       
   	}      

	
%>
<hr size=5 color=red>
<a href="student.html">Go back</a>

</html>



