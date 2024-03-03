import funkin.game.PlayState;

var Cameraman = 0;

function create() {
FlxTween.tween(PlayState.camGame, {zoom: 0.9}, 0.5, {ease: FlxEase.quadInOut});
}