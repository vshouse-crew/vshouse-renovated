import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import funkin.backend.FunkinText;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxAxes;

public static var weekbgpng:FlxSprite;
var alreadyCalled:Bool;
var X:FlxAxes = 0x01;
var Y:FlxAxes = 0x10;
var XY:FlxAxes = 0x11;

function postCreate() {
for(diffSprite in difficultySprites)
	{
		diffSprite.visible = false;
	}
    leftArrow.visible = false;
	rightArrow.visible = false;
    weekBG.destroy();
}

function update(){
	if(alreadyCalled) weekbgpng.destroy();
	weekbgpng = new FlxSprite().loadGraphic(Paths.image('menus/storymenu/bgs/' + weeks[curWeek].id));
	weekbgpng.y = 56;
	weekbgpng.height = 400;
	weekbgpng.screenCenter(X);
	add(weekbgpng);
	alreadyCalled = true;
}
