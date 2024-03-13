import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import funkin.backend.FunkinText;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;

function postCreate() {
for(diffSprite in difficultySprites)
	{
		diffSprite.visible = false;
	}
    leftArrow.visible = false;
	rightArrow.visible = false;
	
}