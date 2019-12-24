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
			<h3 class="display-3">파일업로드</h3>


			<form name="f" method="post" enctype = "multipart/form-data" action="upload.jsp">
				<div class="form-group">
					
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-17">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="text" class="form-control" placeholder="이름을 입력하세요" id="name" name="name">
					</div>
				</div>
				
			<!-- 	<div class="custom-file">
					<input type="file" class="custom-file-input" id="validatedCustomFile" required> <label
						class="custom-file-label" for="validatedCustomFile">Choose file...</label>
					<div class="invalid-feedback">Example invalid custom file
						feedback</div>
				</div> -->
					<div class="col-sm-17">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="file" class="form-control" id="file" name="file">
					</div>
				

			</form>
			<div class="text-right">
		
				<%if(memberDto != null) {%>
				<button type="button" id = "uploadFile" class="btn btn-outline-success">저장</button>
				<%} %>
			</div>

		</div>
	</div>
  </div>
  <!-- main end-->
  
  <%@ include file = "../inc/footer.jsp" %>
  
  
  
  <script>
 	 $(function(){
		$ ("#uploadFile").click(function(){
			f.submit();
		});
	  });


  </script>
 
  
  