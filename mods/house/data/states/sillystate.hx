import hxvlc.flixel.FlxVideo;



function create()
{
                             new FlxTimer().start(2, function(tmr:FlxTimer)
                                        {
                                           BFMARK.visible = true;
		BFMARK.animation.play('Question');
                                        });
                             new FlxTimer().start(2.6, function(tmr:FlxTimer)
                                        {
                                        FlxG.switchState(new FreeplayState());
                                        });
                             new FlxTimer().start(1, function(tmr:FlxTimer)
                                        {
                FlxG.sound.play(Paths.sound('house'), 400);
                                        });
 
		BFMARK = new FlxSprite(0, 0).loadGraphic(Paths.image('.temp/jumpscare'));
		BFMARK.frames = Paths.getSparrowAtlas('.temp/jumpscare');
                BFMARK.setGraphicSize(Std.int(BFMARK.width * 1));
		BFMARK.animation.addByPrefix('Question', 'Symbol1', 24, false);
		BFMARK.updateHitbox();
                BFMARK.screenCenter();
                add(BFMARK);
BFMARK.visible = false;
}

function endSong()
{

}