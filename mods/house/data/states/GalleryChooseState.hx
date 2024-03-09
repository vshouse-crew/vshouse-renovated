import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxTimer;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
import flixel.tweens.FlxTween;
import flixel.text.FlxText.FlxTextAlign;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextBorderStyle;

var grpTexts:FlxTypedGroup<Alphabet>;
var images:Array<FlxSprite>;
var logoBl:FlxSprite;
var sranie:FlxSprite;
var chuj:FlxSprite;
var fifigej:Bool;
var barrierWarningScreen:FlxSprite;
var barrierWarningText:FlxText;
var currentBarrierImage:Int;
var curSelected = 0;
var curDirectory = 0;
var currentIndex:Int;
var currentBarrier:Int;
var barrierShake:Float;
var selectorLeft:Alphabet;
var selectorRight:Alphabet;

function create()
	{
		currentBarrier = 0;
		fifigej = true;

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/menuBG'));
		bg.scrollFactor.set();
		add(bg);
	
		sranie = new FlxSprite(125).loadGraphic(Paths.image('gallery/concept'));
		sranie.scrollFactor.set();
		// sranie.screenCenter(Y); guwno
		add(sranie);
	
		chuj = new FlxSprite(700).loadGraphic(Paths.image('gallery/memes'));
		chuj.scrollFactor.set();
		// chuj.screenCenter(Y);
		chuj.alpha = 0.7;
		add(chuj);
	
			var offset:Float = 50;
			currentIndex = 0;
	}

function nextImage():Void {
	
			currentIndex++;
			if (currentIndex > 1) {
							currentIndex = currentIndex - 1;
							FlxG.sound.play(Paths.sound('error'), 0.9);
							barrierImage();
			}
	}

function previousImage():Void {
			currentIndex--;
	
			if (currentIndex < 0) {
							currentIndex = currentIndex + 1;
							FlxG.sound.play(Paths.sound('error'), 0.9);
							barrierImage();
			}
	}
	
function changestuff():Void {
			if (currentIndex == 0) {
				sranie.alpha = 1;
				} else {
					sranie.alpha = 0.7;
				}
				if (currentIndex == 1) {
					chuj.alpha = 1;
					} else {
						chuj.alpha = 0.7;
					}
	}

function update()
	{
        currentBarrierImage = FlxG.random.int(0,5);
		if(currentBarrier == 18) {
                        if(currentBarrierImage == 0)
						FlxG.openURL("https://imgur.com/a/nbSTRue", "_blank");
                        if(currentBarrierImage == 1)
		       		 	FlxG.openURL("https://imgur.com/a/wBEMlpG", "_blank");
                        if(currentBarrierImage == 2)
						FlxG.openURL("https://imgur.com/wxdmGqx", "_blank");
						if(currentBarrierImage == 3)
						FlxG.openURL("https://imgur.com/KDiNpmD", "_blank");
                        if(currentBarrierImage == 4)
                        FlxG.openURL("https://imgur.com/DujdwXf", "_blank");
                        if(currentBarrierImage == 5)
                        FlxG.openURL("https://imgur.com/mxy19bp", "_blank");
			barrierWarning();
			currentBarrier = 0;
			barrierShake = 0;
	}

		if (controls.LEFT_P && fifigej)
		{
                        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                        previousImage();
                        changestuff();
                        new FlxTimer().start(5, function(tmr:FlxTimer) {
                            currentBarrier = 0;
						});
		}
		if (controls.RIGHT_P && fifigej)
		{
                        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			nextImage();
                        changestuff();
                        new FlxTimer().start(5, function(tmr:FlxTimer) {
                            currentBarrier = 0;
						});
		}


		if (controls.BACK && fifigej)
		{
				FlxG.sound.music.fadeIn(0.5, 0.7, 0);
				FlxG.switchState(new MainMenuState());
            // new FlxTimer().start(0.5, function(tmr:FlxTimer) {
			// 	FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.7);
            //     FlxG.switchState(new MainMenuState());
            // });
		}

		if (controls.ACCEPT && fifigej)
		{
			if (currentIndex == 0) {
				FlxG.switchState(new ModState("GalleryConceptState"));
			}
			if (currentIndex == 1) {
				FlxG.switchState(new ModState("GalleryMemesState"));
			}
		}

		if ((controls.ACCEPT || controls.BACK) && !fifigej)
			{
				FlxTween.tween(barrierWarningScreen, {alpha: 0}, 1.5, {onComplete: function(twn:FlxTween)
					{
						barrierWarningScreen.destroy;
					}});
					FlxTween.tween(barrierWarningText, {alpha: 0}, 1.5, {onComplete: function(twn:FlxTween)
						{
							barrierWarningText.destroy;
							fifigej = true;
						}});
			}
	}

function barrierWarning():Void {
		fifigej = false;
					barrierWarningScreen = new FlxSprite();
					barrierWarningScreen.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
					barrierWarningScreen.alpha = 0.5;
					add(barrierWarningScreen);
		
					barrierWarningText = new FlxText(FlxG.width/2-100, FlxG.height/2-50, 200, "zesralem sie");
					barrierWarningText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE);
					barrierWarningText.alignment = FlxTextAlign.CENTER;
					add(barrierWarningText);
			}
		
function barrierImage():Void {
				currentBarrier = currentBarrier + 1;
				barrierShake = barrierShake + 0.001;
				FlxG.camera.shake(0.005 + barrierShake, 0.15);
			}