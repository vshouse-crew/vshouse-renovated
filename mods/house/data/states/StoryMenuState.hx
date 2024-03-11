import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import funkin.backend.FunkinText;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;

function postCreate() {
	
	black = new FlxSprite(leftArrow.x, leftArrow.y).makeGraphic(500, 100, 0xFF000000);
	add(black);

    leftArrow.visible = false;
	rightArrow.visible = false;
	
}