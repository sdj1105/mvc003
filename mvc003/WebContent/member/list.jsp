<%@page import="dbcon.DBConnection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 목록</title>
</head>
<body>
<h2>회원목록</h2>

<table border="1" width="600px">

	<tr>

		<td>아이디</td>

		<td>비밀번호</td>

		<td>이메일</td>

		<td>전화번호</td>

		<td>가입일</td>

		<td>삭제</td>

		<td>수정</td>

	</tr>

	<%

		//db 에서 회원목록 얻어와 테이블에 출력하기.

		Connection con=null;

		PreparedStatement pstmt=null;

		ResultSet rs = null;

		try{

			con = DBConnection.getCon();

			String sql="select * from members";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()){
				
				String id = rs.getString("id");

				String pwd = rs.getString("pwd");

				String email = rs.getString("email");

				String phone = rs.getString("phone");

				Timestamp regdate = rs.getTimestamp("regdate");

%>

	<tr>

		<td><%=id %></td>

		<td><%=pwd %></td>

		<td><%=email %></td>

		<td><%=phone %></td>

		<td><%=regdate %></td>

		<td><a href="delete.jsp?id=<%=id%>" >삭제</a></td>

		<td><a href="update.jsp?id=<%=id%>" >수정</a></td>

	</tr>

<%

			}

		}catch(SQLException se){

			System.out.println(se.getMessage());

		}finally{

			try{

				if(rs!=null)  rs.close();

				if(pstmt!=null)  pstmt.close();

				if(con!=null)  con.close();

			}catch(SQLException se){

				System.out.println(se.getMessage());

			}

		}

	%>

</table>
</body>
</html>