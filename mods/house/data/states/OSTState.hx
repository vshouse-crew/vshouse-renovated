import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.text.FlxText.FlxTextAlign;

var infoText:FlxText;
var Y:FlxAxes = 0x10;
var X:FlxAxes = 0x01;
var XY:FlxAxes = 0x11;

function create()
	{
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/menuBG'));
        bg.scrollFactor.set();
        add(bg);

		var top10wspaniale:FlxSprite = new FlxSprite().loadGraphic(Paths.image('icons/house-awesome'));
        top10wspaniale.scrollFactor.set();
		top10wspaniale.screenCenter(X);
        add(top10wspaniale);

		infoText = new FlxText(0, 0, FlxG.width, "ost sie zesralo w galoty\ntym razem mozna wyjsc pod esc xddd\nczekamy az super kolega golze zrobi nowe ost", 32);
		infoText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE);
		infoText.alignment = FlxTextAlign.CENTER;
		infoText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
		infoText.screenCenter(Y);
		add(infoText);
	}

function update() {

	if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'), 0.4);
			FlxG.switchState(new MainMenuState());
		}

}