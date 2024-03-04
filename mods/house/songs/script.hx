import flixel.text.FlxText;
import flixel.util.FlxColor;
import funkin.backend.FunkinText;

var bgThing:FlxSprite;
var icon:FlxSprite;
var funnitext:FunkinText;
var funnitext2:FunkinText;
var funnitext3:FunkinText;
var curArtist;

function create() {
	trace("testing");
	curArtist = 'Made By Alien 86';
	if(curSong == 'district') curArtist = 'Made By Kolze';
	if(curSong == 'breathe') curArtist = 'Made By Fr4nk';
	if(curSong == 'renovation') curArtist = 'Made By Bonky';
	if(curSong == 'fundament') curArtist = 'Made By Fr4nk & Alien 86';
	if(curSong == 'house') curArtist = 'Made By Top 10 Awesome';
	bgThing = new FlxSprite(-1050, 100).loadGraphic(Paths.image('watermark/blackscreen'));
	bgThing.alpha = 0.4;
	bgThing.scale.set(1, 0.2);
	bgThing.cameras = [camHUD];
	add(bgThing);

	icon = new FlxSprite(-750, 300).loadGraphic(Paths.image('watermark/icons/house'));
	icon.cameras = [camHUD];
	add(icon);
	
	funnitext = new FunkinText(-1050, 385, 0, "Now Playing..", 25, true);
	funnitext.cameras = [camHUD];
	add(funnitext);

	funnitext2 = new FunkinText(-1050, 345, 0, curSong, 45, true);
	funnitext2.cameras = [camHUD];
	add(funnitext2);

	funnitext3 = new FunkinText(-1050, 320, 0, curArtist, 20, true);
	funnitext3.cameras = [camHUD];
	add(funnitext3);
}
function onCountdown() {
var tween = FlxTween.tween(bgThing, {x: -500}, 1, {
		ease: FlxEase.cubeOut,
	});
var tween2 = FlxTween.tween(icon, {x: 320}, 1, {
		ease: FlxEase.cubeOut,
	});
	var tween3 = FlxTween.tween(funnitext, {x: 50}, 1, {
		ease: FlxEase.cubeOut,
	});
	var tween4 = FlxTween.tween(funnitext2, {x: 100}, 1, {
		ease: FlxEase.cubeOut,
	});
	var tween5 = FlxTween.tween(funnitext3, {x: 25}, 1, {
		ease: FlxEase.cubeOut,
	});
}
function stepHit(curStep) {
if (curStep == 25)
	{
		var tween = FlxTween.tween(bgThing, {x: -1050}, 1, {
			ease: FlxEase.cubeOut,
		});
		var tween2 = FlxTween.tween(icon, {x: -750}, 1, {
			ease: FlxEase.cubeOut,
		});
		var tween3 = FlxTween.tween(funnitext, {x: -1050}, 1, {
			ease: FlxEase.cubeOut,
		});
		var tween4 = FlxTween.tween(funnitext2, {x: -1050}, 1, {
			ease: FlxEase.cubeOut,
		});
		var tween5 = FlxTween.tween(funnitext3, {x: -1050}, 1, {
			ease: FlxEase.cubeOut,
		});
	}
}