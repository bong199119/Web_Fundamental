<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>


<!--  -->

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
			<h3 class="display-3">Department</h3>
			<h3 class="display-3">상세보기</h3>

			<form name="f" method="post">
				<!-- 액션 지우기-->
				<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">부서번호</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="number" class="form-control" id="no" name="no"
							value="10">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">부서이름</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="text" class="form-control" id="name" name="name"
							value="총무부">
					</div>
				</div>
				<div class="form-group row">
					<label for="loc" class="col-sm-2 col-form-label">부서위치</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="text" class="form-control" id="loc" name="loc"
							value="서울">
					</div>
				</div>

			</form>
			<div class="text-right">
						<a href="list.jsp" class="btn btn-outline-secondary">목록</a>
						<button type="button" id ="updateDept" class="btn btn-outline-success">수정</button>
						<button type="button" id = "deleteDept" class="btn btn-outline-danger">삭제</button>
			</div>

		</div>
	</div>
</div>
<!-- main end-->

<%@ include file="../inc/footer.jsp"%>


  
  <script>
  
  	$(function(){
  		$("#no").focus();
  		$("#updateDept").click(function(){
  			//자바스크립트 유효성 검사
  			
  			if($("#no").val().length==0){
  				alert("부서번호를 입력하세요.");
  				$("#no").focus();
  				return;
  			}
  			
  			
  			if($("#name").val().length==0){
  				alert("부서명을 입력하세요.");
  				$("#name").focus();
  				return;
  			}
  			
  			
  			if($("#loc").val().length==0){
  				alert("부서위치를 입력하세요.");
  				$("#loc").focus();
  				return;
  			}
  			f.action="update.jsp";
  			f.submit();
  		
  		});
  		$("#deleteDept").click(function(){
  			f.action="delete.jsp";
  			f.submit();
  		});
  		
  		
  		
  	});
  	
  </script>
  


