import hxvlc.flixel.FlxVideo;

function create()
{
        new FlxTimer().start(3, function(tmr:FlxTimer)
        {
                humpscare.visible = true;
		humpscare.animation.play('Question');
        });
        new FlxTimer().start(4, function(tmr:FlxTimer)
        {
                FlxG.switchState(new MainMenuState());
        });
        new FlxTimer().start(0, function(tmr:FlxTimer)
        {
                FlxG.sound.play(Paths.sound('house'), 400);
        });
 
	humpscare = new FlxSprite(0, 0).loadGraphic(Paths.image('secret/jumpscare'));
	humpscare.frames = Paths.getSparrowAtlas('secret/jumpscare');
        humpscare.setGraphicSize(Std.int(humpscare.width * 1));
	humpscare.animation.addByPrefix('Question', 'Symbol1', 12, false);
	humpscare.updateHitbox();
        humpscare.screenCenter();
        add(humpscare);
        humpscare.visible = false;
}

// nooo dont look at dis... cring, cring..