<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Server Page Depend !</title>
</head>
<body>
<h3>Which Pae will be depend by the user's message!</h3>

<%
 String name=request.getParameter("name");//value of name typed in login page
 String password=request.getParameter("password");//value of password
%>

<%
 Class.forName("com.mysql.cj.jdbc.Driver");//load mysql driver
 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=GMT","root","Pha/2007/094");//connect to the database
 Statement stmt=conn.createStatement();
 String queryNumberSQL="SELECT * from user where username='"+name+"' and password='"+password+"'"; //check the typed name and password
ResultSet rs=stmt.executeQuery(queryNumberSQL);//execute query
 boolean flag=false;
 if(rs.next()){
 flag=true;

 }else{
 flag=false;
 }

%>
<%
 if(flag){
%>
<jsp:forward page="LoginSuccess.jsp"></jsp:forward>
<%
 }else{

%>
<jsp:forward page="LoginFailed.jsp"></jsp:forward>
<%
 }
//close instance
rs.close();
stmt.close();
conn.close();

%>

</body>
</html>
