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

	if(FlxG.save.data.multiversusLock == 'unlocked')
		{
	songs.push(Chart.loadChartMeta('multiversus', "normal"));
		}

	if(FlxG.save.data.fundamentLock == 'unlocked')
		{
	songs.push(Chart.loadChartMeta('fundament', "normal"));
		}
	
	if(FlxG.save.data.renovationLock == 'unlocked' && FlxG.save.data.multiversusLock == 'unlocked' && FlxG.save.data.fundamentLock == 'unlocked')
		{
			songs.push(Chart.loadChartMeta('house', "normal"));
		}

		
}

function postCreate(){
	diffText.visible = false;
	coopText.y = coopText.y - 29;
	coopText.alpha = 0;
	scoreBG.y = scoreBG.y - 25;
}

function onChangeCoopMode(e){
	e.cancel();
}

function onSelect(e) {
	
	Options.freeplayLastSong = songs[curSelected].name;
	Options.freeplayLastDifficulty = songs[curSelected].difficulties[curDifficulty];

	PlayState.loadSong(e.song, e.difficulty, e.opponentMode, e.coopMode);
	trace(PlayState.SONG.meta.name);
	if (PlayState.SONG.meta.name == 'renovation' || PlayState.SONG.meta.name == 'multiversus' || PlayState.SONG.meta.name == 'fundament' || PlayState.SONG.meta.name == 'house')
		{
			FlxG.switchState(new PlayState());
	}
	else
	{
		FlxG.switchState(new ModState("customs/CharacterChooser"));
	}
	e.cancel();
}
