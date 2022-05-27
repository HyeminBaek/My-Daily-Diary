<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Little Diary; join</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="../myDiary.js"></script>
</head>
<body>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-light gray text-black"
						style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">
							<div class="mb-md-5 mt-md-4 pb-5">

								<h2 class="fw-bold mb-2 text-uppercase">JOIN US</h2>
								<p class="text-black-50 mb-5">회원정보를 입력해주세요!</p>

								<form action="main.jsp" method="post" id="joinForm">
									<div class="form-outline form-black mb-4">
										<label class="form-label" for="idLabel">아이디</label> 
										<input type="text" id="id" name="id" class="form-control form-control-lg" />
									</div>

									<div class="form-outline form-black mb-4">
										<label class="form-label" for="pwLabel">비밀번호</label> 
										<input type="password" id="pw" name="pw" class="form-control form-control-lg" />
									</div>

									<button id="join" class="btn btn-secondary px-5 mt-5" type="submit">가입하기</button>
								</form>
							</div>
						</div>
						<!-- end of <div class="card-body p-5 text-center"> -->
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>