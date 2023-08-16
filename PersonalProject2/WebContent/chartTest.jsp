<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="jq/jquery-3.7.0.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto);

body {
	font-family: Roboto, sans-serif;
}

#chart {
	max-width: 400px;
	margin: 35px auto;
}
</style>
</head>
<body>

	<div id="chart"></div>

	<script>
	$.ajax({
		url: 'UserSt',
		dataType: 'json',
		success: function(data){
			var categories = data.map(item => item.genre);
			var maleData = data.map(item => item.male);
			var femaleData = data.map(item => item.female);
			
			var options = {
	          series: [{
	          name: '남성',
	          data: maleData,
	        }, {
        	  name: '여성',
	          data: femaleData,
	        }],
          	chart: {
	          type: 'bar',
	          height: 300,
	          stacked: true,
	          stackType: '100%'
	        },
	        plotOptions: {
	          bar: {
	            horizontal: true,
	          },
	        },
	        stroke: {
	          width: 1,
	          colors: ['#fff']
	        },
	        xaxis: {
	          categories: categories,
	        },
	        tooltip: {
	          y: {
	            formatter: function (val) {
	              return val + "명"
	            }
	          }
	        },
	        fill: {
	          opacity: 1
	        
	        },
	        legend: {
	          position: 'bottom',
	          horizontalAlign: 'center',
	          offsetX: 40
	        }
	       };

	        var chart = new ApexCharts(document.querySelector("#chart"), options);
	        chart.render();
		}
	});
	
	</script>
</body>
</html>