var ctx3 = document.getElementById('myChart3').getContext('2d');

var chart3 = new Chart(ctx3, {
  // 챠트 종류를 선택
  type: 'line',

  // 챠트를 그릴 데이타
  data: {
    labels: datearr,
    datasets: [{
      label: '체지방률',
      backgroundColor: 'transparent',
      borderColor: '#87cefa',
      data: fatPctarr
    }]
  },
  // 옵션
  options: {
    legend: {
      display: false
    },
    title: {
      display : true,
      text: '체지방률( % )'
    },
    responsive: true,
			scales: {
				yAxes: [{
					ticks: {
						min: 30,
						stepSize : 10,
						fontSize : 14,
					}
				}]
			}
  }
});
