import funkin.game.PlayState;
import funkin.game.StrumLine;
import funkin.game.NoteGroup;

var IsFighting = false;
var beater = 0;
var checkifclicked = false;
var dodged = false;


function create()
{
	icon = new FlxSprite(1920/4 + 50, 1000).loadGraphic(Paths.image('mechanic/Shift'));
	icon.cameras = [camHUD];
	icon.angle = 180;
	add(icon);

	eyey = new FlxSprite(0, 0).loadGraphic(Paths.image('mechanic/EyeBloody'));
	eyey.cameras = [camHUD];
	add(eyey);
        eyey.alpha = 0;
}


function onEvent(eventEvent) {
	if (eventEvent.event.name == "smieszne") {
        eyey.alpha = 0;
        FlxG.sound.play(Paths.sound('renovation/warning'));
        icon.alpha = 1; 
        beater = 0;
        icon.y = 1000;
        if(downscroll)
                {
                        icon.y = -1000;
                }
        icon.color = 0xFFFFFFFF;
        icon.angle = 180;
        dodged = false;
        checkifclicked = false;
        isFighting = true;
        eyey.alpha = 0;
      	var tween7 = FlxTween.tween(eyey, { alpha: 0.5 }, 0.1, {
		ease: FlxEase.cubeOut,
	});
      	var tween5 = FlxTween.tween(icon, { y: 560/2 , angle: 0}, 0.2, {
		ease: FlxEase.cubeOut,
	});
        }
}
function beatHit(curBeat) {
        if (isFighting == true) {
        beater = beater + 1;

        icon.scale.set(1, 1);
	var tween5 = FlxTween.tween(icon, { "scale.x": 1.2 ,"scale.y": 1.2 }, 0.2, {
		ease: FlxEase.cubeOut,
	});

        if (beater == 1) {
        FlxG.sound.play(Paths.sound('renovation/warning'));
        dodged = false;
        checkifclicked = true;
        }

        if (beater == 2) {
        FlxG.sound.play(Paths.sound('renovation/throw'));
        }

        if (beater == 3) {
        checkifclicked = false;
        if (dodged) {
        var tweener = FlxTween.color(icon, 0.1, 0xFFFFFFFF, FlxColor.fromRGB(127,255,0) , {
		ease: FlxEase.cubeOut,
	});
        FlxG.sound.play(Paths.sound('renovation/dodged'));
        }
        if (!dodged) {

        health = health - 0.7;
        var tween3 = FlxTween.shake(icon, 0.05, 0.3, FlxAxes.XY, {
		ease: FlxEase.cubeOut,
	});

        icon.scale.set(1, 1);
	var tween5t = FlxTween.tween(icon, { "scale.x": 1.7 ,"scale.y": 1.7 }, 0.2, {
		ease: FlxEase.cubeOut,
	});
        var tweenere = FlxTween.color(icon, 0.2, 0xFFFFFFFF, 0xFFFF0000, {
		ease: FlxEase.cubeOut,
	});
        FlxG.sound.play(Paths.sound('renovation/brick'));
        }
        }

        if (beater == 4) {
      	var tween7 = FlxTween.tween(eyey, { alpha: 0 }, 0.4, {
		ease: FlxEase.cubeOut,
	});
	var tween6 = FlxTween.tween(icon, { alpha: 0}, 0.5, {
		ease: FlxEase.cubeOut,
	});
        isFighting = false;
        beater = 0;
        }

        

        if (isFighting) {
        eyey.alpha = 0;
      	var tween7 = FlxTween.tween(eyey, { alpha: 0.5 }, 0.2, {
		ease: FlxEase.cubeOut,
	});
        }
       
    }
}

function update() {
if (checkifclicked) {
if (FlxG.keys.justPressed.SPACE) {
dodged = true;
}
}
}