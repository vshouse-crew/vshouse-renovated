import funkin.game.PlayState;
import funkin.game.StrumLine;
import funkin.game.NoteGroup;

var normalalpha = 1;

function onEvent(eventEvent) {
FlxTween.tween(dad, {alpha: 0}, eventEvent.event.params[0]);
}
