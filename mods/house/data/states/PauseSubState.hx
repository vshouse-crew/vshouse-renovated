function selectOption() {
	var daSelected:String = event.name;

	switch (daSelected)
	{
		case "Resume":
			FlxG.drawFramerate = FlxG.updateFramerate = 60;
	}
}