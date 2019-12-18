<%-- pageDirective.jsp --%>
<%-- <%@ page contentType = "application/json;charset=utf-8"%>--%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page pageEncoding  = "utf-8" %>
<%@ page import="java.util.Calendar" %>
<%@ page buffer = "10kb" %>
<%@ page autoFlush = "false" %>
<%@ page isThreadSafe = "false" %>
<%@ page info="jsp 페이지 입니다." %>
<%@ page errorPage =  "/error/error.jsp"%>


<% 

Calendar c = Calendar.getInstance();
SimpleDateFormat s = new SimpleDateFormat();

session.setAttribute("aa","aa");
out.println(application.getServerInfo());

int a = Integer.parseInt("123a");

	
%>

