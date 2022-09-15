var ctx = document.getElementById('myChart').getContext('2d');

var chart = new Chart(ctx, {
  // 챠트 종류를 선택
  type: 'line',

  // 챠트를 그릴 데이타
  data: {
    labels: datearr,
    datasets: [{
      label: '체중',
      backgroundColor: 'transparent',
      borderColor: '#14E302',
      data: weightArr
    }]
  },
  
  // 옵션
  options: {
    legend: {
      display: false
    },
    title: {
      display : true,
      text: '체중( kg )'
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