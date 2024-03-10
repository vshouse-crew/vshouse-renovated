function onSongEnd() {
    FlxG.save.data.multiversusLock = 'unlocked';
    FlxG.save.flush();
    trace(FlxG.save.data.multiversusLock);
}