var bgDark = new FlxSprite();
var coolAnim:Bool;

function postCreate()
    {
var tweencolor = FlxTween.color(dad, 0.01, FlxColor.fromRGB(255, 255, 255), FlxColor.fromRGB(0, 0, 0), {
    ease: FlxEase.cubeOut,
});
var tweencolor2 = FlxTween.color(boyfriend, 0.01, FlxColor.fromRGB(255, 255, 255), FlxColor.fromRGB(0, 0, 0), {
    ease: FlxEase.cubeOut,
});
    }

function create()
    {
        coolAnim = false;
        bgDark.makeGraphic(1920, 1080, FlxColor.BLACK);
        bgDark.alpha = 0.4;
        bgDark.cameras = [camHUD];
        add(bgDark);
    }
    function stepHit(curStep) {
        if(curStep == 240)
            {
        var tweenalpha1 = FlxTween.tween(bgDark, { alpha: 1 }, 1.3, {
            ease: FlxEase.cubicOut,
        });
            }
            if(curStep == 256)
                {
                    coolAnim = true;
                    bgDark.alpha = 0.1;
                    var tweencolor = FlxTween.color(dad, 0.01, FlxColor.fromRGB(0, 0, 0), FlxColor.fromRGB(255, 255, 255), {
                        ease: FlxEase.cubicOut,
                    });
                    var tweencolor2 = FlxTween.color(boyfriend, 0.01, FlxColor.fromRGB(0, 0, 0), FlxColor.fromRGB(255, 255, 255), {
                        ease: FlxEase.cubicOut,
                    });
                }
                if(curStep == 496)
                    {
                        coolAnim = false;
                        camFollow.x = 650;
                        camFollow.y = 500;
                        defaultCamZoom = 0.65;
                        var tweenangle2 = FlxTween.tween(camGame, {angle: 0}, 1, {
                            ease: FlxEase.cubicOut,
                        });
                    }
    }
    function onCameraMove(e) {
    if(coolAnim)
        {
            if(target2 == 1)
                {
                    var tweenangle22 = FlxTween.tween(camGame, {angle: 3}, 1, {
                        ease: FlxEase.cubicOut,
                    });
                    defaultCamZoom = 1;
                    e.position.x = 900;
                    e.position.y = 560;
                }
             else
                {
                    var tweenangle111 = FlxTween.tween(camGame, {angle: -3}, 1, {
                        ease: FlxEase.cubicOut,
                    });
                    defaultCamZoom = 0.8;
                    e.position.x = 360;
                    e.position.y = 360;
                }
            }
        }
    function onEvent(eventEvent) {
        if (eventEvent.event.name == "Camera Movement")
            {
                target2 = eventEvent.event.params[0];
                trace(target2);
            }
        }