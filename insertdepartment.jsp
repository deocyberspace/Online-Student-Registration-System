<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert departmentname</title>
</head>
<body>
<h2>Welcome!</h2>

<form method="post">
<br>

<input value="insert" type="submit" name="button1">

</form>

<%
try{
   
    Class.forName("com.mysql.cj.jdbc.Driver");//加载mysql驱动
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=GMT","root","Pha/2007/094");//localhost是本机地址，3306是端口号，最后是用户名和密码
    String sql="Insert into department(departmentname) values(?)";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, "economics");
    int n=pstmt.executeUpdate();
    if(n==1){System.out.print("Insert Successfully！");}  
    else{System.out.print("Failed！");}
    
    pstmt.close();
    conn.close();
 }
      
catch(Exception e)
 {
   out.println(e.getMessage());
 }
%>

</body>

</html>