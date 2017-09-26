<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.Timestamp"%>

<%@page import="java.sql.ResultSet"%>

<%@page import="dbcon.DBConnection"%>

<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 </title>
</head>
<body>


<%

	request.setCharacterEncoding("UTF-8");

	String id=request.getParameter("id");

	

	Connection con=null;

	PreparedStatement pstmt=null;

	ResultSet rs = null;

	try{

		con = DBConnection.getCon();

		String sql="select * from members where id=?";

    

		pstmt = con.prepareStatement(sql);

                pstmt.setString(1, id);

		rs = pstmt.executeQuery();


		while(rs.next()){

		String pwd = rs.getString("pwd");

		String email = rs.getString("email");

		String phone = rs.getString("phone");

		Timestamp regdate = rs.getTimestamp("regdate");

%>

<form name='frm1' method='post' action='updateOk.jsp'>

<table>

	<tr>

		<td>아이디</td>

		<td><%=id %><input type="hidden" name="id" value="<%=id%>"/></td>

	</tr>

	<tr>

		<td>비밀번호</td>

		<td><input type="text" name="pwd" value="<%=pwd %>"/></td>

	</tr>

	<tr>

		<td>이메일</td>

		<td><input type="text" name="email" value="<%=email %>"/></td>

	</tr>

	<tr>

		<td>전화번호</td>

		<td><input type="text" name="phone" value="<%=phone %>"/></td>

	</tr>

	<tr>

		<td>등록일</td>

		<td><%=regdate %></td>

	</tr>

	<tr>

		<td colspan="2" align="center">

		<input type="button" name="btn1" value="저장" onclick="javascript:frm1.submit();"/>

		<input type="button" name="btn2" value="목록" onclick="javascript:location.href='list.jsp';"/>

		</td>

	</tr>

</table>

</form>		

<%}

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

<script type="text/javascript">

	function update(){

		document.frm1.submit();

	}

	function list(){

		location.href="list.jsp";

	}

</script>

</body>
</html>