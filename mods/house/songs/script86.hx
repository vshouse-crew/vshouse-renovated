var curCamPos;
var xx = 520;
var yy = 450;
var xx2 = 820;
var yy2 = 520;
var ofs = 35;
var target = 0;

function postCreate()
    {
        target = 0;
        if(curSong == 'renovation')
        {
            yy = yy - 100;
            yy2 = yy2 - 100;
        }
		if(curSong == 'fundament')
			{
				yy = yy - 100;
				xx = xx + 50;
			}
        camFollow.x = xx;
        camFollow.y = yy;
        trace(target);
        trace(lockedIn);
    }

function update(elapsed)
    {
       
        curCameraTarget = -1;
        if(!lockedIn)
            {
                if(target == 0)
                    {
        if(dad.animation.curAnim.name == 'singUP')
            {
                camFollow.x = xx;
                camFollow.y = yy - ofs;
            }
            if(dad.animation.curAnim.name == 'singDOWN')
                {
                    camFollow.x = xx;
                    camFollow.y = yy + ofs;
                }
                if(dad.animation.curAnim.name == 'singRIGHT')
                    {
                        camFollow.x = xx + ofs;
                        camFollow.y = yy;
                    }
                    if(dad.animation.curAnim.name == 'singLEFT')
                        {
                            camFollow.x = xx - ofs;
                            camFollow.y = yy;
                        }
                        if(dad.animation.curAnim.name == 'idle')
                            {
                                camFollow.x = xx;
                                camFollow.y = yy;
                            }
                        }
                        else if(target == 1)
                            {
                                if(boyfriend.animation.curAnim.name == 'singUP')
                                    {
                                        camFollow.x = xx2;
                                        camFollow.y = yy2 - ofs;
                                    }
                                    if(boyfriend.animation.curAnim.name == 'singDOWN')
                                        {
                                            camFollow.x = xx2;
                                            camFollow.y = yy2 + ofs;
                                        }
                                        if(boyfriend.animation.curAnim.name == 'singRIGHT')
                                            {
                                                camFollow.x = xx2 + ofs;
                                                camFollow.y = yy2;
                                            }
                                            if(boyfriend.animation.curAnim.name == 'singLEFT')
                                                {
                                                    camFollow.x = xx2 - ofs;
                                                    camFollow.y = yy2;
                                                }
                                                if(boyfriend.animation.curAnim.name == 'idle')
                                                    {
                                                        camFollow.x = xx2;
                                                        camFollow.y = yy2;
                                                    }
                            }

                    }

                    
                        
    }
      function onEvent(eventEvent) {
        if (eventEvent.event.name == "Camera Movement")
            {
                target = eventEvent.event.params[0];
                trace(target);
            }
        }
