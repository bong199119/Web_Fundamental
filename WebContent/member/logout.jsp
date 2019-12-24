<%@ page pageEncoding = "utf-8"%>

<%
	/*
	HttpSession 객체를 종료하는 방법
	1. 브라우저를 종료했을 경우.
	2. 해당페이지의 시간이 세션 만료시간을 경과했을 경우
	3. invalidate() 메서드를 호출하는 경우
	
	*/
	//session.removeAttribute("member"); // 리무브어트리뷰트는 member정보만 날려버림
	session.invalidate(); 				 // 얘는 세션을 날려버림!
	response.sendRedirect("/index.jsp");
	
	




%>