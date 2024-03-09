import funkin.backend.chart.Chart;
import funkin.backend.utils.NativeAPI;

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
function onSelect(e) {
	
	Options.freeplayLastSong = songs[curSelected].name;
	Options.freeplayLastDifficulty = songs[curSelected].difficulties[curDifficulty];

	PlayState.loadSong(e.song, e.difficulty, e.opponentMode, e.coopMode);
	FlxG.switchState(new ModState("CharacterChooser"));
	e.cancel();
}
