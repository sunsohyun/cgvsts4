<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.mycgv_jsp.vo.MemberVo" %>
<%@ page import = "com.mycgv_jsp.dao.MemberDao" %>

<jsp:useBean id="memberVo" class="com.mycgv_jsp.vo.MemberVo"/>
<jsp:setProperty property="*" name="memberVo"/>

<%
	MemberDao memberDao = new MemberDao();
	int result = memberDao.insert(memberVo);
	if(result == 1){
		//회원가입 성공 alert 창을 띄우고 페이지 이동시키기
		out.write("<script>");
		out.write("alert('회원가입 성공!');");
		out.write("location.href= 'http://localhost:9000/login/login.jsp'");
		out.write("</script>");
		
		//회원가입 성공시 종료되고 로그인창으로 이동 방법2 / ?붙이는건 쿼리스트링 방식!!외우자 -> 이방식은 밑에잇는 코드 출력안된다.
		//response.sendRedirect("http://localhost:9000/login/login.jsp?jresult=1");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><%= memberVo.getId() %></li>
		<li><%= memberVo.getPass() %></li>
		<li><%= memberVo.getName() %></li>
		<li><%= memberVo.getGender() %></li>
		<li><%= memberVo.getEmail() %></li>
		<li><%= memberVo.getAddr() %></li>
		<li><%= memberVo.getTel() %></li>
		<li><%= memberVo.getPnumber() %></li>
		<li><%= memberVo.getHobbyList() %></li>
		<li><%= memberVo.getIntro() %></li>
	</ul>
</body>
</html>