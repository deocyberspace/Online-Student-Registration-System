<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Book</title>
</head>
<body>
<h2>Welcome!</h2>

<form method="post">
<br>
<h3>Please input book title:</h3><br>
coursename:<input type="text" maxlength="20" size="10" name="select">
<br><br><br>
<input value="search" type="submit" name="button1">

</form>

<% 
String name=request.getParameter("select");//获取select的参数值
%>
<%
try{
   
    Class.forName("com.mysql.cj.jdbc.Driver");//加载mysql驱动
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=GMT","root","Pha/2007/094");
    Statement stmt=conn.createStatement();//实例化Statement对象
    System.out.print("Connected！");
    String queryNumberSQL="SELECT * from course where coursename like '%"+name+"%'";
    ResultSet rs=stmt.executeQuery(queryNumberSQL);//执行数据库查询操作并获取结果集
    

     while(rs.next())
     {

      out.print(rs.getString("coursename")+"--");
      out.print(rs.getString("deptname")+"--");
     }
            
      rs.close();
      stmt.close();
      conn.close();
 }
      
catch(Exception e)
 {
   out.println(e.getMessage());
 }
%>

</body>

</html>