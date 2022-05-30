<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My Daily Diary; calendar</title>
<link rel="stylesheet" href="../css/page.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/theme.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script src="../js/calendar.js"></script>
<meta name="viewport" content="width=device-width">
</head>
<body>
	<h1><%=session.getAttribute("id")%>'s Daily Diary
	</h1>
	<main>
	<div class="calendar-wrapper" id="calendar-wrapper"></div>
	<div id="editor">
		<img src="../img/diary.jpg" style="height: 400px;">
	</div>
	</main>
	<div id="content"></div>
	<footer>신세계아이앤씨 JSP 과제 made by 백혜민</footer>

	<script type="text/javascript">
		var config = `
		function selectDate(date) { //캘린더의 일을 선택하면 read 페이지로 넘어감
			  $('#calendar-wrapper').updateCalendarOptions({
			    date: date
			  });
			  var selectedDate = calendar.getSelectedDate();
			  
			 console.log(Date.parse(selectedDate));
			  var tmp =Date.parse(selectedDate)+86400000;
			  console.log(new Date(tmp).toISOString().slice(0, 19).replace('T', ' '));
			location.replace("readDiary.jsp?date="+new Date(tmp).toISOString().slice(0, 19).replace('T', ' '));
		}
	
		var today = new Date();
		var defaultConfig = {
		  weekDayLength: 1,
		  date: (today.getMonth()+1)+'/'+today.getDate()+'/'+today.getFullYear(),
		  onClickDate: selectDate,
		  showYearDropdown: true,
		  startOnMonday: false,
		};
	
		var calendar = $('#calendar-wrapper').calendar(defaultConfig);
		`;
      eval(config);
      
    </script>
</body>
</html>

