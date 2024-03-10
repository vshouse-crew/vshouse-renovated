
import funkin.game.PlayState;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxAxes;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import haxe.Json;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.effects.FlxFlicker;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.text.FlxText.FlxTextAlign;
    
    var images:Array<FlxSprite>;
	var bg:FlxSprite;
var flash = new FlxSprite();
    var arrow1:FlxSprite;
    var arrow2:FlxSprite;
	var Character:FlxSprite;
    var brick:FlxBackdrop;
        var whattochoose:String;
	var fifigej:Bool;
	var canmove:Bool;
	var curSelectedPlayer:String;
	var barrierWarningScreen:FlxSprite;
	var barrierWarningText:FlxText;
    public var currentBarrierImage:Int;
    public var currentBarrier:Int;
    public var barrierShake:Float;

        var curSelectedSkin:String;
        public var currentIndex:Int;
        var imageText:FlxText;
        var kakaText:FlxText;
		var X:FlxAxes = 0x01;
		var Y:FlxAxes = 0x10;
		var XY:FlxAxes = 0x11;
	override function create()
	{



		currentBarrier = 0;
		trace(PlayState.SONG.meta.name);
        fifigej = true;
        canmove = true;
        selectingbf = true;
        FlxG.sound.playMusic(Paths.music('characterselectiontrack'), 0.7);
		FlxG.mouse.visible = false;



		bg = new FlxSprite().loadGraphic(Paths.image('cc/ccbg'));
		add(bg);

		bg2 = new FlxSprite().loadGraphic(Paths.image('cc/ccbgmagneta'));
                bg2.visible = false;
		add(bg2);


               

        brick = new FlxBackdrop(Paths.image('cc/smiesznepaski')); 
        brick.velocity.set(100, 0); 
        brick.updateHitbox(); 
        brick.scrollFactor.set(0, 0); 
        brick.alpha = 1; 
        add(brick);

        var bars = new FlxSprite().loadGraphic(Paths.image('cc/ccblackbar'));
		add(bars);
		bars.screenCenter();

        arrow1 = new FlxSprite().loadGraphic(Paths.image('cc/arrow1'));
		add(arrow1);
		arrow1.screenCenter();

        arrow2 = new FlxSprite().loadGraphic(Paths.image('cc/arrow2'));
        arrow2.visible = false;
		add(arrow2);
		arrow2.screenCenter();

        imageText = new FlxText(0, FlxG.height - 125, FlxG.width, "DEFAULT", 32);
        imageText.setFormat("assets/fonts/zbigniew.ttf", 96, FlxColor.WHITE);
		imageText.alignment = FlxTextAlign.CENTER;
        imageText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.5);
        add(imageText);
        kakaText = new FlxText(0, FlxG.height - 700, FlxG.width, "CURRENTLY SELECTED:", 32);
        kakaText.setFormat("assets/fonts/zbigniew.ttf", 96, FlxColor.WHITE);
		kakaText.alignment = FlxTextAlign.CENTER;
        kakaText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.5);
        add(kakaText);

		iconbf = new FlxSprite().loadGraphic(Paths.image('cc/icons/Boyfriendselected'));
                iconbf.y = 580;
                iconbf.setGraphicSize(Std.int(iconbf.width * 0.8)); 
		add(iconbf);

		icongf = new FlxSprite().loadGraphic(Paths.image('cc/icons/gf'));
                icongf.setGraphicSize(Std.int(icongf.width * 0.8));
                icongf.y = 575;
                icongf.x = 105;
                    icongf.alpha = 0.5;
		add(icongf);


               
		BFMARK = new FlxSprite(90, 620).loadGraphic(Paths.image('cc/SkinSelectorThings'));
		BFMARK.frames = Paths.getSparrowAtlas('cc/SkinSelectorThings');
                BFMARK.setGraphicSize(Std.int(BFMARK.width * 0.4));
		BFMARK.animation.addByPrefix('Question', 'QuestionMark', 24, true);
		BFMARK.animation.addByPrefix('accepted', 'silly', 24, false);
		BFMARK.animation.play('Question');
		BFMARK.updateHitbox();
                add(BFMARK);

		GFMARK = new FlxSprite(90 + 105, 620).loadGraphic(Paths.image('cc/SkinSelectorThings'));
		GFMARK.frames = Paths.getSparrowAtlas('cc/SkinSelectorThings');
                GFMARK.setGraphicSize(Std.int(GFMARK.width * 0.4));
		GFMARK.animation.addByPrefix('Question', 'QuestionMark', 24, true);
		GFMARK.animation.addByPrefix('accepted', 'silly', 24, false);
		GFMARK.animation.play('Question');
		GFMARK.updateHitbox();
                add(GFMARK);

                GFMARK.visible = false;

               

		images = [];
        if (PlayState.SONG.meta.name != 'swatting') {
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/Boyfriend_Assets.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/BFDistrict.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/Boyfriend_Assets_dom.png')));
        }

        if (PlayState.SONG.meta.name == 'swatting')
        {
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/pico.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/DistrictPico.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/picohouse.png')));
        }
        currentIndex = 0;


        add(images[currentIndex]);

        

        for (image in images) {
            image.x = (FlxG.width - image.width) / 2;
            image.y = (FlxG.height - image.height) / 2;
            image.setSize(100, 100);

    }
			flash.makeGraphic(1980, 1020, FlxColor.WHITE);
                        add(flash);
                        flash.alpha = 0;

	}
    public function nextImage():Void {
        remove(images[currentIndex]);

        currentIndex++;
        if (currentIndex >= images.length) {
                        FlxG.sound.play(Paths.sound('error'), 0.9);
                        FlxG.camera.shake(0.005, 0.15);
                        currentIndex = currentIndex - 1;
                        barrierImage();
        }
        add(images[currentIndex]);
    }
    public function previousImage():Void {
        remove(images[currentIndex]);
        currentIndex--;

        if (currentIndex < 0) {
                        FlxG.sound.play(Paths.sound('error'), 0.9);
                        FlxG.camera.shake(0.005, 0.15);
                        currentIndex = currentIndex + 1;
                        barrierImage();
        }
        add(images[currentIndex]);
    }
    public function changestuff():Void {
        if (currentIndex == 0) {
            imageText.text = "DEFAULT";
            arrow2.visible = false;
            } else {
            arrow2.visible = true;
            }
            if (currentIndex == 1) {
                imageText.text = "DISTRICT";
            }
            if (currentIndex == 2) {
                imageText.text = "HOUSE";
                arrow1.visible = false;
                } else {
                arrow1.visible = true;
                }
    }
	override function update(elapsed:Float)
        {
                
			if (PlayState.SONG.meta.name == 'renovation')
				{
					FlxG.switchState(new PlayState());
			}
            currentBarrierImage = FlxG.random.int(0,6);
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
                if(currentBarrierImage == 6)
                FlxG.openURL("https://pastebin.com/raw/M7Dtq9Z6", "_blank");
    
                barrierWarning();
                currentBarrier = 0;
                barrierShake = 0;
            }
                



		

		if (controls.RIGHT_P && fifigej && canmove)
		{
			nextImage();
                        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                        changestuff();
		}
		if (controls.LEFT_P && fifigej && canmove)
		{
                        previousImage();
                        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                        changestuff();
		}
		if (controls.BACK && fifigej)
		{
                FlxG.switchState(new FreeplayState());
                FlxG.sound.music.fadeIn(0.5, 0.7, 0);
                FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.7);
                };


                if (controls.ACCEPT && fifigej && canmove && !selectingbf)
                {

                FlxG.sound.play(Paths.sound('menu/confirm'));
                FlxFlicker.flicker(bg2, 1, 0.09, false);
                flash.alpha = 1;
                GFMARK.visible = true;
                canmove = false;
                FlxG.camera.zoom = 1.2;
                FlxTween.tween(flash, { alpha: 0 }, 1, { ease: FlxEase.cubeOut } );
                FlxTween.tween(FlxG.camera, { zoom: 1 }, 0.5, { ease: FlxEase.cubeOut } );
                selectingbf = false;
       
		GFMARK.animation.play('accepted');
                    
                    icongf.loadGraphic(Paths.image('cc/icons/gf'));
                    iconbf.loadGraphic(Paths.image('cc/icons/Boyfriend'));
                    iconbf.alpha = 0.5;
                    icongf.alpha = 0.5;


                 if (PlayState.SONG.meta.name != 'renovation')
                        {
                             new FlxTimer().start(1, function(tmr:FlxTimer)
                                        {
                                           FlxG.switchState(new PlayState());
                                        });
                        }
                 }


        




                if (controls.ACCEPT && fifigej && canmove && selectingbf)
                {

                FlxG.sound.play(Paths.sound('menu/confirm'));
                FlxFlicker.flicker(bg2, 1, 0.09, false);
                flash.alpha = 1;
GFMARK.visible = true;
canmove = true;
      FlxG.camera.zoom = 1.2;
FlxTween.tween(flash, { alpha: 0 }, 1, { ease: FlxEase.cubeOut } );
FlxTween.tween(FlxG.camera, { zoom: 1 }, 0.5, { ease: FlxEase.cubeOut } );
        selectingbf = false;

		BFMARK.animation.play('accepted');
                    curSelectedPlayer = 'gf';
                    icongf.loadGraphic(Paths.image('cc/icons/gfselected'));
                    iconbf.loadGraphic(Paths.image('cc/icons/Boyfriend'));
                    iconbf.alpha = 0.5;
                    icongf.alpha = 1;
        remove(images[currentIndex]);
images = [];



        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/GF.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/GFDistrict.png')));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/characterSelection/HouseGF.png')));


        add(images[currentIndex]);


        for (image in images) {
            image.x = (FlxG.width - image.width) / 2;
            image.y = (FlxG.height - image.height) / 2;
            image.setGraphicSize(Std.int(image.width * 0.6));

    }
}


        if (PlayState.SONG.meta.name != 'swatting')
        {
        if (currentIndex == 0) {
        }
        if (currentIndex == 1) {
			PlayState.SONG.strumLines[1].characters = ['bfdistrict'];
        }
        if (currentIndex == 2) {
			PlayState.SONG.strumLines[1].characters = ['bfhouse'];
        }
        }
        if (PlayState.SONG.meta.name == 'swatting')
        {
        if (currentIndex == 0) {
        }
        if (currentIndex == 1) {
            PlayState.SONG.strumLines[1].characters = ['picodistrict'];
        }
        if (currentIndex == 2) {
            PlayState.SONG.strumLines[1].characters = ['picohouse'];
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
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
	}

	public function barrierWarning():Void {
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
        
    public function barrierImage():Void {
        currentBarrier = currentBarrier + 1;
        barrierShake = barrierShake + 0.001;
        FlxG.camera.shake(0.005 + barrierShake, 0.15);
    }

    