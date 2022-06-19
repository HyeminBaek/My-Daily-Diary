# My-Daily-Diary(신세계아이앤씨 신입 JSP 교육 과제)
![image](https://user-images.githubusercontent.com/55080554/174471242-bd1572a4-dc01-4d77-94fc-45bd7627bf16.png)

[ My Daily Diary ]
<br>오늘 하루의 일기를 트위터 형식으로 작성할 수 있다.

[ User Scenario ]
<br>사용자가 로그인을 하면 메인페이지로 이동한다.
<br>사용자 별로 데이터를 따로 저장하여 유저가 달라지면 보이는 내용도 달라진다

<br>메인페이지엔 캘린더가 존재한다.
<br>캘린더의 날짜를 누르면 그 날 쓴 일기를 볼 수 있다

<br>캘린더의 날짜를 눌렀을 때의 동작은 다음과 같다. 
1. 캘린더 날짜에 일기가 없으면 쓰기 모드가 된다
2. 캘린더 날짜에 일기가 있으면 읽기 모드가 된다

<br>읽기 모드 페이지에선 수정버튼과 삭제 버튼이 존재한다
<br>수정 버튼을 누르면 수정 페이지로, 삭제 버튼을 누르면 삭제 페이지로 이동한다

[ DB Schema ]

(1) User
```
create table User (
	id varchar(20),
	pw varchar(20),
	primary key(id)
);
```

(2) Diary
```
create table Diary (
	id varchar(20), 
	date Timestamp,
	content varchar(3000),
	foreign key(id) references user(id) on update cascade,
	primary key(date)
); 
```

[ PAGE ]
<br>(1) index.jsp : 로그인 페이지, 회원가입을 할 수 있다
<br>(2) joinForm.jsp : 회원가입 페이지
<br>(3) join.jsp : joinForm.jsp의 동작을 위한 페이지
<br>(4) writeForm.jsp : 일기쓰기 페이지
<br>(5) write.jsp : writeForm.jsp의 동작을 위한 페이지
<br>(6) main.jsp : 로그인을 하면 보이는 페이지, 캘린더를 클릭하면 이동하는 기능이 있다
<br>(7) readDiary.jsp : 일기읽기 페이지
<br>(8) updateForm.jsp: 일기수정 페이지
<br>(9) update.jsp: updateForm.jsp의 동작을 위한 페이지
<br>(10) deleteForm.jsp: 일기삭제 페이지
<br>(11) delete.jsp: deleteForm.jsp의 동작을 위한 페이지
<br>(12) login.jsp: 로그인 동작을 위한 페이지
