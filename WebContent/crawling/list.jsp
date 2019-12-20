<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.acorn.dao.CrawlDao"%>
<%@page import="kr.co.acorn.dto.CrawlDto"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file = "../inc/header.jsp" %>
<%
	int y1 =0;
	int m1 =0;
	int d1 =0;
	int y2, m2, d2 =0;
	int pageLength = 3;
	int cPage = 0;
	int startdate = 20171101;
	int enddate = 20171203;
	float startTime = 0;
	/* int totalRows = 0;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int pageNum = 0;
	 */
	CrawlDao dao = CrawlDao.getInstance();
	ArrayList<CrawlDto> list = dao.crawl(startdate, enddate); 
	startTime = System.currentTimeMillis();
		
	
	/*String tempPage = request.getParameter("page");
	if(tempPage == null || tempPage.length() == 0 ){
		cPage = 1;
	}
	try{
	cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1; 
	 }*/
	 
	
	//totalRows = dao.getTotalRows();

	/* 
	totalPage = totalRows % len == 0 ? totalRows/len : totalRows/len+1;
	if(totalPage == 0){
		totalPage =1;
	} */
	
/* 	if(totalPage < cPage){
		response.sendRedirect("list.jsp?page=1");
		return; */
		//cPage=1;
	/* } */
	
	
	/* start = (cPage - 1)*len; 
	
	//An = a1 + (n-1)*d
	
	pageNum = totalRows + (cPage-1) *(-len); */
	
	
	
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
	
/* 	int currentBlock = cPage % pageLength == 0 ?  
			( cPage / pageLength ) : ( cPage / pageLength + 1 );
			
	int totalBlock =  totalPage % pageLength == 0 ?  
			( totalPage / pageLength ) : ( totalPage / pageLength + 1 );
			
	
	startPage = 1 + (currentBlock-1)*pageLength;
	endPage = pageLength + (currentBlock-1)*pageLength;
	
	if(currentBlock == totalBlock){
		endPage = totalPage;
	} */
	
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
  	<h2>코인정보</h2><br>
  	<form name="f" method="post" action="save.jsp">
				<div class="form-group row">
					<label for="no" class="col-sm-3 col-form-label"><h4>    여기 부터~</h4></label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="form-group col-sm-3">
				      <select id="inputState" class="form-control">
				    <%for(y1=2000;y1<=2019;y1++){%>
				        <option selected><%=y1%></option>
				       
				        <%} %>
				      </select>
				    </div>
				    <div class="form-group col-sm-3">
				      <select id="inputState" class="form-control">
				      <%for(m1=1;m1<=12;m1++) {%>
				        <option selected><%=m1 %></option>
				        <%} %>
				      </select>
				    </div>
				    <div class="form-group col-sm-3">
				      <select id="inputState" class="form-control">
				      
				         <%for(d1=1;d1<=31;d1++) {%>
				        <option selected><%=d1 %></option>
				         <%} %>
				     
				        
				       
				      </select>
				    </div>
				</div>
				<div class="form-group row">
					<label for="no" class="col-sm-3 col-form-label"><h4>    여기 까지!</h4></label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="form-group col-sm-3">
				      <select id="inputState" class="form-control">
				        <%for(y1=2000;y1<=2019;y1++){%>
				        <option selected><%=y1%></option>
				      
				        <%} %>
				      </select>
				    </div>
				    <div class="form-group col-sm-3">
				      <select id="inputState" class="form-control">
				        <%for(m1=1;m1<=12;m1++) {%>
				        <option selected><%=m1 %></option>
				        <%} %>
				      </select>
				    </div>
				    <div class="form-group col-sm-3">
				      <select id="inputState" class="form-control">
				        <%for(d1=1;d1<=31;d1++) {%>
				        <option selected><%=d1 %></option>
				         <%} %>
				      </select>
				    </div>
				</div>
				

			</form>
			<div class="text-right">
					<a href="list.jsp?page=<%=cPage%>" type = "button" class="btn btn-outline-success">검색</a>
			
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
						<%for(CrawlDto dto: list) {%>

						<tr>
							
							<td><%=dto.getDate() %></td>
							<td><%=dto.getOpen()%></td>
							<td><%=dto.getHigh()%></td>
							<td><%=dto.getLow()%></td>
							<td><%=dto.getClose()%></td>
							<td><%=dto.getVolume()%></td>
							<td><%=dto.getMarketcap()%></td>
						

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
      </div>
    </div>
  </div>
  <!-- main end-->
  
  <%@ include file = "../inc/footer.jsp" %>
  
  
  
  
  
  