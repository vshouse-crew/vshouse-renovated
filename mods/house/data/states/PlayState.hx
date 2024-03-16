import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;

public static var lockedIn:Bool;

/*
Used for the camera move script
*/

public static var renovationcut:Bool = false;

/*
Used for the camera move script
*/

var kaszana:FlxTextFormat;

/*
Used for renovation text change
*/


function create()
    {
        lockedIn = false;
		trace(PlayState.isStoryMode);
		trace(renovationcut);
    }

	function update(elapsed)
		{
			if(curSong == 'renovation' && !renovationcut && PlayState.isStoryMode) FlxG.switchState(new ModState("customs/RenoWarningState"));
			if(inCutscene)
				{
					renovationcut = false;
				}
			if(curSong == 'renovation' && misses < 3)
				{
					kaszana = new FlxTextFormat(0xFF3CFF00);
					var green = new FlxTextFormatMarkerPair(kaszana, "@");
					missesTxt.applyMarkup('@' + missesTxt.text + '@', [green]);
				}
	else if(curSong == 'renovation' && misses < 6)
		{
			kaszana = new FlxTextFormat(0xFFC8FF00);
			var green = new FlxTextFormatMarkerPair(kaszana, "@");
			missesTxt.applyMarkup('@' + missesTxt.text + '@', [green]);
		}
		else if(curSong == 'renovation' && misses < 9)
			{
				kaszana = new FlxTextFormat(0xFFFFD000);
				var green = new FlxTextFormatMarkerPair(kaszana, "@");
				missesTxt.applyMarkup('@' + missesTxt.text + '@', [green]);
			}
			else if(curSong == 'renovation' && misses < 12)
				{
					kaszana = new FlxTextFormat(0xFFFF5E00);
					var green = new FlxTextFormatMarkerPair(kaszana, "@");
					missesTxt.applyMarkup('@' + missesTxt.text + '@', [green]);
				}
				else if(curSong == 'renovation' && misses == 14)
					{
						kaszana = new FlxTextFormat(0xFF9B0000);
						var green = new FlxTextFormatMarkerPair(kaszana, "@");
						missesTxt.applyMarkup('@' + missesTxt.text + '@', [green]);
					}
					else if(curSong == 'renovation' && misses > 14)
						{
							gameOver();
						}
		}
