<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	String tempPage = request.getParameter("page");
	String name = request.getParameter("name");
	if(tempPage == null || tempPage.length() == 0){
		tempPage = "1";
	}
	if(name == null || name.length() == 0){
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
	
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.select(name);
	
	if(dto==null){
		response.sendRedirect("list.jsp?page="+cPage);
		return;
	}
	
	String email = dto.getEmail();
	String phone = dto.getPhone();
	String regdate = dto.getRegdate();
		
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

  <!-- breadcrumb end-->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			
			<h3>회원상세보기</h3>
			<form name="f" method="post">
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">회원이름</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="text" class="form-control" id="name" name="name" value="<%=name %>">
					</div>
				</div>
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">회원 이메일</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="text" class="form-control" id="email" name="email" value="<%=email %>">
					</div>
				</div>
				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="password" class="form-control" id="password" name="password" value="">
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">회원 전화번호</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="number" class="form-control" id="phone" name="phone" value="<%=phone %>">
					</div>
				</div>
				<div class="form-group row">
					<label for="regdate" class="col-sm-2 col-form-label">등록일자</label>
					<!-- sm크기가 2보다 작으면 내려서-->
					<div class="col-sm-10">
						<!-- sm크기가 10보다 크면 정상적으로-->
						<input type="text" class="form-control" id="regdate" readonly="readonly" name="regdate" value="<%=regdate %>">
					</div>
				</div>
				
				<input type = "hidden" name = "page" value="<%=cPage%>"/>

			</form>
			<div class="text-right">
						<a href="list.jsp?page=<%=cPage %>"	class="btn btn-outline-secondary">목록</a>
						<button type="button" id ="updateMember" class="btn btn-outline-success">수정</button>
						<button type="button" id = "deleteMember" class="btn btn-outline-danger">삭제</button>
			</div>

		</div>
	</div>
</div>
<!-- main end-->

<%@ include file="../inc/footer.jsp"%>

  <script>
  
  	$(function(){
  		$("#no").focus();
  		$("#updateMember").click(function(){
  		
  			
  			if($("#name").val().length==0){
  				alert("이름을 입력하세요.");
  				$("#name").focus();
  				return;
  			}
  			if($("#email").val().length==0){
  				alert("이메일을 입력하세요.");
  				$("#email").focus();
  				return;
  			}
  			if($("#password").val().length==0){
  				alert("비밀번호를 입력하세요.");
  				$("#password").focus();
  				return;
  			}

  			if($("#phone").val().length==0){
  				alert("전화번호를 입력하세요.");
  				$("#phone").focus();
  				return;
  			}
  			
  			
  			f.action="update.jsp";
  			f.submit();
  		});
  		$('#deleteEmp').click(function(){
  			f.action = "delete.jsp";
  			f.submit();
  			
  		});
	
  	});
  	
  </script>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


