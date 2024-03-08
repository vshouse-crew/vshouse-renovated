function onPlayerHit(e)
    {
        if(e.noteType == 'bullet_note')
            {
                e.animCancelled = true;
                e.showSplash = true;
                FlxG.sound.play(Paths.sound('bulletSound'));
                boyfriend.playAnim("shot");
                health = health + 0.2;
            }
    }
function onPlayerMiss(e) {
    if (e.noteType == "bullet_note") {
        e.healthGain -= 0.2;
        FlxG.sound.play(Paths.sound('bulletSound'));
        deleteNote(e.note); 
        }
    }
function onNoteCreation(e) {
    if(e.noteType == 'bullet_note')
        {
            if (!PlayState.opponentMode && e.strumLineID <= 0) e.note.wasGoodHit = true;
				e.noteSprite = "game/notes/bullet";
		}
}