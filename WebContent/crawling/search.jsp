<%@ page import="kr.co.acorn.dao.CrawlDao"%>
<%@page import="kr.co.acorn.dto.CrawlDto"%>
<%@ page pageEncoding="utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	int y1get = Integer.parseInt(request.getParameter("y1"));
	int m1get = Integer.parseInt(request.getParameter("m1"));
	int d1get = Integer.parseInt(request.getParameter("d1"));
	int y2get = Integer.parseInt(request.getParameter("y2"));
	int m2get = Integer.parseInt(request.getParameter("m2"));
	int d2get = Integer.parseInt(request.getParameter("d2"));
	

%>
<script>

location.href="list.jsp?y1=<%=y1get%>&m1=<%=m1get%>&d1=<%=d1get%>&y2=<%=y2get%>&m2=<%=m2get%>&d2=<%=d2get%>";

</script>