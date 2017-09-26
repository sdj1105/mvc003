<%@page import="dbcon.DBConnection"%>

<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 페이지</title>
</head>
<body>

<%

	//삭제할 아이디

	Connection con = null;

	PreparedStatement pstmt = null;

	

	String id = request.getParameter("id");

	int n=0;

	try{

		con = DBConnection.getCon();

		String sql="delete from members where id=?";

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, id);

		

		n = pstmt.executeUpdate();

	}catch(SQLException se){

		System.out.println(se.getMessage());

	}finally{

		if(pstmt!=null) pstmt.close();

		if(con!=null) con.close();

	}

	response.sendRedirect("list.jsp");

%>


</body>
</html>