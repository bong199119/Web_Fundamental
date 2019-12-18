<%@ page pageEncoding="utf-8" %>
<%-- <%@ include file="h.jsp"%> --%>
<jsp:include page = "h.jsp"/>
<% int age = 20; %>  <%-- 헤더에 int age가 있기때문에   <%@ include file="h.jsp"%>이걸쓰면 에러남 <jsp:include page = "h.jsp"/>이걸 써줘야됨--%>
	<section>section</section>
<%@ include file="f.jsp" %>