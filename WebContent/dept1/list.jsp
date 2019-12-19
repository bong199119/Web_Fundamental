<%@ page pageEncoding="utf-8"%>
<%@ page import="kr.co.acorn.dto.DeptDto1"%>
<%@ page import="kr.co.acorn.dao.DeptDao1"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file = "../inc/header.jsp" %>

<%
	int start = 0;
	int len = 5;
	int pageNum =0;
	
	DeptDao1 dao = DeptDao1.getInstance();
	ArrayList<DeptDto1> list = dao.select(start, len);
	
%>



	

  <!-- breadcrumb start-->
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Library</li>
    </ol>
  </nav>
  <!-- breadcrumb end-->
 <div class="container">
    <div class="row">
      <div class="col-lg-12">
  
  <h3> 부서리스트 </h3>
  <table class="table table-dark">
  
  <thead>
 				 <colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="50%" />
					<col width="20%" />
				</colgroup>
    <tr>
      <th scope="col">#</th>
      <th scope="col">부서번호</th>
      <th scope="col">부서이름</th>
      <th scope="col">부서위치</th>
    </tr>
  </thead>
  <tbody>
  <%
  if(list.size() != 0){
  %>
  
  <%for(DeptDto1 dto : list) {%>
  
    <tr>
      <th><%=pageNum%></th>
      <td><%=dto.getNo() %></td>
      <td><%=dto.getName() %></td>
      <td><%=dto.getLoc() %></td>
    </tr>
   <%} %>
   <%}else{ %>
   		<tr>
   			<td colspan = "3">데이터가 존재하지 않습니다.</td>
   		</tr>
   
   <%} %>
  </tbody>
</table>
  
  
      </div>
    </div>
  </div>
  <!-- main end-->
  
  <%@ include file = "../inc/footer.jsp" %>
  
  
  