function create(){
    boyfriend.icon = 'bf-awesome';
}

function postCreate(){
    missesTxt.visible = false;
    accuracyTxt.visible = false;
    healthBar.createFilledBar(FlxColor.fromRGB(255, 0, 0), FlxColor.fromRGB(0, 255, 0));
    health = health + 0.01;
    trace(boyfriend.icon);
}

function update(){
    lockedIn = true;
}

function onNoteCreation(event) {
    event.noteSprite = "game/notes/awesome_notes";
}

function onStrumCreation(event) {
    event.sprite = "game/notes/awesome_notes";
}

function onPlayerHit(e)
    {
        e.showSplash = false;
    }
function onDadHit(e){
    e.strumGlowCancelled = true;
}