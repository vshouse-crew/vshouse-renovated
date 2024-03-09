import funkin.backend.chart.Chart;

function create() {
	trace(FlxG.save.data.renovationLock);
	trace(FlxG.save.data.multiversusLock);
	trace(FlxG.save.data.fundamentLock);
	if(FlxG.save.data.renovationLock == 'unlocked')
		{
	songs.push(Chart.loadChartMeta('renovation', "normal"));
	songs.push(Chart.loadChartMeta('swatting', "normal"));
	songs.push(Chart.loadChartMeta('my lawn', "normal"));
		}
}
