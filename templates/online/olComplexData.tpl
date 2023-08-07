<style>
.charts_style{min-width: 400px; height: 320px; margin: 0 auto;padding:0 12px; padding-bottom:10px; margin:6px 0; border: solid 1px #ABABAB;border-radius: 5px;background: #FAFAFA;}
</style>
<div id="olrole" class="charts_style"></div>
<script>
initCharts(<{$chart.role_max}>, <{$chart.role_avg}>, <{$chart.role_min}>, '角色数', 'olrole');
function initCharts(ol_max, ol_avg, ol_min, tips, id){
	var chart;
	chart = new Highcharts.Chart({
		chart: {
			renderTo: id,
			type: 'spline',
			zoomType: 'x'
		},
		title: {
			text: '在线'+tips,
			x: -20 //center
		},
		xAxis: {
			categories: <{$chart.x}>,
			tickInterval:Math.round(<{$chart.num}>/14)
		},
		yAxis: {
			title: {
				text: '个数'
			},
			plotLines: [{
				value: 0,
				width: 1,
				color: '#808080'
			}],
			min:0
		},
		plotOptions: {
			spline: {
				lineWidth: 1.5,
				states: {
					hover: {
						lineWidth: 1.9
					}
				},
				shadow: false,
				marker: {
					enabled: true,
					radius:2,
					states: {
						hover: {
							enabled: true,
							symbol: 'circle',
							radius: 3,
							lineWidth: 1
						}
					}
				}
			}
		},
		tooltip: {
			shared: true,
            crosshairs: true
		},
		series: [{
			name: '最大'+tips,
			data: ol_max
		}, {
			name: '平均'+tips,
			data: ol_avg
		}, {
			name: '最小'+tips,
			data: ol_min
		}]
	});
}
</script>