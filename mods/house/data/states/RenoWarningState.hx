import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.util.FlxAxes;

    public static var leftState:Bool = false;

    var warnText:FlxText;
    var warningText:FlxText;
    var smolinfo:FlxText;
    var siema:FlxSprite;
    var X:FlxAxes = 0x01;
    var Y:FlxAxes = 0x10;
    var XY:FlxAxes = 0x11;

    function create()
    {
        FlxG.sound.playMusic(Paths.music('renovation'), 0.5);
        renovationcut = true;

        var bg = new FlxSprite().loadGraphic(Paths.image('RenoWarning/renovationwarningbg'));
        bg.setGraphicSize(Std.int(bg.width * 0.7));
        bg.screenCenter(XY);
        add(bg);	

        siema = new FlxSprite();
        siema.frames = Paths.getSparrowAtlas('RenoWarning/renovationwarningtext');
		siema.animation.addByPrefix('co', 'jajco', 24, true);
		siema.animation.play('co');
		siema.updateHitbox();
        siema.setGraphicSize(Std.int(siema.width * 0.7));
        siema.screenCenter(XY);
        add(siema);

    }

    override function update()
    {
            if (controls.ACCEPT) {
                FlxG.switchState(new PlayState());
            }
    }