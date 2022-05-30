<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Daily Diary; login</title>
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="js/myDiary.js"></script>
</head>
<body>
	<section class="vh-100 gradient-custom">
  	<div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-light gray text-black" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase">My Daily Diary</h2>
              <p class="text-black-50 mb-5">로그인과 비밀번호를 입력해주세요!</p>
              
			  <form action="controller/login.jsp" method="post" id="loginForm">
	              <div class="form-outline form-black mb-4">
	              	<label class="form-label" for="idLabel">아이디</label>
	                <input type="text" name="id" id="id" class="form-control form-control-lg" />
	              </div>
	
	              <div class="form-outline form-black mb-4">
	              	<label class="form-label" for="pwLabel">비밀번호</label>
	                <input type="password" name="pw" id="pw" class="form-control form-control-lg" />
	              </div>
	
	              <button id="login" class="btn btn-secondary px-5" type="button">로그인</button>
			  </form>
			  
            </div>

            <div>
              <p class="mb-0">계정이 없으시다면 <a href="view/joinForm.jsp" class="text-black-50 fw-bold">회원가입</a>
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>