
document.addEventListener('DOMContentLoaded', function () {

    // calendar element 취득
    var calendarEl = document.getElementById('calendar');

    // full-calendar 생성하기
    var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간

        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },

        // initialDate: '2022-07-28', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true,  // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: false, // 일정 수정 가능
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        nowIndicator: true, // 현재 시간 마크
        locale: 'ko', // 한국어 설정

        // 이벤트 
        events: [
            {
                groupId: 999,
                title: '이벤트1', // 캘린더에 표시되는 일정의 이름
                start: '2022-08-01T16:00:00', //  캘린더에 표시되는 일정 시작 일
                end: '2022-08-03T19:00:00'  // 캘린더에 표시되는 일정 마지막 일
            },
            {
                groupId: 999,
                title: '이벤트2',
                start: '2022-08-10T16:00:00'
            },
            {
                title: '이벤트3',
                start: '2022-08-13',
                allDay: false // 일정이 하루 전체인지 여부(True, false)
            },
            {
                title: '이벤트4',
                start: '2022-08-16T10:30:00',
                end: '2022-08-19T12:30:00'
            },
            {
                title: '이벤트5',
                start: '2022-08-21T14:30:00',
                end: '2022-08-22T18:30:00'
            },
            {
                title: '이벤트6',
                start: '2022-08-31T14:30:00',
                // end: '2022-07-07T18:30:00'
                allDay: false // 일정이 하루 전체인지 여부(True, false)
            }

            //   { 
            //     title: 'Click for Google',
            //     url: 'http://google.com/', //구글로 이동함
            //     start: '2020-09-28'
            //   }
        ]
    });

    calendar.render();
});
