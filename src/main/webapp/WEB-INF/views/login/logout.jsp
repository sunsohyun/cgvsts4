<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String)session.getAttribute("sid");
	if(sid != null){//null일때는 로그아웃이 안보이니까 체크 필요없음!
		session.invalidate();
	}
	
	//로그아웃시 알림창과 함께 메인화면으로 이동
	out.write("<script>");
	out.write("alert('로그아웃에 성공하셨습니다.');");
	out.write("location.href='http://localhost:9000/index.do';");
	out.write("</script>");
%>