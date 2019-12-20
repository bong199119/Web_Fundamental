<%@ page pageEncoding="utf-8"%>
<%@ include file = "../inc/header.jsp" %>

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
  <h3>Crawling(<%=totalRows %>)</h3>
			<div class="table-responsive-lg">
			<table class="table table-hover">
				<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="50%" />
					<col width="20%" />
					<col width="50%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>	
						<th scope="col">#</th>
						<th scope="col">open</th>
						<th scope="col">high</th>
						<th scope="col">low</th>
						<th scope="col">close</th>
						<th scope="col">volume</th>
						<th scope="col">market cap</th>
					</tr>
				</thead>
				<tbody>
				
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
				
					<tr>
						<td colspan="3">데이터가 존재하지 않습니다.</td>
					</tr>
			
				</tbody>
			</table>
			</div>
      </div>
    </div>
  </div>
  <!-- main end-->
  
  <%@ include file = "../inc/footer.jsp" %>
  
  
  
  
  
  