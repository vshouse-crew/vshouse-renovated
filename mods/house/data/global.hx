import lime.graphics.Image;

function new() {
if (FlxG.save.data.renovationLock == null) FlxG.save.data.renovationLock = 'locked';
if (FlxG.save.data.fundamentLock == null) FlxG.save.data.fundamentLock = 'locked';
if (FlxG.save.data.multiversusLock == null) FlxG.save.data.multiversusLock = 'locked';

    window.title = "Vs House";
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('icon'))));
}

public static function barrierOpenImage(){
    var imagesBarrier:Array<String> = [];
    imagesBarrier = CoolUtil.coolTextFile(Paths.txt('barrierImages'));
    FlxG.openURL(imagesBarrier[FlxG.random.int(1,imagesBarrier.length)], "_blank");
    trace(imagesBarrier);
}


