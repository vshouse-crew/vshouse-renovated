import funkin.game.PlayState;
import funkin.game.StrumLine;
import funkin.game.NoteGroup;

var IsFighting:Bool;
var beater:Int;
var checkifclicked:Bool;
var dodged:Bool;


function create()
{
        IsFighting = false;
        beater = 0;
        checkifclicked = false;
        dodged = false;
	icon = new FlxSprite(1920/4 + 50, 1000).loadGraphic(Paths.image('mechanic/Shift'));
	icon.cameras = [camHUD];
	icon.angle = 180;
	add(icon);

	eyey = new FlxSprite(0, 0).loadGraphic(Paths.image('mechanic/EyeBloody'));
	eyey.cameras = [camHUD];
	add(eyey);
        eyey.alpha = 0;
}
function onPostCountdown(c) {
        changeCharacter("dad", "housethrow");
        dad.playAnim("Pick");
        dad.playAnim("Swing");
        dad.playAnim("Throw");
        changeCharacter("dad", "houserunning");
  }


function onEvent(eventEvent) {
	if (eventEvent.event.name == "smieszne") {
                lockedIn = true;
                changeCharacter("dad", "housethrow");
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
        if (isFighting) 
                {
        beater = beater + 1;

        icon.scale.set(1, 1);
	var tween5 = FlxTween.tween(icon, { "scale.x": 1.2 ,"scale.y": 1.2 }, 0.2, {
		ease: FlxEase.cubeOut,
	});
        if (beater == 0) {
                dad.playAnim("Pick");
        }
        if (beater == 1) {
                dad.playAnim("Swing");
        FlxG.sound.play(Paths.sound('renovation/warning'));
        dodged = false;
        checkifclicked = true;
        }

        if (beater == 2) {
                dad.playAnim("Throw");
        FlxG.sound.play(Paths.sound('renovation/throw'));
        }

        if (beater == 3) {
        lockedIn = false;
        checkifclicked = false;
        if (dodged) {
                changeCharacter("dad", "houserunning");
        var tweener = FlxTween.color(icon, 0.1, 0xFFFFFFFF, FlxColor.fromRGB(127,255,0) , {
		ease: FlxEase.cubeOut,
	});
        FlxG.sound.play(Paths.sound('renovation/dodged'));
        }
        if (!dodged) {

                changeCharacter("dad", "houserunning");
        health = health - 0.7;
        var tween3 = FlxTween.shake(icon, 0.05, 0.3, FlxAxes.XY, {
		ease: FlxEase.cubeIn,
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
function changeCharacter(oldchar, newchar)
        {
                var thechar:Character = null;
                switch (oldchar)
                {
                        case "bf":
                                thechar = boyfriend;
                                state.remove(boyfriend);
                                boyfriend = null;
                                boyfriend = new Character(thechar.x, thechar.y, newchar, thechar.isPlayer, true);
                                state.add(boyfriend);
        
                        case "dad":
                                thechar = dad;
                                state.remove(dad);
                                dad = null;
                                dad = new Character(thechar.x, thechar.y, newchar, thechar.isPlayer, true);
                                state.add(dad);
        
                }
                var leftColor:Int = dad.iconColor != null && Options.colorHealthBar ? dad.iconColor : 0xFFFF0000;
                var rightColor:Int = boyfriend.iconColor != null && Options.colorHealthBar ? boyfriend.iconColor : 0xFF66FF33;
                var colors = [leftColor, rightColor];
                healthBar.createFilledBar((state.opponentMode ? colors[1] : colors[0]), (state.opponentMode ? colors[0] : colors[1]));
                healthBar.updateBar();
        }