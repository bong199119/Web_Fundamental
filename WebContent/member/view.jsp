<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	String tempPage = request.getParameter("page");
	String tempNo = request.getParameter("no");
	if(tempPage == null || tempPage.length() == 0){
		tempPage = "1";
	}
	if(tempNo == null || tempNo.length() == 0){
		response.sendRedirect("list.jsp?page="+tempPage);
		return;
	}
	int cPage = 0;
	int no = 0;
	
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	
	try{
		no = Integer.parseInt(tempNo);
	}catch(NumberFormatException e){
		response.sendRedirect("list.jsp?page="+cPage);
		return;
	}
	
	
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = dao.select(no);
	
	if(dto==null){
		response.sendRedirect("list.jsp?page="+cPage);
		return;
	}
	
	String name = dto.getName();
	String job = dto.getJob();
	int mgr = dto.getMgr();
	String hiredate = dto.getHiredate();
	int sal = dto.getSal();
	int comm = dto.getComm();
	int deptNo = dto.getDeptDto().getNo();
		
%>

<!--  -->



<!--  -->

  <!-- breadcrumb start-->
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="#">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">회원관리</li>
    </ol>
  </nav>
  <!-- breadcrumb end-->

  
 <div class="container">
    <div class="row">
		<div class="col-lg-12">
			<h3 class="display-3">회원 상세보기</h3>
		

			<form name="f" method="post" action="save.jsp">
				<%--  
				<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">사원번호</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="number" class="form-control" id="no" name="no">
					</div>
				</div>
				--%>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="text" class="form-control" id="name" name="name">
						<div id = "nameMessage"></div>
					</div>
				</div>
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="email" class="form-control" id="email" name="email">
						<div id = "emailMessage"></div>
					</div>
				</div>
				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="password" class="form-control" id="password" name="password">
						<div id = "passwordMessage"></div>
					</div>
				</div>
				<div class="form-group row">
					<label for="repassword" class="col-sm-2 col-form-label">비밀번호 확인</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="password" class="form-control" id="repassword" name="repassword">
						<div id = "repasswordMessage"></div>
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">휴대전화 번호</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="tel" class="form-control" id="phone" name="phone">
						<div id = "phoneMessage"></div>
					</div>
				</div>
				<input type = "hidden" id = "checkEmail" value = "no">
				
			</form>
			<div class="text-right">
				<a href="list.jsp?page=<%=cPage%>" class="btn btn-outline-secondary">목록</a>
				<button type="button" id = "saveMember" class="btn btn-outline-success">저장</button>
			
			</div>

		</div>
	</div>
  </div>
  <!-- main end-->
  
  <%@ include file = "../inc/footer.jsp" %>
  
  
  <script>
  	$(function(){
  		$("#name").focus();
  		$("#saveMember").click(function(){
  			//자바스크립트 유효성 검사
  			
  		/* 	if($("#no").val().length==0){
  				alert("사원번호를 입력하세요.");
  				$("#no").focus();
  				return;
  			} */
  			
  			
  			if($("#name").val().length==0){
  				$("#name").addClass("is-invalid");
  				$("#nameMessage").html("<span class='text-danger'>이름을 입력하세요</span>")
  				$("#name").focus();
  				return;
  			}
  			/* 	정규표현식은 슬래쉬로 시작 하고 끝남 ^시작한다 영자숫자, \.\- 점하고 대쉬만 허용  */
  			let regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;  			
  		
  			if(regEmail.test($("#email").val()) == false){
  				$("#email").addClass("is-invalid");
  				$("#emailMessage").html("<span class='text-danger'>올바른 이메일 형식이 아닙니다</span>")
  				$("#email").focus();
  				return;
  			}
  			

  			if($("#password").val().length==0){
  				$("#password").addClass("is-invalid");
  				$("#passwordMessage").html("<span class='text-danger'>비밀번호를 입력하세요</span>")
  				$("#password").focus();
  				return;
  			}
  			

  			if($("#repassword").val().length==0){
  				$("#repassword").addClass("is-invalid");
  				$("#repasswordMessage").html("<span class='text-danger'>비밀번호를 확인하세요</span>")
  				$("#repassword").focus();
  				return;
  			}

  			if($("#password").val() != $("#repassword").val()){
  				$("#repassword").addClass("is-invalid");
  				$("#repasswordMessage").html("<span class='text-danger'>비밀번호가 일치하지 않습니다</span>")
  				$("#password").val("");
  				$("#repassword").val("");
  				$("#repassword").focus();
  				return;
  			}
  			if($("#phone").val().length==0){
  				$("#phone").addClass("is-invalid");
  				$("#phoneMessage").html("<span class='text-danger'>핸드폰 번호를 입력하세요</span>")
  				$("#phone").focus();
  				return;
  			}
  			
  			
  			if($("#checkEmail").val()=="no"){
  				return;
  			}
  			f.submit();
  		
  		});
  		
  		$("#name").keyup(function(){
  			$("#name").removeClass("is-invalid");
  			$("#nameMessage").html('');
  		})
  		
  		$("#email").keyup(function(){
  			$("#email").removeClass("is-invalid");
  			$("#emailMessage").html('');
  			
  			let regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
  			if(regEmail.test($("#email").val())){
  				$.ajax({
  					type : 'GET',
  					url : 'check_email_ajax.jsp?email='+$("#email").val(),
  					dataType : 'json',
  					error : function(){
  						alert('error');
  					},
  					success : function(json){
  						//json => {"result" : "ok or fail"}
  						//ok => DB에 등록된 이메일이 없음.
  						if(json.result == "ok"){
  							$("#emailMessage").html("<span class='text-success'>등록 가능한 이메일 입니다.</span>");
  							$("#checkEmail").val("yes");
  						}else{
  							$("#eamil").addClass("is-invalid");
  							$("#emailMessage").html("<span class='text-danger'>이미 강을 건너버린 이메일 입니다.</span>");
  							$("#checkEmail").val("no");
  							
  						}
  					}
  				});
  			}
  			
  		
  		});
  		
  		$("#password").keyup(function(){
  			$("#password").removeClass("is-invalid");
  			$("#passwordMessage").html('');
  		})
  			
  		$("#repassword").keyup(function(){
  			$("#repassword").removeClass("is-invalid");
  			$("#repasswordMessage").html('');
  		})
  			
  		$("#phone").keyup(function(){
  			$("#phone").removeClass("is-invalid");
  			$("#phoneMessage").html('');
  		})
  		
  		
  	});
  	
  	
  	
  
  
  </script>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


