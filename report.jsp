<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<head>
<title>report generation</title>
<style>
body::-webkit-scrollbar {
    width: 1em;
}
 
body::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
}
 
body::-webkit-scrollbar-thumb {
  background-color: darkgrey;
  outline: 1px solid slategrey;
}
th {
    background-color: #FF3333;
    color: white;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
tr:nth-child(odd){background-color: #ffffff}
</style>
</head>
<body bgcolor="black">

<center>
<h2 style="color:white;"> student report generation</h2>
<table  cellspadding="0" class="w3-table-all">
<tr>
	<th><b>student id</b></th>
	<th><b>student branch</b></th>
	<th><b>student year</b></th>	
	<th><b>book author</b></th>
	<th><b>book edition</b></th>
	<th><b>in time</b></th>
	<th><b>feedback</b></th>
	<th><b>out time</b></th>
</tr>



        <% 
        Connection conn = null;
          
   	 try
    	{
         	 Class.forName("oracle.jdbc.driver.OracleDriver");
        	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr"); 
       
      
	Statement stmt=conn.createStatement();
    	
	ResultSet rs=stmt.executeQuery("select * from report"); 
             
                  while(rs.next())
	{





%>

<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td>
</tr>
<%

}
%>
</table>
<%
rs.close();
stmt.close();
conn.close();
}

catch (Exception e)
{%>
 <%=e%>   
 <%}

%>
 

</center>

<br>
<a href="adminform.html"><input type="button" value="Go back"></a>

</body>

</html>


          