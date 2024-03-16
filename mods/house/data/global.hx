import lime.graphics.Image;

static var initialized:Bool = false;

function new() {
if (FlxG.save.data.renovationLock == null) FlxG.save.data.renovationLock = 'locked';
if (FlxG.save.data.fundamentLock == null) FlxG.save.data.fundamentLock = 'locked';
if (FlxG.save.data.multiversusLock == null) FlxG.save.data.multiversusLock = 'locked';

    window.title = "Vs House";
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));
}

function preStateSwitch(){
    window.title = "Vs House";
	if (!initialized) {
		initialized = true;
		FlxG.game._requestedState = new ModState('customs/IntroState');
    }
}

public static function barrierOpenImage(){
    var imagesBarrier:Array<String> = [];
    imagesBarrier = CoolUtil.coolTextFile(Paths.txt('barrierImages'));
    FlxG.openURL(imagesBarrier[FlxG.random.int(1,imagesBarrier.length)], "_blank");
    trace(imagesBarrier);
}


