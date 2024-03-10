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


var images:Array<FlxSprite>;
var logoBl:FlxSprite;
var text:Alphabet;
var fifigej:Bool;
var barrierWarningScreen:FlxSprite;
var barrierWarningText:FlxText;
var currentIndex:Int;
var currentBarrier:Int;
var currentBarrierImage:Int;
var barrierShake:Float;
var imageText:FlxText;
var selectorLeft:Alphabet;
var selectorRight:Alphabet;
var newShaders:Array<BitmapFilter>=[];

function create()
    {
        currentBarrier = 0;
        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/menuBG'));
        fifigej = true;
        
        images = [];
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/concepts/1.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/concepts/2.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/concepts/3.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/concepts/4.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/concepts/5.png')));


	bg.scrollFactor.set();
	add(bg);

    imageText = new FlxText(0, FlxG.height - 70, FlxG.width, "Iconic First House Drawing Made in Gartic Phone by Fr4nk", 32);
    imageText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE);
    imageText.alignment = FlxTextAlign.CENTER;
    imageText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.5);
    add(imageText);

        currentIndex = 0;

        add(images[currentIndex]);

        for (image in images) {
            image.x = (FlxG.width - image.width) / 2;
            image.y = (FlxG.height - image.height) / 2;
            image.setSize(100, 100);
        }


        var offset:Float = 50;
        logoBl = new FlxSprite(110, 50);
		logoBl.updateHitbox();
        add(logoBl);
        var timer:FlxTimer = new FlxTimer().start(0.001, sayHello);

		selectorLeft = new Alphabet(1200, 630, '>', true, false);
        
		add(selectorLeft);
		selectorRight = new Alphabet(11111111, 630, '<', true, false);
		add(selectorRight);
    }

        function sayHello(timer:FlxTimer)
        {
            timer.start(0.3, sayHello1);
            logoBl.loadGraphic(Paths.getPath('images/gallery/ramka1.png'));
        }

        function sayHello1(timer:FlxTimer)
        {
            timer.start(0.3, sayHello);
            logoBl.loadGraphic(Paths.getPath('images/gallery/ramka2.png'));
        }


    function nextImage():Void {
        remove(images[currentIndex]);

        currentIndex++;
        if (currentIndex >= images.length) {
                        currentIndex = currentIndex - 1;
                        FlxG.sound.play(Paths.sound('error'), 0.9);
                        barrierImage();
        }
        add(images[currentIndex]);
    }

    function previousImage():Void {
        remove(images[currentIndex]);
        currentIndex--;

        if (currentIndex < 0) {
                        currentIndex = currentIndex + 1;
                        FlxG.sound.play(Paths.sound('error'), 0.9);
                        barrierImage();
        }
        add(images[currentIndex]);
    }

    function changestuff():Void {
        if (currentIndex == 0) {
        imageText.text = "Iconic First House Drawing Made in Gartic Phone by Fr4nk";
        selectorLeft.x = 1200;
        selectorRight.visible = false;
        } else {
        selectorRight.visible = true;
        }
        
        if (currentIndex == 1) {
        imageText.text = "Renovation House Concept Art by Fr4nk";
        selectorLeft.x = 1025;
        selectorRight.x = 175;
        };
        if (currentIndex == 2) {
            
        imageText.text = "First House Sprites Made by Codding Cat";
        selectorLeft.x = 1025;
        selectorRight.x = 175;
        };
        if (currentIndex == 3) {
        imageText.text = "I dont even know what this shit is";
        selectorLeft.x = 1000;
        selectorRight.x = 200;
        };
        if (currentIndex == 4) {
        imageText.text = "House Phase 1 by Fr4nk";
        selectorLeft.x = 850;
        selectorRight.x = 350;
        };

        if (currentIndex == 4) {
        selectorLeft.visible = false;
        } else {
            selectorLeft.visible = true;
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

        if(controls.ACCEPT && (currentIndex == 0 || currentIndex == 2) && fifigej)
            {
                PlayState.loadSong('fundament', 'normal', false, false);
                FlxG.switchState(new PlayState());
            }
            


		if (controls.BACK && fifigej)
		{
            FlxG.sound.play(Paths.sound('cancelMenu'), 0.4);
            FlxG.switchState(new ModState("GalleryChooseState"));

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
                        barrierWarningText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
                        add(barrierWarningText);
    }
            
function barrierImage():Void {
                    currentBarrier = currentBarrier + 1;
                    barrierShake = barrierShake + 0.001;
                    FlxG.camera.shake(0.005 + barrierShake, 0.15);
    }