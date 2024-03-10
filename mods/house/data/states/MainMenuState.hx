import flixel.util.FlxAxes;

var X:FlxAxes = 0x01;
var Y:FlxAxes = 0x10;
var XY:FlxAxes = 0x11;

function onSelectItem(e) {
    if (e.name == "gallery") {
        FlxG.switchState(new ModState("GalleryChooseState"));
        e.cancel();
    }
    if (e.name == "ost") {
        FlxG.switchState(new ModState("OSTState"));
        e.cancel();
    }
}

function update(elapsed) {
	trace(curSelected);

}
function onChangeItem() {
	menuItems.forEach(function(spr:FlxSprite)
		{
			if (controls.UP_P) 
				{
				if (curSelected <= 0)
                      {
						spr.y = spr.y - (5 * 650);
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
