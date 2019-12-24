<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding = "utf-8"%>
<%@ page contentType = "text/html;charset=utf-8" %> <!-- html을사용할땐 이거 사용하지말자 json할때만 사용함 -->

<%

	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(null,email,password,null,null); //두개이상이면 무조건 객체로넘겨라!
	dto = dao.getMember(dto);
	if(dto != null){
		//세션 시간을 설정한다. 기본시간은 30분
		session.setMaxInactiveInterval(60*60*24);		
		//세션에 dto 정보를 저장한다.
		session.setAttribute("member",dto);
		%>
		<script>
			//alert('로그인 성공');
			location.href="/index.jsp";
		</script>
		<% 
	}else{
		%>
		<script>
			alert('로그인 정보가 잘못되었습니다.');
			history.back(-1);
		</script>
		<% 
	}

%>
