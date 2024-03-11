	
import flixel.util.FlxAxes;

var X:FlxAxes = 0x01;
var Y:FlxAxes = 0x10;
var XY:FlxAxes = 0x11;

function onSelectItem(e) {
    if (e.name == "gallery") {
        FlxG.switchState(new ModState("GalleryChooseState"));
		FlxG.sound.playMusic(Paths.music('gallerySong'), 0.7);
        e.cancel();
    }
    if (e.name == "ost") {
        FlxG.switchState(new ModState("OSTState"));
        e.cancel();
    }
}

function update(elapsed) {
if (FlxG.keys.justPressed.F10) 
		{
             FlxG.switchState(new ModState("SecretState"));
                 FlxG.sound.music.volume = 0;
                }
// nooo dont look at dis... cring, cring..

}
function onChangeItem() {
	menuItems.forEach(function(spr:FlxSprite)
		{
			if (controls.UP_P) 
				{
				if (curSelected <= 0)
                      {
						spr.y = spr.y - (5 * 60);
					  }
					  else
					  {
						spr.y = spr.y + 60;
					  }
				}
			if (controls.DOWN_P) 
				{
					if (curSelected >= 5)
						{
						  spr.y = spr.y + (5 * 60);
						}
						else
						{
						  spr.y = spr.y - 60;
						}
				}
		});
}