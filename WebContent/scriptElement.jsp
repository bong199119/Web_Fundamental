<%-- scriptElement.jsp--%>

<%@ page pageEncoding="utf-8"%>

<%!
	private String name;
	private String id;
	
	public int plus(int a, int b ){
		return a+b;
	}
	
%>
<%--out은 <%%>안에서만 쓸수 있음--%>
<%-- declalation은 거의 안씀  --%>

<%
	out.println("1+2 = "+plus(1,2)+"<br>");
%>


1+2 = <%=plus(1,2)%>

<% out.println(plus(1,2)); %>


