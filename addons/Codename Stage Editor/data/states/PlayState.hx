
function create()
        switch (curSong.toLowerCase())
        {
            case 'expurgation':
                camFollow.setPosition(dad.getMidpoint().x + 150, dad.getMidpoint().y - 100);
                var spawnAnim = new FlxSprite(-150,-380);
                spawnAnim.frames = Paths.getSparrowAtlas('tricky/EXENTER');

                spawnAnim.animation.addByPrefix('start','Entrance',24,false);

                add(spawnAnim);

                spawnAnim.animation.play('start');
                var p = new FlxSound().loadEmbedded(Paths.sound("Trickyspawn"));
                var pp = new FlxSound().loadEmbedded(Paths.sound("TrickyGlitch"));
                p.play();
                spawnAnim.animation.finishCallback = function(pog:String)
                    {
                        pp.fadeOut();
                        dad.visible = true;
                        remove(spawnAnim);
                        startCountdown();
                    }
                new FlxTimer().start(0.001, function(tmr:FlxTimer)
                    {
                        if (spawnAnim.animation.frameIndex == 24)
                        {
                            pp.play();
                        }
                        else
                            tmr.reset(0.001);
                    });
        }
