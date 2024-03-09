function onSongEnd() {
    FlxG.save.data.renovationLock = 'unlocked';
    FlxG.save.flush();
    trace(FlxG.save.data.renovationLock);
}