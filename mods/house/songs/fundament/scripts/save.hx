function onSongEnd() {
    FlxG.save.data.fundamentLock = 'unlocked';
    FlxG.save.flush();
    trace(FlxG.save.data.fundamentLock);
}