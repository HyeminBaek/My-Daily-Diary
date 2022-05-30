$(function(){
	
	//로그인 버튼 이벤트
	$("#login").on('click',function(){
		if($("#id").val()==""){
			alert("아이디를 입력하세요");
			$("#id").focus();
			return;
		}
		if($("#pw").val()==""){
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return;
		}
		$("#loginForm").submit();
	});
	

	//회원가입 버튼 이벤트
	$("#join").on('click',function(){
		if($("#id").val()==""){
			alert("아이디를 입력하세요");
			$("#id").focus();
			return;
		}
		if($("#pw").val()==""){
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return;
		}
		if($("#pwChk").val()==""){
			alert("비밀번호 확인 값을 입력하세요");
			$("#pwChk").focus();
			return;
		}
		if($("#pw").val()!=$("#pwChk").val()){
			alert("비밀번호와 동일한 값을 입력해주세요");
			$("#pwChk").focus();
			return;
		}
		$("#joinForm").submit();
	});
	
	//일기 작성 버튼 이벤트
	$("#insert").on('click',function(){
		if($("#newContent").val()==""){
			alert("내용을 입력하세요");
			$("#newContent").focus();
			return;
		}
		
		$("#writeForm").submit();
	});
	//일기 수정 버튼 이벤트
	$("#update").on('click',function(){
		if($("#newContent").val()==""){
			alert("내용을 입력하세요");
			$("#newContent").focus();
			return;
		}
		
		$("#updateForm").submit();
	});
}); // end of func