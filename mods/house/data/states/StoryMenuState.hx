import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import funkin.backend.FunkinText;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;

function postCreate() {
    @:access(funkin.menus.StoryMenuState)StoryMenuState.rightArrow.alpha = 0;
    StoryMenuState.leftArrow.visible = false;
}