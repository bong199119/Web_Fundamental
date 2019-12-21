<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.acorn.dao.CrawlDao"%>
<%@page import="kr.co.acorn.dto.CrawlDto"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file = "../inc/header.jsp" %>
<%


	

	int y1get = 0;
	int m1get = 0;
	int d1get = 0;
	int y2get = 0;
	int m2get = 0;
	int d2get = 0;
	int pageLength = 3;
	int len = 100;
	int cPage = 0;
	int start = 0;
	
	if(request.getParameter("y1") != null){
		y1get = Integer.parseInt(request.getParameter("y1"));
	}
	if(request.getParameter("m1") != null){
		m1get = Integer.parseInt(request.getParameter("m1"));
	}
	if(request.getParameter("d1") != null){
		d1get = Integer.parseInt(request.getParameter("d1"));
	}
	if(request.getParameter("y2") != null){
		y2get = Integer.parseInt(request.getParameter("y2"));
	}
	if(request.getParameter("m2") != null){
		m2get = Integer.parseInt(request.getParameter("m2"));
	}
	if(request.getParameter("d2") != null){
		d2get = Integer.parseInt(request.getParameter("d2"));
	}
	
	int totalRows = 0;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int pageNum = 0;
	
	int startdate = y1get*10000+m1get*100+d1get; 
	int enddate = y2get*10000+m2get*100+d2get; 
	if(startdate ==0 && enddate ==0){
		startdate = 20181225;
		enddate = 20191225;
	}
	
	CrawlDao dao = CrawlDao.getInstance();
	 ArrayList<CrawlDto> list = dao.crawl(startdate, enddate);
	 totalRows = dao.getTotalRows(list);
	
	
	
	String tempPage = request.getParameter("page");
	if(tempPage == null || tempPage.length() == 0 ){
		cPage = 1;
	}
	try{
	cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1; 
	}
	 
	

	
	totalPage = totalRows % len == 0 ? totalRows/len : totalRows/len+1;
	if(totalPage == 0){
		totalPage = 1;
	}
	
 	if(totalPage < cPage){
		response.sendRedirect("list.jsp?page=1");
		return; 
		//cPage=1;
	} 
	
	
	 start = (cPage - 1)*len; 
	 pageNum = totalRows + (cPage-1) *(-len); 
	
	 
	
	/* totalRows = 132;
		len = 5;
		pageLength = 10;
					startPage 	 endPage
		cPage = 1		1			10
		cPage = 5		1			10
		cPage = 14		11			20
		cPage = 18 		11			20
		cPage = 22		21			27
		
		cPage = 1-10 n=>1 n=>currentBlock
		cPage = 11-20  n=> 2  n=>currentBlock
		
		startPage = 1 + (currentBlock-1) = pageLength()
		endPage = pageLength + (currentBlock-1)*pageLength()
		
		
	*/
	
 	int currentBlock = cPage % pageLength == 0 ?  
			( cPage / pageLength ) : ( cPage / pageLength + 1 );
			
	int totalBlock =  totalPage % pageLength == 0 ?  
			( totalPage / pageLength ) : ( totalPage / pageLength + 1 );
			
	
	startPage = 1 + (currentBlock-1)*pageLength;
	endPage = pageLength + (currentBlock-1)*pageLength;
	
	if(currentBlock == totalBlock){
		endPage = totalPage;
	} 
	
%>
  <!-- breadcrumb start-->
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">코인정보</li>
    </ol>
  </nav>
  <!-- breadcrumb end-->
 <div class="container">
    <div class="row">
      <div class="col-lg-12">
  	<h2>코인정보(<%=totalRows %>)</h2><br>
  	<form name="f" method="post" action="save.jsp">
				<div class="form-group row">
					<label for="no" class="col-sm-3 col-form-label"><h4>    여기 부터~</h4></label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="form-group col-sm-3">
						
						
						
				      <select id="inputState" name = "y1" class="form-control">
				    <%for(int y1=2000;y1<=2019;y1++){%>
				        <option selected value="<%=y1%>"><%=y1%></option>
				       
				        <%} %>
				      </select>
				    </div>
				    <div class="form-group col-sm-3">
				      <select id="inputState" name = "m1" class="form-control">
				      <%for(int m1=1;m1<=12;m1++) {%>
				        <option selected value="<%=m1%>"><%=m1%></option>
				        <%} %>
				      </select>
				    </div>
				    <div class="form-group col-sm-3">
				      <select id="inputState" name = "d1" class="form-control">
				      
				         <%for(int d1=1;d1<=31;d1++) {%>
				        <option selected  value="<%=d1%>"><%=d1%></option>
				         <%} %>
				     
				        
				       
				      </select>
				    </div>
				</div>
				<div class="form-group row">
					<label for="no" class="col-sm-3 col-form-label"><h4>    여기 까지!</h4></label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="form-group col-sm-3">
				      <select id="inputState"  name = "y2" class="form-control">
				        <%for(int y2=2000;y2<=2019;y2++){%>
				        <option selected value="<%=y2%>"><%=y2%></option>
				      
				        <%} %>
				      </select>
				    </div>
				    <div class="form-group col-sm-3">
				      <select id="inputState" name = "m2" class="form-control">
				        <%for(int m2=1;m2<=12;m2++) {%>
				        <option selected value="<%=m2%>"><%=m2%></option>
				        <%} %>
				      </select>
				    </div>
				    <div class="form-group col-sm-3">
				      <select id="inputState"  name = "d2"  class="form-control">
				        <%for(int d2=1;d2<=31;d2++) {%>
				        <option selected value="<%=d2%>"><%=d2%></option>
				         <%} %>
				      </select>
				    </div>
				</div>
			</form>
			
			<%if(y1get != 0) {%>
			<br><br><br><h2><%=y1get %>년 <%=m1get %>월 <%=d1get %>일  ~ <%=y2get %>년 <%=m2get %>월 <%=d2get %>일</h2>
			<%}else{ %>
			<br><br><br><h2>2018년 12월 25일 ~ 2019년 12월 25일</h2>
			<%} %>
			<div class="text-right">
					
					<button type= "button" id = "search" class ="btn btn-outline-secondary" >검색</button>
			</div>
							  	
			<div class="table-responsive-lg">
			<table class="table table-hover">
				<colgroup>
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
				</colgroup>
				<thead>
					<tr>	
						<th scope="col">date</th>
						<th scope="col">open</th>
						<th scope="col">high</th>
						<th scope="col">low</th>
						<th scope="col">close</th>
						<th scope="col">volume</th>
						<th scope="col">market cap</th>
					</tr>
				</thead>
					<tbody>
						
						<%if(list.size() != 0) {%>
						<%int count = 0; %>
						<%for(CrawlDto dto: list) {%>
					
						<tr>
							<%if((count >= start) && (count < start+len)) {%>
							<td><%=dto.getDate() %></td>
							<td><%=dto.getOpen()%></td>
							<td><%=dto.getHigh()%></td>
							<td><%=dto.getLow()%></td>
							<td><%=dto.getClose()%></td>
							<td><%=dto.getVolume()%></td>
							<td><%=dto.getMarketcap()%></td>
						<%} %>
						<%count++; %>
						</tr>
						<%} %>
						<%}else{ %>
						<tr>
							<td colspan="3">데이터가 존재하지 않습니다.</td>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
			<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  	<%if(currentBlock == 1){ %>
		  	<li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <%}else{ %>
		    <li class="page-item">
		      <a class="page-link" href="list.jsp?page=<%=startPage-1%>">Previous</a>
		    </li>
		    <%} %>
		    <%for(int i = startPage;i<=endPage;i++){ %>
		    <li class="page-item <%if(cPage==i){ %>active<%}%>"><a class="page-link" href="list.jsp?page=<%=i%>"><%=i %></a></li>
		    <%} %>
		    <%if(currentBlock == totalBlock){ %>  
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a>
		    </li>
		    <%}else{ %>
		    <li class="page-item">
		      <a class="page-link" href="list.jsp?page=<%=endPage+1%>">Next</a>
		    </li>
		    <%} %>
		  </ul>
		</nav>
      </div>
    </div>
  </div>
  <!-- main end-->
  
  <%@ include file = "../inc/footer.jsp" %>
  <script>
  $(function(){
	  $("#search").click(function(){
		  f.action="search.jsp";
		  f.submit();
	  });
  });
  </script>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  