
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.text.FlxText.FlxTextAlign;

var obrazek1:FlxSprite;
var white:FlxSprite;
var black:FlxSprite;
public static var SexyTween:FlxTween;
public static var SexyTimer:FlxTimer;
var why:FlxText;

function onStartCountdown() {
		black = new FlxSprite(-1000, -600).makeGraphic(FlxG.width * 100, FlxG.height * 100, 0xFF000000);
		add(black);
		camHUD.alpha = 0;
}

function onSongStart() {
black.destroy();
black = new FlxSprite(-600, -600).makeGraphic(FlxG.width * 10, FlxG.height * 10, 0xFF000000);
add(black);
obrazek1 = new FlxSprite(-50, 0).loadGraphic(Paths.image('gallery/fundamentgallery/5'));
obrazek1.setGraphicSize(Std.int(obrazek1.width * 1.5));
obrazek1.alpha = 0;
add(obrazek1);
SexyTween = FlxTween.tween(obrazek1, {alpha: 1},1.5, {
	ease: FlxEase.cubeInOut,
});
SexyTimer = new FlxTimer().start(4.65, function(tmr:FlxTimer) {
	SexyTween = FlxTween.tween(obrazek1, {alpha: 0},1.5, {
		ease: FlxEase.cubeInOut,
		onComplete: function(twn:FlxTween)
			{
				obrazek1.destroy();
			}
	});
});
SexyTimer = new FlxTimer().start(23.77, function(tmr:FlxTimer) {
SexyTween = FlxTween.tween(black, {alpha: 0},3, {
ease: FlxEase.cubeInOut,
onComplete: function(twn:FlxTween)
{
	black.destroy();
}
});
SexyTween = FlxTween.tween(why, {alpha: 0},1.5, {
ease: FlxEase.cubeInOut,
onComplete: function(twn:FlxTween)
	{
		why.destroy();
	}
});
FlxTween.tween(camHUD, {alpha: 1},3, {
ease: FlxEase.cubeInOut,
});
});
}

function onGamePause(e) {
	SexyTimer.active = false;
	SexyTween.active = false;
}

function onSubstateClose(substate) {
	SexyTimer.active = true;
	SexyTween.active = true;
}
function onFocusLost() {
	SexyTimer.active = false;
	SexyTween.active = false;
}

function onFocus() {
	SexyTimer.active = true;
	SexyTween.active = true;
}

function beatHit(curBeat) {
if(curBeat == 16)
	{
		var obrazek2 = new FlxSprite(-50, 0).loadGraphic(Paths.image('gallery/fundamentgallery/4'));
		obrazek2.setGraphicSize(Std.int(obrazek2.width * 1.5));
		obrazek2.alpha = 0;
		add(obrazek2);
		SexyTween = FlxTween.tween(obrazek2, {alpha: 1},1.5, {
			ease: FlxEase.cubeInOut,
		});
		SexyTimer = new FlxTimer().start(4.65, function(tmr:FlxTimer) {
			SexyTween = FlxTween.tween(obrazek2, {alpha: 0},1.5, {
				ease: FlxEase.cubeInOut,
				onComplete: function(twn:FlxTween)
					{
						obrazek2.destroy();
					}
			});
		});

		
	}
	if(curBeat == 32)
		{
			var obrazek3 = new FlxSprite(-50, 0).loadGraphic(Paths.image('gallery/fundamentgallery/3'));
			obrazek3.setGraphicSize(Std.int(obrazek3.width * 1.5));
			obrazek3.alpha = 0;
			add(obrazek3);
			SexyTween = FlxTween.tween(obrazek3, {alpha: 1},1.5, {
				ease: FlxEase.cubeInOut,
			});
			SexyTimer = new FlxTimer().start(4.65, function(tmr:FlxTimer) {
				SexyTween = FlxTween.tween(obrazek3, {alpha: 0},1.5, {
					ease: FlxEase.cubeInOut,
					onComplete: function(twn:FlxTween)
						{
							obrazek3.destroy();
						}
				});
			});

			
		}
		if(curBeat == 48)
			{
				var obrazek4 = new FlxSprite(-50, 0).loadGraphic(Paths.image('gallery/fundamentgallery/1'));
				obrazek4.setGraphicSize(Std.int(obrazek4.width * 1.5));
				obrazek4.alpha = 0;
				add(obrazek4);
				SexyTween = FlxTween.tween(obrazek4, {alpha: 1},1.5, {
					ease: FlxEase.cubeInOut,
				});
				SexyTimer = new FlxTimer().start(3.1, function(tmr:FlxTimer) {
					obrazek4.destroy();
				});

				
			}
			if(curBeat == 56)
				{
					why = new FlxText(-50, 0, FlxG.width, "WHY", 20);
					why.setFormat(Paths.font("vcr.ttf"), 128, FlxColor.WHITE, null, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
					why.alignment = FlxTextAlign.CENTER;
					why.scrollFactor.set();
					why.borderSize = 1.25;
					why.screenCenter();
					add(why);
					white = new FlxSprite(-600, -600).makeGraphic(FlxG.width * 10, FlxG.height * 10, 0xFFFFFFFF);
					add(white);
					SexyTween = FlxTween.tween(white, {alpha: 0},1.5, {
						ease: FlxEase.cubeInOut,
						onComplete: function(twn:FlxTween)
							{
								white.destroy();
							}
					});
	

				}
				if(curBeat == 58)
					{
						why.text = "DID YOU";
		
					}
					if(curBeat == 59)
						{
							why.text = "REPLACE";
			
						}
						if(curBeat == 62)
							{
								why.text = "ME?";
								kaszana = new FlxTextFormat(0xFFFF1100);
								var red = new FlxTextFormatMarkerPair(kaszana, "@");
								why.applyMarkup('@ME?@', [red]);
							}
							if(curBeat == 511)
								{
									SexyTween = FlxTween.tween(dad, {alpha: 0},23.77, {
									});
									SexyTween = FlxTween.tween(iconP2, {alpha: 0},23.77, {
									});
								}
							}