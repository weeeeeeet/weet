var ctx = document.getElementById('myChart3').getContext('2d');

var chart = new Chart(ctx, {
  // 챠트 종류를 선택
  type: 'line',

  // 챠트를 그릴 데이타
  data: {
    labels: ['22.05.30', '22.06.05', '22.06.15', '22.06.24', '22.06.30'],
    datasets: [{
      label: '체지방률',
      backgroundColor: 'transparent',
      borderColor: '#87cefa',
      data: [63.5 , 65.3 , 64.7 , 63.2 , 62.9 ]
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
						min: 60,
						stepSize : 1,
						fontSize : 14,
					}
				}]
			}
  }
});
