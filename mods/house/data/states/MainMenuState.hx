import flixel.util.FlxAxes;

var X:FlxAxes = 0x01;
var Y:FlxAxes = 0x10;
var XY:FlxAxes = 0x11;

function onSelectItem(e) {
    if (e.name == "gallery") {
        FlxG.switchState(new ModState("GalleryChooseState"));
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
						spr.y = spr.y - (4 * 50);
					  }
					  else
					  {
						spr.y = spr.y + 50;
					  }
				}
			if (controls.DOWN_P) 
				{
					if (curSelected >= 4)
						{
						  spr.y = spr.y + (4 * 50);
						}
						else
						{
						  spr.y = spr.y - 50;
						}
				}
		});
}
