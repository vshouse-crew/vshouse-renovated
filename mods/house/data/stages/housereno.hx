var runOffset;
var tick:Int == 0;

function create()
{
    runOffset = 0;
    tick = 0;
}

    function update(elapsed)
    {
        tick = tick + 1;
        trace(tick);
        FlxG.drawFramerate = FlxG.updateFramerate = 60;
        dad.y = Math.sin(tick * 100) * 20 + 80 - runOffset + 125;
        if(health < 99)
           {
               boyfriend.y = Math.sin(tick * 100) * 20 + 425;
               BFLegs.y = Math.sin(tick * 100) * 20 + 670;
           }
        stage.x = stage.x - 50;
        if(stage.x < -10000)
            {
            stage.x = 3000;
            }
            domki.x = domki.x - 50;
            if(domki.x < -8000)
                {
                    domki.x = 6178;
                }
    }
    function onSongEnd() {
        FlxG.drawFramerate = FlxG.updateFramerate = 240;
    }
    function onGameOver(e) {
        FlxG.drawFramerate = FlxG.updateFramerate = 240;
    }
    function onSubstateOpen(substate) { 
        FlxG.drawFramerate = FlxG.updateFramerate = 240;
    }
    function stepHit(curStep) {
        if(curStep == 2047)
            {
        FlxTween.tween(boyfriend, {x: 2300}, 5, {ease: FlxEase.elasticInOut});
        FlxTween.tween(BFLegs, {x: 2300}, 5, {ease: FlxEase.elasticInOut});
        FlxTween.tween(dad, {x: 2300}, 5, {ease: FlxEase.elasticInOut});
        FlxTween.tween(legs, {x: 2300}, 5, {ease: FlxEase.elasticInOut});
            }
        }