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
var barrierShake:Float;
var currentBarrierImage:Int;
var imageText:FlxText;
var selectorLeft:Alphabet;
var selectorRight:Alphabet;

function create()
    {
        currentBarrier = 0;
        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/menuBG'));
        bg.scrollFactor.set();
        add(bg);
        fifigej = true;

        images = [];
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/1.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/2.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/3.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/4.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/5.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/6.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/7.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/8.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/9.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/10.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/11.png')));

        imageText = new FlxText(0, FlxG.height - 70, FlxG.width, "thats so screwed man", 32);
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

		selectorLeft = new Alphabet(950, 630, '>', true, false);
		add(selectorLeft);
		selectorRight = new Alphabet(250, 630, '<', true, false);
		add(selectorRight);

        selectorRight.visible = false;
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
        imageText.text = "thats so screwed man";
        selectorRight.visible = false;
        } else {
        selectorRight.visible = true;
        }
        
        if (currentIndex == 1) {
        imageText.text = "multiversus reference???";
        }
        if (currentIndex == 2) {
            imageText.text = "sdfcgvhbjnhgvf";
        }
        if (currentIndex == 3) {
        imageText.text = "dad battle erect remix leak";
        }
        if (currentIndex == 4) {
        imageText.text = "hmmm???";
        }
        if (currentIndex == 5) {
        imageText.text = "hii haiii hiiowo hiii";
        }
        if (currentIndex == 6) {
        imageText.text = "angy hose";
        }
        if (currentIndex == 7) {
        imageText.text = "yeah yeah go pico";
        }
        if (currentIndex == 8) {
        imageText.text = "ugh";
        }
        if (currentIndex == 9) {
        imageText.text = "casa de amongus";
        }
        if (currentIndex == 10) {
        imageText.text = "huh";


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

        if(controls.ACCEPT && currentIndex == 1 && fifigej)
            {
                PlayState.loadSong('multiversus', 'normal', false, false);
                FlxG.switchState(new PlayState());
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
        
        barrierWarningText = new FlxText(0, 0, FlxG.width, "Do NOT ever do that again.\n\nPress ENTER to dismiss", 32);
        barrierWarningText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE);
        barrierWarningText.alignment = FlxTextAlign.CENTER;
        barrierWarningText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
        barrierWarningText.screenCenter(Y);
        add(barrierWarningText);
    }
            
function barrierImage():Void {
                    currentBarrier = currentBarrier + 1;
                    barrierShake = barrierShake + 0.001;
                    FlxG.camera.shake(0.005 + barrierShake, 0.15);
    }