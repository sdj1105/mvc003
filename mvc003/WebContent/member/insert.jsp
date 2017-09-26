<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 <%@ page import="java.sql.Connection" %>
 <%@ page import="dbcon.DBConnection" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원입력</title>
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

	String sql = "insert into members values(?,?,?,?, sysdate)";

	int n=0;

	

	try{

		con = DBConnection.getCon();

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, id);

		pstmt.setString(2, pwd);

		pstmt.setString(3, email);

		pstmt.setString(4, phone);

		

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

	// 결과 응답하기	

%>

<script type="text/javascript">
	if (<%=n%> > 0) {
		alert("정상적으로 회원가입이 되었습니다.");
		location.href="../index.html";
		
	}else {
		alert("회원가입에 실패햇습니다.");
		history.go(-1); // 이전 페이지로 가기
	}
</script>


</body>
</html>