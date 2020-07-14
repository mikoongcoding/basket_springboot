document.getElementById('datePicker1').value = new Date()
		.toISOString().substring(0, 10);
document.getElementById('datePicker2').value = new Date()
		.toISOString().substring(0, 10);
$(function() {
	$('#datePicker1').datepicker({
		format : "yyyy/mm/dd", //데이터 포맷 형식(yyyy : 년  mm : 월  dd : 일 )
		autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		clearBtn : true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		disableTouchKeyboard : false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		immediateUpdates : false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		multidateSeparator : ",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		//showOn: "both",
		//buttonImage: "images/calendar.gif",
		templates : {
			leftArrow : '&laquo;',
			rightArrow : '&raquo;'
		}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
		title : "시작날짜", //캘린더 상단에 보여주는 타이틀
		todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
		toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		weekStart : 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		language : "ko" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	}).on("changeDate", function(e) {
		//이벤트의 종류
		//show : datePicker가 보이는 순간 호출
		//hide : datePicker가 숨겨지는 순간 호출
		//clearDate: clear 버튼 누르면 호출
		//changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
		//changeMonth : 월이 변경되면 호출
		//changeYear : 년이 변경되는 호출
		//changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
		console.log(e); //찍어보면 event 객체가 나온다.
		const minDate = new Date(e.date.valueOf());
		console.log(minDate); // 선택날짜
		console.log(FunGetFormatDate(minDate));
		var m = $('#datePicker1').datepicker('getDate');
		console.log(m);
		//간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
		// e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
		// 위와 같은 형태로 보인다. 
		// 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
	});//datepicker1 end
});//ready end

$(function() {
	$('#datePicker2').datepicker({
		format : "yyyy/mm/dd", //데이터 포맷 형식(yyyy : 년  mm : 월  dd : 일 )
		autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		clearBtn : true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		disableTouchKeyboard : false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		immediateUpdates : false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		multidateSeparator : ",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		templates : {
			leftArrow : '&laquo;',
			rightArrow : '&raquo;'
		}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
		title : "끝날짜", //캘린더 상단에 보여주는 타이틀
		todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
		toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		weekStart : 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		language : "ko" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

	}).on("changeDate", function(e) {
		//이벤트의 종류
		//show : datePicker가 보이는 순간 호출
		//hide : datePicker가 숨겨지는 순간 호출
		//clearDate: clear 버튼 누르면 호출
		//changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
		//changeMonth : 월이 변경되면 호출
		//changeYear : 년이 변경되는 호출
		//changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
		//console.log(e); 찍어보면 event 객체가 나온다.
		//간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
		// e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
		// 위와 같은 형태로 보인다. 
		// 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
	});//datepicker2 end
});//ready end
function FunGetFormatDate(date) {
	var year = date.getFullYear(); //yyyy
	var month = (1 + date.getMonth()); //M
	month = month >= 10 ? month : '0' + month; // month 두자리로 저장
	var day = date.getDate(); //d
	day = day >= 10 ? day : '0' + day; //day 두자리로 저장
	
	return year + '/' + month + '/' + day ;
}
