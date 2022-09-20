var ctx2 = document.getElementById('myChart2').getContext('2d');

var chart2 = new Chart(ctx2, {
  // 챠트 종류를 선택
  type: 'line',

  // 챠트를 그릴 데이타
  data: {
    labels: datearr,
    datasets: [{
      label: '골격근량',
      backgroundColor: 'transparent',
      borderColor: '#f08080',
      data: muscleArr
    }]
  },
  // 옵션
  options: {
    legend: {
      display: false
    },
    title: {
      display : true,
      text: '골격근량( kg )'
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
