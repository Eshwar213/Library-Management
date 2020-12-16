<%@ page import="java.sql.*" %>

<%
	 Connection conn = null;
   	 try
    	{
                             Class.forName("oracle.jdbc.driver.OracleDriver");
                              conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
                          Statement stmt=conn.createStatement();
             
                          String empname=request.getParameter("empname");
                          String empaddress=request.getParameter("empaddress");
                         String empno=request.getParameter("empno");

                      stmt.executeUpdate("insert into emp2(name,address,phone)values('"+empname+"','"+empaddress+"','"+empno+"')");
                  ResultSet rs=stmt.executeQuery("select * from emp");
%>
<html>
<body>
<center>
<h2>emp registration</h2>
        <table border="1" cellspacing="0" cellpadding="0">
        <tr>
	<td><b>empname</b></td> 
	<td><b>address</b></td>
	<td><b>phone</b></td>
        </tr>
<%
	int num=1;
	while(rs.next())
	{
%>
          <tr>
	<td><%=rs.getString("name")%></td>
                  <td><%=rs.getString("address")%></td>
	<td><%=rs.getString("phone")%></td>	
          </tr>
<%
  	  num++;
	}
	rs.close();
	stmt.close();
	conn.close();
}
catch(Exception e)
{
  out.println(e);
}
%>
</table>
</center>
</body>
</html>

			












