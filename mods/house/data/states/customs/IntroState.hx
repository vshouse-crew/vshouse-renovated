import hxvlc.flixel.FlxVideo;

function postCreate(){
var video:FlxVideo = new FlxVideo();
video.x = video.x + 50;
video.y = video.y - 40;
video.onEndReached.add(video.dispose);
video.load(Assets.getPath(Paths.video("intro")));
new FlxTimer().start(0.001, function(tmr:FlxTimer) {
    video.play();
    new FlxTimer().start(13.03, function(tmr:FlxTimer) {
        FlxG.switchState(new TitleState());
    });
});
}