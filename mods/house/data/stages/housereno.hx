var runOffset;
var tick:Int = 0;
var missLocked:Bool;

function create()
{
    runOffset = 0;
    tick = 0;
    stageMove();
}

function onSubstateOpen(substate) { //called when a substate is opened
    FlxG.drawFramerate = FlxG.updateFramerate = Options.framerate;
}
function onGameOver(e) {
    FlxG.drawFramerate = FlxG.updateFramerate = Options.framerate;
    }
    function stepHit(curStep) {
        if(curStep == 1503)
            {
        FlxTween.tween(boyfriend, {x: 1101}, 5, {ease: FlxEase.elasticInOut});
        FlxTween.tween(BFLegs, {x: 1064.5}, 5, {ease: FlxEase.elasticInOut});
            }
        if(curStep == 2047)
            {
        FlxTween.tween(boyfriend, {x: 2300}, 5, {ease: FlxEase.elasticInOut});
        FlxTween.tween(BFLegs, {x: 2300}, 5, {ease: FlxEase.elasticInOut});
        FlxTween.tween(dad, {x: 2300}, 5, {ease: FlxEase.elasticInOut});
        FlxTween.tween(legs, {x: 2300}, 5, {ease: FlxEase.elasticInOut});
            }
        }
        function onPlayerMiss(e) {
            if(!missLocked)
                {
            //         boyfriend.x = boyfriend.x - 50;
            //         BFLegs.x = BFLegs.x - 50;
            FlxTween.tween(boyfriend, {x: boyfriend.x - 50}, 0.1);
            FlxTween.tween(BFLegs, {x: BFLegs.x - 50}, 0.1);
            xx2 = xx2 - 50;
                }
        }
function stageMove()
    {
        new FlxTimer().start(1 / 75, function(tmr:FlxTimer)
            {
                if(FlxG.drawFramerate < 90)
                    {
                        FlxG.drawFramerate = FlxG.updateFramerate = 60;
                    }
                 else if(FlxG.drawFramerate < 150)
                    {
                        FlxG.drawFramerate = FlxG.updateFramerate = 120;
                    }
                else if(FlxG.drawFramerate < 210)
                    {
                       FlxG.drawFramerate = FlxG.updateFramerate = 180;
                    }
                else if(FlxG.drawFramerate > 240)
                    {
                       FlxG.drawFramerate = FlxG.updateFramerate = 240;
                    }
                tick = tick + 1;
                dad.y = Math.sin(tick * 100) * 20 + 80 - runOffset + 50;
                if(health < 99)
                   {
                       boyfriend.y = Math.sin(tick * 100) * 20 + 331.5;
                       BFLegs.y = Math.sin(tick * 100) * 20 + 585;
                   }
                stage.x = stage.x - 50;
                if(stage.x < -10000)
                    {
                    stage.x = 3000;
                    }
                    domki.x = domki.x - 50;
                    if(domki.x < -7000)
                        {
                            domki.x = 6178;
                        }
                        stageMove();
            });
    }