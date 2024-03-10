package;

import editors.ChartingState;
import flash.text.TextField;
import lime.app.Application;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import WeekData;

var songs:Array<SongMetadataG> = [];

var selector:FlxText;
var curSelected:Int = 0;
// curDifficulty:Int = -1;
var lastDifficultyName:String = '';

var scoreBG:FlxSprite;
var scoreText:FlxText;
var diffText:FlxText;
var lerpScore:Int = 0;
var lerpRating:Float = 0;
var intendedScore:Int = 0;
var intendedRating:Float = 0;

var iconP2:HealthIcon;

var grpSongs:FlxTypedGroup<Alphabet>;
var curPlaying:Bool = false;

var bg:FlxSprite;
var intendedColor:Int;
var colorTween:FlxTween;
var disc:FlxSprite;
var bpmspeed:Float = 2;
var disctween:FlxTween;
var icontween:FlxTween;
var abcdefg:FlxSprite;
var discenter:FlxTween;
var iconenter:FlxTween;
var colorenter:FlxTween;

var dad:Character = null;
	
function create()
	{
		Saves.saveShit();
		Application.current.window.title = ("House Music");
		FlxG.autoPause = false;
		if(Saves.renovationLock == 'unlocked'){
			PlayState.isStoryMode = false;
			PlayState.isFreeplay = true;
			}
			else
			{
				PlayState.isStoryMode = true;
				PlayState.isFreeplay = false;
			}
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();
		
		persistentUpdate = true;
		WeekData.reloadWeekFiles(false);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Listening to the OST", null);
		#end		
		for (i in 0...WeekData.weeksList.length) {
			if(weekIsLocked(WeekData.weeksList[i])) continue;

			var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var leSongs:Array<String> = [];
			var leChars:Array<String> = [];

			for (j in 0...leWeek.songs.length)
			{
				leSongs.push(leWeek.songs[j][0] + 'Freaky Menu');
				leChars.push(leWeek.songs[j][1] + 'Freaky Menu');
			}

			WeekData.setDirectoryFromWeek(leWeek);
			for (song in leWeek.songs)
			{
				var colors:Array<Int> = song[2];
				if(colors == null || colors.length < 3)
				{
					colors = [146, 113, 253];
				}
				addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]));
			}
			if(Saves.renovationLock == 'unlocked')
				{
			addSong('Breathe', 0, 'house', -5223862);
			addSong('District', 0, 'house', -5223862);
			addSong('Dispute', 0, 'houseangy', -5223862);
				addSong('Renovation', 0, 'housefury', -5223862);
				addSong('Swatting', 0, 'pico', FlxColor.fromRGB(186, 233, 75));
				addSong('My-lawn', 0, 'house', -5223862);
				}
				if(Saves.multiversusLock == 'unlocked')
					{
					addSong('multiversus', 0, 'jake', FlxColor.fromRGB(219, 162, 53));
					}
			if(Saves.fundamentLock == 'unlocked')
				{
				addSong('Fundament', 0, 'house2d', FlxColor.fromRGB(255, 255, 255));
				}
				if(Saves.fundamentLock == 'unlocked' && Saves.multiversusLock == 'unlocked')
					{
						addSong('House', 0, 'house', -5223862);
					}
		}
		WeekData.loadTheFirstEnabledMod();

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		bg.screenCenter();

		// grpSongs = new FlxTypedGroup<Alphabet>();
		// add(grpSongs);

		for (i in 0...songs.length)
			{
				var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false);
				songText.isMenuItemCenter = false;
				songText.isMenuItem = true;
				songText.targetY = i;
				grpSongs.add(songText);
	
				if (songText.width > 980)
				{
					var textScale:Float = 980 / songText.width;
					songText.scale.x = textScale;
					for (letter in songText.lettersArray)
					{
						letter.x *= textScale;
						letter.offset.x *= textScale;
					}
					//songText.updateHitbox();
					//trace(songs[i].songName + ' new scale: ' + textScale);
				}
	
				Paths.currentModDirectory = songs[i].folder;
	
				// songText.x += 40;
				// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
				// songText.screenCenter(X);
			}
		WeekData.setDirectoryFromWeek();

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);

		add(scoreText);

		if(curSelected >= songs.length) curSelected = 0;
		bg.color = songs[curSelected].color;
		intendedColor = bg.color;

		if(lastDifficultyName == '')
		{
			lastDifficultyName = CoolUtil.defaultDifficulty;
		}
		curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(lastDifficultyName)));
		
		changeSelection();

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		// JUST DOIN THIS SHIT FOR TESTING!!!
		/* 
			var md:String = Markdown.markdownToHtml(Assets.getText('CHANGELOG.md'));

			var texFel:TextField = new TextField();
			texFel.width = FlxG.width;
			texFel.height = FlxG.height;
			// texFel.
			texFel.htmlText = md;

			FlxG.stage.addChild(texFel);

			// scoreText.textField.htmlText = md;

			trace(md);
		 */
		 abcdefg = new FlxSprite(1550, 125).makeGraphic(300, 300);
		 abcdefg.screenCenter(Y);
		 add(abcdefg);
 //850
		 iconP2 = new HealthIcon("house", false);
		 iconP2.x = 1650;
		 iconP2.y = 175;
		 iconP2.screenCenter(Y);
		 iconP2.antialiasing = ClientPrefs.globalAntialiasing;
		 icontween = FlxTween.angle(iconP2, 0, 360, 2, {type: LOOPING});
		 add(iconP2);
//950
		 if(curSelected >= songs.length) curSelected = 0;
		 abcdefg.color = songs[curSelected].color;
		 intendedColor = abcdefg.color;
 

		 disc = new FlxSprite().loadGraphic(Paths.image('disc'));
		 disc.antialiasing = ClientPrefs.globalAntialiasing;
		 disc.screenCenter(Y);
		 disc.x = 1475;
		 disctween = FlxTween.angle(disc, 0, 360, 2, {type: LOOPING});
		 add(disc);	
//775
		var textBG:FlxSprite = new FlxSprite(0, FlxG.height - 26).makeGraphic(FlxG.width, 26, 0xFF000000);
		textBG.alpha = 0.6;
		add(textBG);

		#if PRELOAD_ALL
		var leText:String = "Press SPACE to listen to the Song";
		var size:Int = 16;
		#else
		var leText:String = "Press SPACE to listen to the Song";
		var size:Int = 18;
		#end
		var text:FlxText = new FlxText(textBG.x, textBG.y + 4, FlxG.width, leText, size);
		text.setFormat(Paths.font("vcr.ttf"), size, FlxColor.WHITE, RIGHT);
		text.scrollFactor.set();
		add(text);
		super.create();
	}

function closeSubState() {
		changeSelection(0, false);
		persistentUpdate = true;
		super.closeSubState();
	}

function addSong(songName:String, weekNum:Int, songCharacter:String, color:Int)
	{
		songs.push(new SongMetadataG(songName, weekNum, songCharacter, color));
	}

function weekIsLocked(name:String):Bool {
		var leWeek:WeekData = WeekData.weeksLoaded.get(name);
		return (!leWeek.startUnlocked && leWeek.weekBefore.length > 0 && (!StoryMenuState.weekCompleted.exists(leWeek.weekBefore) || !StoryMenuState.weekCompleted.get(leWeek.weekBefore)));
	}

function beatHit()
	{
		super.beatHit();
		if(curBeat == 338 && PlayState.SONG.song == "my-lawn")
			{
				disctween = FlxTween.angle(disc, 0, 360, 1.17, {type: LOOPING});
			}
			else if(curBeat == 338 && PlayState.SONG.song == null)
				{
					disctween = FlxTween.angle(disc, 0, 360, 2, {type: LOOPING});
				}
                FlxTween.tween(FlxG.camera, {zoom:1.03}, 0.3, {ease: FlxEase.quadOut, type: BACKWARD});
        }


var instPlaying:Int = -1;
var holdTime:Float = 0;

function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 24, 0, 1)));
		lerpRating = FlxMath.lerp(lerpRating, intendedRating, CoolUtil.boundTo(elapsed * 12, 0, 1));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		if (Math.abs(lerpRating - intendedRating) <= 0.01)
			lerpRating = intendedRating;

		var ratingSplit:Array<String> = Std.string(Highscore.floorDecimal(lerpRating * 100, 2)).split('.');
		if(ratingSplit.length < 2) { //No decimals, add an empty space
			ratingSplit.push('');
		}
		
		while(ratingSplit[1].length < 2) { //Less than 2 decimals in it, add decimals then
			ratingSplit[1] += '0';
		}

                if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;
		var ctrl = FlxG.keys.justPressed.CONTROL;

		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if(songs.length > 1)
		{
			if (upP)
			{
				changeSelection(-shiftMult);
				holdTime = 0;
			}
			if (downP)
			{
				changeSelection(shiftMult);
				holdTime = 0;
			}

			if(controls.UI_DOWN || controls.UI_UP)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
				}
			}

			if(FlxG.mouse.wheel != 0)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.2);
				changeSelection(-shiftMult * FlxG.mouse.wheel, false);
			}
		}

		if (controls.BACK)
		{
			persistentUpdate = false;
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
			Application.current.window.title = ("Friday Night Funkin': Vs House");
		}
		else if(accepted)
		{
			if(instPlaying != curSelected)
			{
				#if PRELOAD_ALL
				colorTween = FlxTween.color(abcdefg, 0.5, abcdefg.color, intendedColor, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});
				destroyFreeplayVocals();
				FlxG.sound.music.volume = 0;
				Paths.currentModDirectory = songs[curSelected].folder;
				var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), curDifficulty);
				PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
				if (PlayState.SONG.needsVoices)
					FreeplayState.vocals = new FlxSound().loadEmbedded(Paths.voices(PlayState.SONG.song));
				else
					FreeplayState.vocals = new FlxSound();

				FlxG.sound.list.add(FreeplayState.vocals);
				FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), 0.7);
                                Conductor.changeBPM(PlayState.SONG.bpm);
				FreeplayState.vocals.play();
				FreeplayState.vocals.persist = true;
				FreeplayState.vocals.looped = true;
				FreeplayState.vocals.volume = 0.7;
				instPlaying = curSelected;
				abcdefg.x = 1550;
				iconP2.x = 1650;
				disc.x = 1475;
				discenter = FlxTween.tween(disc,{ x: 775}, 1, {ease: FlxEase.quadInOut});
				colorenter = FlxTween.tween(abcdefg,{ x: 850}, 1, {ease: FlxEase.quadInOut});
				iconenter = FlxTween.tween(iconP2,{ x: 950}, 1, {ease: FlxEase.quadInOut});
				if(PlayState.SONG.song == 'renovation')
					{
						disctween = FlxTween.angle(disc, 0, 360, 0.60, {type: LOOPING});
						icontween = FlxTween.angle(iconP2, 0, 360, 0.60, {type: LOOPING});
						iconP2.changeIcon("housefury");
						DiscordClient.changePresence("Listening to the OST", "Listening to Renovation");
					}
					else if(PlayState.SONG.song == 'breathe')
					{
						disctween = FlxTween.angle(disc, 0, 360, 1.84, {type: LOOPING});
						icontween = FlxTween.angle(iconP2, 0, 360, 1.84, {type: LOOPING});
						iconP2.changeIcon("house");
						DiscordClient.changePresence("Listening to the OST", "Listening to Breathe");
					}
					else if(PlayState.SONG.song == 'Blueprint')
					{
						disctween = FlxTween.angle(disc, 0, 360, 2.40, {type: LOOPING});
						icontween = FlxTween.angle(iconP2, 0, 360, 2.40, {type: LOOPING});
						iconP2.changeIcon("house");
						DiscordClient.changePresence("Listening to the OST", "Listening to Blueprint");
					}
					else if(PlayState.SONG.song == 'district')
					{
						disctween = FlxTween.angle(disc, 0, 360, 1.30, {type: LOOPING});
						icontween = FlxTween.angle(iconP2, 0, 360, 1.30, {type: LOOPING});
						iconP2.changeIcon("house");
						DiscordClient.changePresence("Listening to the OST", "Listening to District");
					}
					else if(PlayState.SONG.song == 'dispute')
					{
						disctween = FlxTween.angle(disc, 0, 360, 1.23, {type: LOOPING});
						icontween = FlxTween.angle(iconP2, 0, 360, 1.23, {type: LOOPING});
						iconP2.changeIcon("houseangy");
						DiscordClient.changePresence("Listening to the OST", "Listening to Dispute");
					}
					else if(PlayState.SONG.song == 'multiversus')
					{
						disctween = FlxTween.angle(disc, 0, 360, 1.50, {type: LOOPING});
						icontween = FlxTween.angle(iconP2, 0, 360, 1.5, {type: LOOPING});
						iconP2.changeIcon("jake");
						DiscordClient.changePresence("Listening to the OST", "Listening to Multiversus");
					}
					else if(PlayState.SONG.song == 'my-lawn')
					{
						disctween = FlxTween.angle(disc, 0, 360, 1.30, {type: LOOPING});
						icontween = FlxTween.angle(iconP2, 0, 360, 1.30, {type: LOOPING});
						iconP2.changeIcon("house");
						DiscordClient.changePresence("Listening to the OST", "Listening to My Lawn");
					}
					else if(PlayState.SONG.song == 'swatting')
						{
							disctween = FlxTween.angle(disc, 0, 360, 1.45, {type: LOOPING});
							icontween = FlxTween.angle(iconP2, 0, 360, 1.45, {type: LOOPING});
							iconP2.changeIcon("pico");
							DiscordClient.changePresence("Listening to the OST", "Listening to Swatting");
						}
						else if(PlayState.SONG.song == 'fundament')
							{
								disctween = FlxTween.angle(disc, 0, 360, 1.54, {type: LOOPING});
								icontween = FlxTween.angle(iconP2, 0, 360, 1.54, {type: LOOPING});
								iconP2.changeIcon("house2d");
								DiscordClient.changePresence("Listening to the OST", "Listening to Fundament");
							}
					else
					{
						disctween = FlxTween.angle(disc, 0, 360, 2, {type: LOOPING});
						icontween = FlxTween.angle(iconP2, 0, 360, 2, {type: LOOPING});
						iconP2.changeIcon("house");
						DiscordClient.changePresence("Listening to the OST", "Listening to");
					}
				#end
			}
		}

		super.update(elapsed);
	}

function destroyFreeplayVocals() {
		if(FreeplayState.vocals != null) {
			FreeplayState.vocals.stop();
			FreeplayState.vocals.destroy();
		}
		FreeplayState.vocals = null;
	}

function changeSelection(change:Int = 0, playSound:Bool = true)
	{
		if(playSound) FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;
			
		var newColor:Int = songs[curSelected].color;
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}
		

		// selector.y = (70 * curSelected) + 30;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		var bullShit:Int = 0;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
		
		Paths.currentModDirectory = songs[curSelected].folder;
		PlayState.storyWeek = songs[curSelected].week;

		CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();
		var diffStr:String = WeekData.getCurrentWeek().difficulties;
		if(diffStr != null) diffStr = diffStr.trim(); //Fuck you HTML5

		if(diffStr != null && diffStr.length > 0)
		{
			var diffs:Array<String> = diffStr.split(',');
			var i:Int = diffs.length - 1;
			while (i > 0)
			{
				if(diffs[i] != null)
				{
					diffs[i] = diffs[i].trim();
					if(diffs[i].length < 1) diffs.remove(diffs[i]);
				}
				--i;
			}

			if(diffs.length > 0 && diffs[0].length > 0)
			{
				CoolUtil.difficulties = diffs;
			}
		}
		
		if(CoolUtil.difficulties.contains(CoolUtil.defaultDifficulty))
		{
			curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(CoolUtil.defaultDifficulty)));
		}
		else
		{
			curDifficulty = 0;
		}

var newPos:Int = CoolUtil.difficulties.indexOf(lastDifficultyName);
		//trace('Pos of ' + lastDifficultyName + ' is ' + newPos);
		if(newPos > -1)
		{
			curDifficulty = newPos;
		}
	}

function positionHighscore() {
		scoreText.x = FlxG.width - scoreText.width - 6;

		scoreBG.scale.x = FlxG.width - scoreText.x + 6;
		scoreBG.x = FlxG.width - (scoreBG.scale.x / 2);
	}


class SongMetadataG
{
	var songName:String = "";
	var week:Int = 0;
	var songCharacter:String = "";
	var color:Int = -7179779;
	var folder:String = "";

function new(song:String, week:Int, songCharacter:String, color:Int)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
		this.color = color;
		this.folder = Paths.currentModDirectory;
		if(this.folder == null) this.folder = '';
	}
}