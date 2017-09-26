<%@page import="java.sql.SQLException"%>

<%@page import="dbcon.DBConnection"%>

<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 오케이</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8");




	String id=request.getParameter("id");

	String pwd=request.getParameter("pwd");

	String email=request.getParameter("email");

	String phone=request.getParameter("phone");




	//db에 저장하기

	Connection con = null;

	PreparedStatement pstmt = null;

	String sql = "update members set pwd=?, email=?, phone=? where id= ?";

	int n=0;

	

	try{

		con = DBConnection.getCon();

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, pwd);

		pstmt.setString(2, email);

		pstmt.setString(3, phone);

		pstmt.setString(4, id);

		

		n = pstmt.executeUpdate();

	}catch(SQLException se){

		System.out.println(se.getMessage());

	}finally{

		try{

			if(pstmt!=null) pstmt.close();

			if(con!=null) con.close();

		}catch(SQLException se){

			System.out.println(se.getMessage());

		}

	}

%>




<script type="text/javascript">

	if(<%=n%>>0 ){

		alert("수정되었습니다.");

		location.href="list.jsp";

	}else{

		alert("수정 실패");

		history.go(-1);

	}

</script>

</body>
</html>