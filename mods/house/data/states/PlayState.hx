import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;

public static var lockedIn:Bool;

/*
Used for the camera move script
*/

public static var bfCharacter:String;

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
		trace(PlayState.SONG.strumLines);
    }
function countdown() {
	if(bfCharacter != null)
		{
	changeCharacter('bf', bfCharacter);
	boyfriend.playAnim("singUP");
	boyfriend.playAnim("singDOWN");
	boyfriend.playAnim("singRIGHT");
	boyfriend.playAnim("singLEFT");
	boyfriend.playAnim("singUPmiss");
	boyfriend.playAnim("singDOWNmiss");
	boyfriend.playAnim("singRIGHTmiss");
	boyfriend.playAnim("singLEFTmiss");
	boyfriend.playAnim("scared");
	boyfriend.playAnim("hey");
	boyfriend.playAnim("idle");
		}
}
	
	function update(elapsed)
		{
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
	function onSongEnd() {
		if(curSong == 'district')
			{
				FlxG.save.data.renovationLock = 'unlocked';
				FlxG.save.flush();
			}
			if(curSong == 'fundament')
				{
					FlxG.save.data.fundamentLock = 'unlocked';
					FlxG.save.flush();
				}
				if(curSong == 'multiversus')
					{
						FlxG.save.data.multiversusLock = 'unlocked';
						FlxG.save.flush();
					}
					
		}
	function changeCharacter(oldchar, newchar)
		{
					var thechar:Character = null;
					switch (oldchar)
					{
							case "bf":
									thechar = boyfriend;
									state.remove(boyfriend);
									boyfriend = null;
									boyfriend = new Character(thechar.x, thechar.y, newchar, thechar.isPlayer, true);
									state.add(boyfriend);
			
							case "dad":
									thechar = dad;
									state.remove(dad);
									dad = null;
									dad = new Character(thechar.x, thechar.y, newchar, thechar.isPlayer, true);
									state.add(dad);
			
					}
					var leftColor:Int = dad.iconColor != null && Options.colorHealthBar ? dad.iconColor : 0xFFFF0000;
					var rightColor:Int = boyfriend.iconColor != null && Options.colorHealthBar ? boyfriend.iconColor : 0xFF66FF33;
					var colors = [leftColor, rightColor];
					healthBar.createFilledBar((state.opponentMode ? colors[1] : colors[0]), (state.opponentMode ? colors[0] : colors[1]));
					healthBar.updateBar();
			}
