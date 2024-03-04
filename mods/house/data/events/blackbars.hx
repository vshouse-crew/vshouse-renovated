import funkin.game.PlayState;
import funkin.game.StrumLine;
import funkin.game.NoteGroup;

var UpperBar = new FlxSprite();
var LowerBar = new FlxSprite();
var n = null;

function onEvent(eventEvent) {
	if (eventEvent.event.name == "blackbars")
		{
	var types = switch(eventEvent.event.params[0]){
		case 'On': 
			UpperBar.makeGraphic(1580, 120, FlxColor.BLACK);
			UpperBar.x = -200;
			UpperBar.y = -120;
			UpperBar.cameras = [camHUD];
			LowerBar.makeGraphic(1580, 120, FlxColor.BLACK);
			LowerBar.x = -200;
			LowerBar.y = 720;
			LowerBar.cameras = [camHUD];
			add(UpperBar);
			add(LowerBar);

			FlxTween.tween(UpperBar, {x: -200, y: 0 },eventEvent.event.params[1], {ease: FlxEase.cubeInOut});
			FlxTween.tween(LowerBar, {x: -200, y: 600 },eventEvent.event.params[1], {ease: FlxEase.cubeInOut});
			for(s in strumLines) {
				for(i in 0...4) {
					n = s.members[i];
					FlxTween.tween(n, {y: n.y + 100 },eventEvent.event.params[1], {ease: FlxEase.cubeInOut});
				}
			}

		case 'Off': 
			UpperBarTween = FlxTween.tween(UpperBar, {x: -200, y: -120 },eventEvent.event.params[1],
				{
					ease: FlxEase.cubeInOut
					});
			LowerBarTween =	FlxTween.tween(LowerBar, {x: -200, y: 720 }, eventEvent.event.params[1],
			{
				ease: FlxEase.cubeInOut
			});
			for(s in strumLines) {
				for(i in 0...4) {
					n = s.members[i];
					FlxTween.tween(n, {y: n.y - 100 },eventEvent.event.params[1], {ease: FlxEase.cubeInOut});
				}
			}
	};
}
}
