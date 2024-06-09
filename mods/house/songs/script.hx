import flixel.text.FlxText;
import flixel.util.FlxColor;
import funkin.backend.FunkinText;
import funkin.backend.utils.DiscordUtil;

var bgThing:FlxSprite;
var iconn:FlxSprite;
var funnitext:FunkinText;
var funnitext2:FunkinText;
var funnitext3:FunkinText;
var tween:FlxTween;
var tween2:FlxTween;
var tween3:FlxTween;
var tween4:FlxTween;
var tween5:FlxTween;
var tween6:FlxTween;
var tween7:FlxTween;
var tween8:FlxTween;
var tween9:FlxTween;
var curArtist;
var txtArtist:Array<Dynamic>;

function create() {
	txtArtist = ['Alien 86', 0];
	txtArtist = CoolUtil.coolTextFile(Paths.file('songs/' + curSong + '/artist.txt'));
	if(txtArtist[1] == null) txtArtist[1] = 100;

	trace(txtArtist);
	
	curArtist = 'Made By ' + txtArtist[0];
	// if(curSong == 'district') curArtist = 'Made By Kolze';
	// if(curSong == 'breathe') curArtist = 'Made By Fr4nk';
	// if(curSong == 'renovation') curArtist = 'Made By Bonky';
	// if(curSong == 'fundament') curArtist = 'Made By Fr4nk & Alien 86';
	// if(curSong == 'house') curArtist = 'Made By Top 10 Awesome';
	// not used cuz its now in the artist.txt file
	bgThing = new FlxSprite(-1050, 100).loadGraphic(Paths.image('watermark/blackscreen'));
	bgThing.alpha = 0.4;
	bgThing.scale.set(1, 0.2);
	bgThing.cameras = [camHUD];
	add(bgThing);

	if(curSong == 'dispute') iconn = new FlxSprite(-750, 300).loadGraphic(Paths.image('watermark/icons/houseangy'));	
	else if(curSong == 'renovation') iconn = new FlxSprite(-750, 300).loadGraphic(Paths.image('watermark/icons/housefury'));	
	else if(curSong == 'fundament') iconn = new FlxSprite(-750, 300).loadGraphic(Paths.image('watermark/icons/house2d'));	
	else if(curSong == 'multiversus') iconn = new FlxSprite(-750, 300).loadGraphic(Paths.image('watermark/icons/jake'));	
	else iconn = new FlxSprite(-750, 300).loadGraphic(Paths.image('watermark/icons/house'));
	iconn.cameras = [camHUD];
	add(iconn);
	
	funnitext = new FunkinText(-1050, 385, 0, "Now Playing..", 25, true);
	if(!downscroll)
		{
	funnitext.y = 320;
		}
	funnitext.borderSize = 3;
	funnitext.cameras = [camHUD];
	add(funnitext);

	funnitext2 = new FunkinText(-1050, 345, 0, curSong.substr(0, 1).toUpperCase() + curSong.substr(1), 45, true);
	if(!downscroll)
		{
	funnitext2.y = 345;
		}
	funnitext2.borderSize = 3;
	funnitext2.cameras = [camHUD];
	add(funnitext2);

	funnitext3 = new FunkinText(-1050, 320, 0, curArtist, 20, true);
	if(!downscroll)
		{
	funnitext3.y = 395;
		}
	funnitext3.borderSize = 3;
	funnitext3.cameras = [camHUD];
	add(funnitext3);
}

updateDiscordPresence = function(){
	DiscordUtil.changeSongPresence(detailsText, (paused ? "Paused - " : "") + SONG.meta.displayName + ' - ' + curArtist, null);
}

function onCountdown() {
	if(curSong != 'fundament')
		{
tween = FlxTween.tween(bgThing, {x: -500}, 1, {
		ease: FlxEase.cubeOut,
	});
tween2 = FlxTween.tween(iconn, {x: 320}, 1, {
		ease: FlxEase.cubeOut,
	});
	tween3 = FlxTween.tween(funnitext, {x: 50}, 1, {
		ease: FlxEase.cubeOut,
	});
		tween4 = FlxTween.tween(funnitext2, {x: txtArtist[1]}, 1, {
			ease: FlxEase.cubeOut,
		});
	
	tween5 = FlxTween.tween(funnitext3, {x: 25}, 1, {
		ease: FlxEase.cubeOut,
	});
	if(!downscroll)
		{
			tween3.cancel();
			tween4.cancel();
			tween5.cancel();
	tween3 = FlxTween.tween(funnitext3, {x: 25}, 1, {
		ease: FlxEase.cubeOut,
	});
	tween4 = FlxTween.tween(funnitext2, {x: txtArtist[1]}, 1, {
		ease: FlxEase.cubeOut,
	});
	tween5 = FlxTween.tween(funnitext, {x: 50}, 1, {
		ease: FlxEase.cubeOut,
	});
		}
	}
}

function stepHit(curStep) {
	if(curSong != 'fundament')
		{
if (curStep == 25)
	{
		tween = FlxTween.tween(bgThing, {x: -1050}, 1, {
			ease: FlxEase.cubeOut,
		});
		tween2 = FlxTween.tween(iconn, {x: -750}, 1, {
			ease: FlxEase.cubeOut,
		});
		tween3 = FlxTween.tween(funnitext, {x: -1050}, 1, {
			ease: FlxEase.cubeOut,
		});
		tween4 = FlxTween.tween(funnitext2, {x: -1050}, 1, {
			ease: FlxEase.cubeOut,
		});
		tween5 = FlxTween.tween(funnitext3, {x: -1050}, 1, {
			ease: FlxEase.cubeOut,
		});
	}
}
else 
	{
		if(curStep == 256)
			{
		tween = FlxTween.tween(bgThing, {x: -500}, 1, {
			ease: FlxEase.cubeOut,
		});
	tween2 = FlxTween.tween(iconn, {x: 320}, 1, {
			ease: FlxEase.cubeOut,
		});
		
			
		tween3 = FlxTween.tween(funnitext, {x: 50}, 1, {
			ease: FlxEase.cubeOut,
		});
			tween4 = FlxTween.tween(funnitext2, {x: txtArtist[1]}, 1, {
				ease: FlxEase.cubeOut,
			});
		
		tween5 = FlxTween.tween(funnitext3, {x: 25}, 1, {
			ease: FlxEase.cubeOut,
		});
		if(!downscroll)
			{
				tween3.cancel();
				tween4.cancel();
				tween5.cancel();
		tween3 = FlxTween.tween(funnitext3, {x: 25}, 1, {
			ease: FlxEase.cubeOut,
		});
		tween4 = FlxTween.tween(funnitext2, {x: txtArtist[1]}, 1, {
			ease: FlxEase.cubeOut,
		});
		tween5 = FlxTween.tween(funnitext, {x: 50}, 1, {
			ease: FlxEase.cubeOut,
		});
	}
	}
	if(curStep == 256 + 25)
		{
			tween = FlxTween.tween(bgThing, {x: -1050}, 1, {
				ease: FlxEase.cubeOut,
			});
			tween2 = FlxTween.tween(iconn, {x: -750}, 1, {
				ease: FlxEase.cubeOut,
			});
			tween3 = FlxTween.tween(funnitext, {x: -1050}, 1, {
				ease: FlxEase.cubeOut,
			});
			tween4 = FlxTween.tween(funnitext2, {x: -1050}, 1, {
				ease: FlxEase.cubeOut,
			});
			tween5 = FlxTween.tween(funnitext3, {x: -1050}, 1, {
				ease: FlxEase.cubeOut,
			});
		}
}

}
function beatHit(curBeat) {
		funnitext.angle = 2;
		tween6 = FlxTween.tween(funnitext, {angle: 0}, 0.2, {
			ease: FlxEase.circOut,
		});
		funnitext2.angle = -2;
		tween7 = FlxTween.tween(funnitext2, {angle: 0}, 0.2, {
			ease: FlxEase.circOut,
		});
		funnitext3.angle = -2;
		tween8 = FlxTween.tween(funnitext3, {angle: 0}, 0.2, {
			ease: FlxEase.circOut,
		});
		iconn.angle = 10;
		tween9 = FlxTween.tween(iconn, {angle: 0}, 0.2, {
			ease: FlxEase.circOut,
		});
}
